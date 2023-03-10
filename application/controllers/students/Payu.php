<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Payu extends Student_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->setting = $this->setting_model->get();
    }

    public function index()
    {
        $this->session->set_userdata('top_menu', 'Library');
        $this->session->set_userdata('sub_menu', 'book/index');
        $pre_session_data           = $this->session->userdata('params');
        $txnid                      = substr(hash('sha256', mt_rand() . microtime()), 0, 20);
        $pre_session_data['txn_id'] = $txnid;
        $this->session->set_userdata("params", $pre_session_data);
        $session_data                   = $this->session->userdata('params');
        $session_data['name']           = ($session_data['name'] != "") ? $session_data['name'] : "noname";
        $session_data['email']          = ($session_data['email'] != "") ? $session_data['email'] : "noemail@gmail.com";
        $session_data['guardian_phone'] = ($session_data['guardian_phone'] != "") ? $session_data['guardian_phone'] : "0000000000";
        $session_data['address']        = ($session_data['address'] != "") ? $session_data['address'] : "noaddress";
        $pay_method                     = $this->paymentsetting_model->getActiveMethod();
        //payumoney details
        $amount           = round(number_format((float) ($session_data['fine_amount_balance'] + $session_data['total']), 2, '.', ''));
        $customer_name    = $session_data['name'];
        $customer_emial   = $session_data['email'];
        $customer_mobile  = $session_data['guardian_phone'];
        $customer_address = $session_data['address'];

        $product_info = 'Online Fees Payment';
        $MERCHANT_KEY = $pay_method->api_secret_key;
        $SALT         = $pay_method->salt;

        //optional udf values
        $udf1 = '';
        $udf2 = '';
        $udf3 = '';
        $udf4 = '';
        $udf5 = '';

        $hashstring = $MERCHANT_KEY . '|' . $txnid . '|' . $amount . '|' . $product_info . '|' . $customer_name . '|' . $customer_emial . '|' . $udf1 . '|' . $udf2 . '|' . $udf3 . '|' . $udf4 . '|' . $udf5 . '||||||' . $SALT;
        $hash       = strtolower(hash('sha512', $hashstring));

        $success = base_url('students/payu/success');
        $fail    = base_url('students/payu/success');
        $cancel  = base_url('students/payu/success');
        $data    = array(
            'mkey'                      => $MERCHANT_KEY,
            'tid'                       => $txnid,
            'hash'                      => $hash,
            'amount'                    => $amount,
            'student_fees_master_array' => $session_data['student_fees_master_array'],
            'name'                      => $customer_name,
            'productinfo'               => $product_info,
            'mailid'                    => $customer_emial,
            'phoneno'                   => $customer_mobile,
            'address'                   => $customer_address,
            'action'                    => "https://secure.payu.in", //for live change action  https://secure.payu.in
            'sucess'                    => $success,
            'failure'                   => $fail,
            'cancel'                    => $cancel,
        );
        $data['session_data'] = $session_data;
        $data['setting']      = $this->setting;

        $this->load->view('student/payu', $data);
    }

    public function checkout()
    {

        $this->form_validation->set_rules('firstname', 'Customer Name', 'required|trim|xss_clean');
        $this->form_validation->set_rules('phone', 'Mobile No', 'required|trim|xss_clean');
        $this->form_validation->set_rules('email', 'Email', 'required|valid_email|trim|xss_clean');
        $this->form_validation->set_rules('amount', 'Amount', 'required|trim|xss_clean');

        if ($this->form_validation->run() == false) {
            $data = array(
                'firstname' => form_error('firstname'),
                'phone'     => form_error('phone'),
                'email'     => form_error('email'),
                'amount'    => form_error('amount'),
            );
            $array = array('status' => 'fail', 'error' => $data);
            echo json_encode($array);
        } else {

            $array = array('status' => 'success', 'error' => '');
            echo json_encode($array);
        }
    }

    public function success()
    {
        if ($this->input->server('REQUEST_METHOD') == 'POST') {
            $session_data = $this->session->userdata('params');

            if ($this->input->post('status') == "success") {
                $mihpayid      = $this->input->post('mihpayid');
                $transactionid = $this->input->post('txnid');
                $txn_id        = $session_data['txn_id'];

                if ($txn_id == $transactionid) {
                    $bulk_fees = array();
                    $params    = $this->session->userdata('params');

                    foreach ($params['student_fees_master_array'] as $fee_key => $fee_value) {

                        $json_array = array(
                            'amount'          => $fee_value['amount_balance'],
                            'date'            => date('Y-m-d'),
                            'amount_discount' => 0,
                            'amount_fine'     => $fee_value['fine_balance'],
                            'description'     => "Online fees deposit through PayU TXN ID: " . $txn_id . " PayU Ref ID: " . $mihpayid,
                            'received_by'     => '',
                            'payment_mode'    => 'PayU',
                        );

                        $insert_fee_data = array(
                            'student_fees_master_id' => $fee_value['student_fees_master_id'],
                            'fee_groups_feetype_id'  => $fee_value['fee_groups_feetype_id'],
                            'amount_detail'          => $json_array,
                        );
                        $bulk_fees[] = $insert_fee_data;
                        //========
                    }
                    $send_to     = $params['guardian_phone'];
                    $inserted_id = $this->studentfeemaster_model->fee_deposit_bulk($bulk_fees, $send_to);
                    if ($inserted_id) {
                        redirect(base_url("students/payment/successinvoice"));
                    } else {
                        redirect(base_url('students/payment/paymentfailed'));
                    }

                } else {
                    redirect(base_url('students/payment/paymentfailed'));
                }
            } else {

                redirect(base_url('students/payment/paymentfailed'));
            }
        }
    }

}
