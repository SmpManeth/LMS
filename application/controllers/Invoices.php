<?php
defined('BASEPATH') or exit('No direct script access allowed');
require_once APPPATH . 'libraries/fpdf/fpdf.php';
class Invoices extends Admin_Controller
{

    private $amounts = [
        'EI' => 32000,
        'GI' => 50000,
        'MG' => 70000,
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
            // Search for records based
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

    // get all invoice records
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

        if($record){
            redirect(base_url('/invoices/print/' . $record));

        }
    }

    public function print($id)
    {
        $record = $this->Invoice_records_model->find($id)[0];

        $pdf = new FPDF();
        $pdf->AddPage('L', [210, 297 / 2]);   

        // Set font and size for the cells
        $pdf->SetFont('Arial', '', 14);

        // Define column width and spacing
        $col1X = 10; // X-coordinate of the first column
        $col2X = 110; // X-coordinate of the second column
        $colWidth = 90; // Width of each column
        $lineHeight = 15; // Height of each line

        $amount = $record->discount ? ($record->amount - ($record->discount / 100) * $record->amount) : $record->amount;


        // Data to be displayed as key-value pairs
        $recordData = [
            'Reference ' => $record->reference_number,
            'Name' => $record->first_name . ' ' . $record->last_name,
            'Registration No' => $record->student_reg_no,
            'Payment Type' => $record->payment_type,
            'Payment Method' => $record->payment_method,
            'Amount' => '$' . number_format($amount, 2),
            'Discount' => number_format($record->discount, 2) . "%",
            'Timestamp' => $record->timestamp,
        ];

        // Loop through the data and display two key-value pairs per row
        $keys = array_keys($recordData);
        $values = array_values($recordData);

        for ($i = 0; $i < count($recordData); $i += 2) {
            // Display the first key-value pair in the first column
            $pdf->SetX($col1X);
            $pdf->Cell($colWidth, $lineHeight, $keys[$i] . ': ' . $values[$i], 0);

            // Display the second key-value pair in the second column
            $pdf->SetX($col2X);
            if ($i + 1 < count($recordData)) {
                $pdf->Cell($colWidth, $lineHeight, $keys[$i + 1] . ': ' . $values[$i + 1], 0);
            }

            // Move to the next line
            $pdf->Ln();
        }
        // Output the PDF
        $pdf->Output();
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
