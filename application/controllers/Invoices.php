<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Invoices extends Admin_Controller {

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

        if($search){
            // Search for records based
            $records = $this->Invoice_records_model->search($search);
        } else{
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

    public function create(){

        // Validation succeeded, process the payment data
        $data = array();
        $data['student_id'] = $this->input->post('student_id');
        $data['staff_id'] = $this->customlib->getUserData()['id'];
        $data['payment_type'] = $this->input->post('payment_type');
        $data['payment_method'] = $this->input->post('payment_method');
        $data['amount'] = $this->input->post('amount');
        $data['discount'] = $this->input->post('payment_type') == "full" ? $this->input->post('discount') : 0;

        $record = $this->Invoice_records_model->create($data);

        // Convert the POST data array to a JSON string
        $jsonData = json_encode($record);

        // Output the JSON data
        $this->output->set_content_type('application/json');
        $this->output->set_output($jsonData);

        // Return to previous page
        $previous_url = $this->input->server('HTTP_REFERER');
        if($previous_url){
            redirect($previous_url);
        } else{
            redirect(base_url('invoices/student/' . $data['student_id']));
        }
    }

    public function delete($id){
        $this->Invoice_records_model->delete($id);
        $previous_url = $this->input->server('HTTP_REFERER');
        if($previous_url){
            redirect($previous_url);
        } else{
            redirect(base_url('/invoices/all'));
        }
    }
}
