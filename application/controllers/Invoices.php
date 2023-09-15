<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Invoices extends Admin_Controller {

    public function __construct()
    {
        parent::__construct();
        // Load the Invoice_records_model
        $this->load->model('Invoice_records_model');
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
}
