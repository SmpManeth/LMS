<?php
defined('BASEPATH') or exit('No direct script access allowed');
use \setasign\Fpdi\Fpdi;
require_once APPPATH . 'libraries/fpdf/fpdf.php';
require_once APPPATH . 'libraries/fpdi2/src/autoload.php';

class Invoices extends Admin_Controller
{

    private $amounts = [
        'EI' => 32000,
        'GI' => 50000,
        'MG' => 70000,
    ];

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
        $this->load->model('Student_model');
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

        $data['title'] = 'All Invoices';
        $data['records'] = $records;
        $data['student'] = $student[0];
        $data['course_full_amount'] = $this->amounts[$student[0]['coursecode']] ?? 30000;

        $this->load->view('layout/header', $data);
        $this->load->view('invoices/student', $data);
        $this->load->view('layout/footer', $data);
    }

    public function create()
    {

        // Validation succeeded, process the payment data
        $data = array();
        $data['student_id'] = $this->input->post('student_id');
        $data['staff_id'] = $this->customlib->getUserData()['id'];
        $data['payment_type'] = $this->input->post('payment_type');
        $data['payment_method'] = $this->input->post('payment_method');
        $data['amount'] = $this->input->post('amount');
        $data['discount'] = $this->input->post('payment_type') == "full" ? $this->input->post('discount') : 0;
        $record = $this->Invoice_records_model->create($data);

        if ($record) {
            redirect(base_url('/invoices/print/' . $record));
        }
    }

    public function print($id)
    {

        $record = $this->Invoice_records_model->find($id)[0];
        $amount = $record->discount ? ($record->amount - ($record->discount / 100) * $record->amount) : $record->amount;
        
        $recordData = [
            'reference' => $record->reference_number,
            'name' => $record->first_name . ' ' . $record->last_name,
            'student_reg_no' => $record->student_reg_no,
            'coursecode' => $record->coursecode,
            'payment_type' => $record->payment_type,
            'payment_method' => $record->payment_method,
            'Amount' => '$' . number_format($amount, 2),
            'Discount' => number_format($record->discount, 2) . "%",
            'Date & Time' => $record->timestamp,
        ];

        $pdf = new Fpdi();
        $pdf->AddPage('P', 'A5');
        $pdf->setSourceFile("uploads/invoicing/template.pdf");

        $template_page = $pdf->importPage(1);
        $pdf->useImportedPage($template_page, 0, 0);

        $pdf->SetFont('Helvetica', '', 12);
        $pdf->SetTextColor(50, 50, 100);

        $pdf->SetXY(29, 47);
        $pdf->Write(0, $record->reference_number);

        $pdf->SetXY(96, 47);
        $pdf->Write(0, $record->timestamp);

        $pdf->SetXY(21, 59);
        $pdf->Write(0, $record->first_name . ' ' . $record->last_name);

        $pdf->SetXY(24, 71);
        $pdf->Write(0, $record->student_reg_no);

        $pdf->SetXY(79, 71);
        $pdf->Write(0, $record->phone);

        $pdf->SetXY(22, 83);
        $pdf->Write(0, $record->coursecode);

        $pdf->SetXY(108, 83);
        $pdf->Write(0, number_format($record->bandscore, 2));

        $pdf->SetXY(35 , 103);
        $pdf->Write(0,  $this->payment_types[$record->payment_type]);

        $pdf->SetXY(41 , 115);
        $pdf->Write(0,  $this->payment_methods[$record->payment_method]);

        $pdf->SetXY(34, 127);
        $pdf->Write(0,  number_format($record->amount,2) . ' LKR');

        $pdf->SetXY(33, 139);
        $pdf->Write(0,  number_format($record->discount,2) . '%');

        $pdf->SetXY(47, 151);
        $pdf->Write(0,  number_format($amount,2) . ' LKR');

        $pdf->SetXY(33, 170);
        $pdf->Write(0, $record->staff_first_name . ' ' . $record->staff_last_name);

        $pdf->Output('',$record->reference_number);
    }

    public function delete($id)
    {
        $this->Invoice_records_model->delete($id);
        $previous_url = $this->input->server('HTTP_REFERER');
        if ($previous_url) {
            redirect($previous_url);
        } else {
            redirect(base_url('/invoices/all'));
        }
    }
}
