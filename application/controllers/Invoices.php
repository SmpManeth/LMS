<?php
defined('BASEPATH') or exit('No direct script access allowed');

use \setasign\Fpdi\Fpdi;

require_once APPPATH . 'libraries/fpdf/fpdf.php';
require_once APPPATH . 'libraries/fpdi2/src/autoload.php';

class Invoices extends Admin_Controller
{
    private $payment_types = [
        'advance' => 'Advance',
        'first_installment' => 'First Installment',
        'second_installment' => 'Second Installment',
        'full' => 'Full'
    ];

    private $payment_methods = [
        'cash' => 'Cash',
        'bank_transfer' => 'Bank Transfer',
        'cheque' => 'Cheque',
        'card' => 'Card',
        'other' => 'Other'
    ];


    public function __construct()
    {
        parent::__construct();
        // Load the Invoice_records_model
        $this->load->model('Invoice_records_model');
        $this->load->model('Invoice_course_amounts_model');
        $this->load->model('Student_model');
        $this->load->model("Section_model");
    }

    // get all invoice records
    public function all()
    {
        if (!$this->rbac->hasPrivilege('student', 'can_view')) {

            access_denied();
        }

        $this->session->set_userdata('top_menu', 'Invoices');
        $this->session->set_userdata('sub_menu', 'invoices/all');

        $search = $this->input->get('search') ?? null;

        if ($search) {
            // Search for records based on the search term
            $records = $this->Invoice_records_model->search($search);
        } else {
            // Call the model to get all records
            $records = $this->Invoice_records_model->all();
        }

        $data['title'] = 'All Invoices';
        $data['records'] = $records;
        $data['payment_types'] = $this->payment_types;
        $data['payment_methods'] = $this->payment_methods;

        $this->load->view('layout/header', $data);
        $this->load->view('invoices/all', $data);
        $this->load->view('layout/footer', $data);
    }

    // get invoice records based on student id
    public function student($student_id)
    {

        if (!$this->rbac->hasPrivilege('student', 'can_view')) {

            access_denied();
        }

        // Set selected menu to none
        $this->session->set_userdata('top_menu', '');
        $this->session->set_userdata('sub_menu', '');

        // Call the model to get all records
        $records = $this->Invoice_records_model->find_by_student_id($student_id);
        $student = $this->Student_model->get($student_id);

        // Get full course amount for the student
        $course_full_amount = $this->Invoice_course_amounts_model->find_by_coursecode_bandscore($student[0]['coursecode'], $student[0]['bandscore']);

        if (!$course_full_amount) {
            $course_full_amount = $this->Invoice_course_amounts_model->find_by_coursecode_bandscore($student[0]['coursecode'], 0.0);
        }

        $data['title'] = 'All Invoices';
        $data['records'] = $records;
        $data['student'] = $student[0];
        $data['course_full_amount'] = $course_full_amount->amount;
        $data['payment_types'] = $this->payment_types;
        $data['payment_methods'] = $this->payment_methods;

        $this->load->view('layout/header', $data);
        $this->load->view('invoices/student', $data);
        $this->load->view('layout/footer', $data);
    }

    public function create()
    {
        if (!$this->rbac->hasPrivilege('student', 'can_view')) {

            access_denied();
        }

        $student = $this->Student_model->get($this->input->post('student_id'));

        // Get full course amount for the student
        $course_full_amount = $this->Invoice_course_amounts_model->find_by_coursecode_bandscore($student[0]['coursecode'], $student[0]['bandscore']);
        if (!$course_full_amount) {
            $course_full_amount = $this->Invoice_course_amounts_model->find_by_coursecode_bandscore($student[0]['coursecode'], 0.0);
        }

        $data['student_id'] = $this->input->post('student_id');
        $data['staff_id'] = $this->customlib->getUserData()['id'];
        $data['payment_type'] = $this->input->post('payment_type');
        $data['payment_method'] = $this->input->post('payment_method');
        $data['amount'] = $this->input->post('payment_type') == "full" ? $course_full_amount->amount : $this->input->post('amount');
        $data['discount'] = $this->input->post('payment_type') == "full" ? $this->input->post('discount') : 0;
        $data['notes'] = $this->input->post('notes');
        $record = $this->Invoice_records_model->create($data);

        if ($record) {
            redirect(base_url('/invoices/print/' . $record));
        }
    }

