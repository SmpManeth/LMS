<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Jazzcash extends Student_Controller {

    public $api_config = "";

    function __construct() {
        parent::__construct();
        $this->api_config = $this->paymentsetting_model->getActiveMethod();
        $this->setting = $this->setting_model->get();
    }

    public function index() {

        $params = $this->session->userdata('params');
        $data = array();
        $data['params'] = $params;
        $data['setting'] = $this->setting;
        $data['api_error'] = array();
        $student_id = $params['student_id'];
        $total = number_format((float)($params['fine_amount_balance']+$params['total']), 2, '.', '');;
        $data['name'] = $params['name'];
        $data['title'] = 'Student Fee';
        $data['total'] = $total * 100;
        $data['amount'] = $total;
        $data['guardian_phone'] = $params['guardian_phone'];
        $data['student_fees_master_array']=$data['params']['student_fees_master_array'];
        $this->load->view('student/jazzcash/jazzcash', $data);
    }

    public function pay(){

    	$params = $this->session->userdata('params');
        $amount =number_format((float)($params['fine_amount_balance']+$params['total']), 2, '.', '');
        $data = array();
        $data['params'] = $params;
        $data['setting'] = $this->setting;
        $data['api_error'] = array();
        $student_id = $params['student_id'];
        $data['name'] = $params['name'];
        $data['title'] = 'Student Fee';
        $data['return_url'] = base_url() . 'students/jazzcash/callback';
        $data['pp_MerchantID'] = $this->api_config->api_secret_key;
        $data['pp_Password'] = $this->api_config->api_password;
        $data['currency_code'] = $params['invoice']->currency_name;
        $data['guardian_phone'] = $params['guardian_phone'];
		$data['ExpiryTime'] = date('YmdHis', strtotime("+3 hours"));
		$data['TxnDateTime'] = date('YmdHis', strtotime("+0 hours"));
		$data['TxnRefNumber'] = "T". date('YmdHis');
        $input_para["pp_Version"]="2.0";
        $input_para["pp_IsRegisteredCustomer"]="Yes";
        $input_para["pp_TxnType"]="MPAY";
        $input_para["pp_TokenizedCardNumber"]="";
        $input_para["pp_CustomerID"]=time();
        $input_para["pp_CustomerEmail"]="";
        $input_para["pp_CustomerMobile"]="";
        $input_para["pp_MerchantID"]=$data['pp_MerchantID'];
        $input_para["pp_Language"]="EN";
        $input_para["pp_SubMerchantID"]="";
        $input_para["pp_Password"]=$data['pp_Password'];
        $input_para["pp_TxnRefNo"]=$data['TxnRefNumber'];
        $input_para["pp_Amount"]=$amount*100;
        $input_para["pp_DiscountedAmount"]="";
        $input_para["pp_DiscountBank"]="";
        $input_para["pp_TxnCurrency"]="PKR";
        $input_para["pp_TxnDateTime"]=$data['TxnDateTime'];
        $input_para["pp_TxnExpiryDateTime"]=$data['ExpiryTime'];
        $input_para["pp_BillReference"]=time();
        $input_para["pp_Description"]=$data['title'];
        $input_para["pp_ReturnURL"]=$data['return_url'];
        $input_para["pp_SecureHash"]="0123456789";
        $input_para["ppmpf_1"]="1";
        $input_para["ppmpf_2"]="2";
        $input_para["ppmpf_3"]="3";
        $input_para["ppmpf_4"]="4";
        $input_para["ppmpf_5"]="5";
        $data['payment_data']=$input_para;
    	$this->load->view('student/jazzcash/jazzcash_pay', $data);
    }

    public function callback() {
    	

        $params = $this->session->userdata('params');
        $data = array();

        if($_POST['pp_ResponseCode']=='000'){
        	$payment_id = $_POST['pp_TxnRefNo'];
            $bulk_fees=array();
            $params     = $this->session->userdata('params');
         
            foreach ($params['student_fees_master_array'] as $fee_key => $fee_value) {
           
             $json_array = array(
                'amount'          =>  $fee_value['amount_balance'],
                'date'            => date('Y-m-d'),
                'amount_discount' => 0,
                'amount_fine'     => $fee_value['fine_balance'],
                'description'     => "Online fees deposit through Jazzcash TXN ID: " . $payment_id,
                'received_by'     => '',
                'payment_mode'    => 'Jazzcash',
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
        }elseif($_POST['pp_ResponseCode']=='112'){
        		 redirect(base_url("students/payment/paymentfailed"));
        }else{
            $this->session->set_flashdata('msg',$_POST['pp_ResponseMessage']);
                redirect(site_url('students/jazzcash'));
        }
        
      
    }

}
