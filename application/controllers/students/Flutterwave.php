<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Flutterwave extends Student_Controller {

    public $api_config = "";

    public function __construct() {
        parent::__construct();

        $api_config = $this->paymentsetting_model->getActiveMethod();
        $this->setting = $this->setting_model->get();
    }

    public function index() {

        $data = array();
        $data['params'] = $this->session->userdata('params');
        $data['setting'] = $this->setting;
        $data['api_error'] = array();
        $data['student_data'] = $this->student_model->get($data['params']['student_id']);
        $data['student_fees_master_array']=$data['params']['student_fees_master_array'];
        $this->load->view('student/flutterwave/index', $data);
    }

    public function pay() {
        $this->form_validation->set_rules('phone', $this->lang->line('phone'), 'trim|required|xss_clean');
        $this->form_validation->set_rules('email', $this->lang->line('email'), 'trim|required|xss_clean');

        if ($this->form_validation->run() == false) {
            $data = array();
            $data['params'] = $this->session->userdata('params');
            $data['setting'] = $this->setting;
            $data['api_error'] = $data['api_error'] = array();
            $data['student_data'] = $this->student_model->get($data['params']['student_id']);
            $this->load->view('student/flutterwave/index', $data);
        } else {


            $details = $this->paymentsetting_model->getActiveMethod();
            $api_secret_key = $details->api_secret_key;
            $api_publishable_key = $details->api_publishable_key;

            $params = $this->session->userdata('params');
            $data = array();
            $student_id = $params['student_id'];
            $data['total'] =number_format((float)($params['fine_amount_balance']+$params['total']), 2, '.', '');
            $data['symbol'] = $params['invoice']->symbol;
            $data['currency_name'] = $params['invoice']->currency_name;
            $data['name'] = $params['name'];
            $data['guardian_phone'] = $params['guardian_phone'];

            $curl = curl_init();
            $customer_email = $_POST['email'];
            $currency = $data['currency_name'];
            $txref = "rave" . uniqid(); // ensure you generate unique references per transaction.
            // get your public key from the dashboard.
            $PBFPubKey = $api_publishable_key; 
            $redirect_url = base_url() . 'students/flutterwave/success'; // Set your own redirect URL


            curl_setopt_array($curl, array(
              CURLOPT_URL => "https://api.ravepay.co/flwv3-pug/getpaidx/api/v2/hosted/pay",
              CURLOPT_RETURNTRANSFER => true,
              CURLOPT_CUSTOMREQUEST => "POST",
              CURLOPT_POSTFIELDS => json_encode([
                'amount'=>$data['total'],
                'customer_email'=>$customer_email,
                'currency'=>$currency,
                'txref'=>$txref,
                'PBFPubKey'=>$PBFPubKey,
                'redirect_url'=>$redirect_url,
              ]),
              CURLOPT_HTTPHEADER => [
                "content-type: application/json",
                "cache-control: no-cache"
              ],
            ));

            $response = curl_exec($curl);
            $err = curl_error($curl);

            if($err){
              // there was an error contacting the rave API
              die('Curl returned error: ' . $err);
            }

            $transaction = json_decode($response);

            if(!$transaction->data && !$transaction->data->link){
              // there was an error from the API
              print_r('API returned error: ' . $transaction->message);
            }

            // redirect to page so User can pay

            header('Location: ' . $transaction->data->link);
            
        }
    }
 
    public function success() {
        $details = $this->paymentsetting_model->getActiveMethod();
        $api_secret_key = $details->api_secret_key;
        $params = $this->session->userdata('params');
       if (isset($_GET['txref'])) {
        if(isset($_GET['cancelled']) && $_GET['cancelled']=='true'){
redirect(base_url("students/payment/paymentfailed"));
        }else{
        $ref = $_GET['txref'];
        $amount=number_format((float)($params['fine_amount_balance']+$params['total']), 2, '.', ''); //Get the correct amount of your product
        $currency = $params['invoice']->currency_name;; //Correct Currency from Server

        $query = array(
            "SECKEY" => $api_secret_key,
            "txref" => $ref
        );

        $data_string = json_encode($query);
                
        $ch = curl_init('https://api.ravepay.co/flwv3-pug/getpaidx/api/v2/verify');                                                                      
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data_string);                                              
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type: application/json'));

        $response = curl_exec($ch);

        $header_size = curl_getinfo($ch, CURLINFO_HEADER_SIZE);
        $header = substr($response, 0, $header_size);
        $body = substr($response, $header_size);

        curl_close($ch);
 
        $resp = json_decode($response, true);

        $paymentStatus = $resp['data']['status'];
        $chargeResponsecode = $resp['data']['chargecode'];
        $chargeAmount = $resp['data']['amount'];
        $chargeCurrency = $resp['data']['currency'];
        $txid= $resp['data']['txref'];
        if (($chargeResponsecode == "00" || $chargeResponsecode == "0") && ($chargeAmount == $amount)  && ($chargeCurrency == $currency)) {
          // transaction was successful...
          // please check other things like whether you already gave value for this ref
          // if the email matches the customer who owns the product etc
          //Give Value and return to Success page
            $payment_id = $txid; 
            $bulk_fees=array();
            $params     = $this->session->userdata('params');
         
            foreach ($params['student_fees_master_array'] as $fee_key => $fee_value) {
           
             $json_array = array(
                'amount'          =>  $fee_value['amount_balance'],
                'date'            => date('Y-m-d'),
                'amount_discount' => 0,
                'amount_fine'     => $fee_value['fine_balance'],
                'description'     => "Online fees deposit through Flutterwave TXN ID: " . $payment_id,
                'received_by'     => '',
                'payment_mode'    => 'Flutter_wave',
            );

            $insert_fee_data = array(
                'student_fees_master_id' => $fee_value['student_fees_master_id'],
                'fee_groups_feetype_id'  => $fee_value['fee_groups_feetype_id'],
                'amount_detail'          => $json_array,
            );                 
           $bulk_fees[]=$insert_fee_data;
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
           redirect(base_url("students/payment/paymentfailed"));
        } 
        }
       
    }
        else {
      die('No reference supplied');
    }
    }

}