    public function print($id)
    {
        if (!$this->rbac->hasPrivilege('student', 'can_view')) {

            access_denied();
        }

        $record = $this->Invoice_records_model->find($id)[0];
        $discounted_amount = $record->discount ? ($record->amount - ($record->discount / 100) * $record->amount) : $record->amount;

        // Get full course amount for the student
        $course_full_amount = $this->Invoice_course_amounts_model->find_by_coursecode_bandscore($record->coursecode, $record->bandscore);
        if (!$course_full_amount) {
            $course_full_amount = $this->Invoice_course_amounts_model->find_by_coursecode_bandscore($record->coursecode, 0.0);
        }
        
        $course_section = $this->Section_model->getByCourseCode($record->coursecode);

        $timestamp_converted = $this->customlib->convertTimezone($record->timestamp, 'Asia/Colombo');

        $pdf = new Fpdi();
        $pdf->AddPage('P', 'A5');
        $pdf->setSourceFile("uploads/invoicing/template.pdf");

        $template_page = $pdf->importPage(1);
        $pdf->useImportedPage($template_page, 0, 0);

        $pdf->SetFont('Helvetica', '', 11);
        $pdf->SetTextColor(50, 50, 75);

        $pdf->SetXY(30, 52);
        $pdf->Write(0, $record->reference_number);

        $pdf->SetXY(91, 52);
        $pdf->Write(0, $timestamp_converted);

        $pdf->SetXY(30, 61);
        $pdf->Write(0, $record->first_name . ' ' . $record->last_name);

        $pdf->SetXY(30, 69);
        $pdf->Write(0, $record->student_reg_no);

        $pdf->SetXY(91, 69);
        $pdf->Write(0, $record->phone);

        $pdf->SetXY(30, 78);
        $pdf->Write(0, $course_section->section . ' - ' . $record->coursecode);

        // $pdf->SetXY(108, 78);
        // $pdf->Write(0, number_format($record->bandscore, 2));

        $pdf->SetXY(30, 94);
        $pdf->Write(0,  $this->payment_types[$record->payment_type]);

        // $this->payment_methods[$record->payment_method]
        switch ($record->payment_method) {
            case 'cash':
                $pdf->SetXY(39.25, 104);
                $pdf->Write(0, 'X');
                break;
            case 'card':
                $pdf->SetXY(56.5, 104);
                $pdf->Write(0, 'X');
                break;
            case 'cheque':
                $pdf->SetXY(73.5, 104);
                $pdf->Write(0, 'X');
                break;
            case 'bank_transfer':
                $pdf->SetXY(95, 104);
                $pdf->Write(0, 'X');
                break;
            default:
                $pdf->SetXY(125, 104);
                $pdf->Write(0, 'X');
                break;
        }

        // COURSE FEE
        $pdf->SetXY(30, 112);
        $pdf->Write(0,  number_format($course_full_amount->amount, 2) . ' LKR');

        $pdf->SetXY(91, 112);
        $pdf->Write(0,  number_format($record->amount, 2) . ' LKR');

        $pdf->SetXY(30, 120);
        $pdf->Write(0,  number_format($record->discount, 2) . '%');

        $pdf->SetXY(91, 120);
        $pdf->Write(0,  number_format($discounted_amount, 2) . ' LKR');

        $pdf->SetXY(10, 145);
        $pdf->Write(5, $record->notes);

        $pdf->SetXY(30, 171);
        $pdf->Write(0, $record->staff_first_name . ' ' . $record->staff_last_name);

        $pdf->Output('', $record->reference_number);
    }

    public function delete($id)
    {
        if (!$this->rbac->hasPrivilege('student', 'can_view')) {

            access_denied();
        }
        $this->Invoice_records_model->delete($id);
        $previous_url = $this->input->server('HTTP_REFERER');
        if ($previous_url) {
            redirect($previous_url);
        } else {
            redirect(base_url('/invoices/all'));
        }
    }
}
