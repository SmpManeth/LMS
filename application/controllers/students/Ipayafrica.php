<?php if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Ipayafrica extends Student_Controller
{
    public $payment_method = array();
    public $pay_method     = array();
    public $patient_data;
    public $setting;

    public function __construct()
    {
        parent::__construct();
        $this->config->load("payroll");
        $this->load->library('Enc_lib');
        $this->load->library('Customlib');
        $this->patient_data   = $this->session->userdata('patient');
        $this->payment_method = $this->paymentsetting_model->get();
        $this->pay_method     = $this->paymentsetting_model->getActiveMethod();
        $this->marital_status = $this->config->item('marital_status');
        $this->payment_mode   = $this->config->item('payment_mode');
        $this->blood_group    = $this->config->item('bloodgroup');
        $this->setting        = $this->setting_model->get();
    }


   public function index()
    {
     $data = array();
        $data['params'] = $this->session->userdata('params');
        $data['setting'] = $this->setting;
        $data['api_error'] = array();
        $data['student_data'] = $this->student_model->get($data['params']['student_id']);
        $data['student_fees_master_array']=$data['params']['student_fees_master_array'];
        $this->load->view('student/ipayafrica/index', $data);
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
              $this->load->view('student/ipayafrica/index', $data);
        } else {


            $instadetails = $this->paymentsetting_model->getActiveMethod();
            $insta_apikey = $instadetails->api_secret_key;
            $insta_authtoken = $instadetails->api_publishable_key;

            $params = $this->session->userdata('params');
            $data = array();
            $student_id = $params['student_id'];
            $data['total'] =number_format((float)($params['fine_amount_balance']+$params['total']), 2, '.', '');;
            $data['symbol'] = $params['invoice']->symbol;
            $data['currency_name'] = $params['invoice']->currency_name;
            $data['name'] = $params['name'];
            $data['guardian_phone'] = $params['guardian_phone'];


             $fields = array("live"=> "1",
                    "oid"=> uniqid(),
                    "inv"=> time(),
                    "ttl"=> $data['total'],
                    "tel"=> $_POST['phone'],
                    "eml"=> $_POST['email'],
                    "vid"=> ($this->pay_method->api_publishable_key),
                    "curr"=> $data['currency_name'],
                    "p1"=> "airtel",
                    "p2"=> "",
                    "p3"=> "",
                    "p4"=> $data['total'],
                    "cbk"=> base_url().'students/ipayafrica/success',
                    "cst"=> "1",
                    "crl"=> "2"
                    );
             
            $datastring =  $fields['live'].$fields['oid'].$fields['inv'].$fields['ttl'].$fields['tel'].$fields['eml'].$fields['vid'].$fields['curr'].$fields['p1'].$fields['p2'].$fields['p3'].$fields['p4'].$fields['cbk'].$fields['cst'].$fields['crl'];

            $hashkey =($this->pay_method->api_secret_key);
            $generated_hash = hash_hmac('sha1',$datastring , $hashkey);
            $data['fields']=$fields;
            $data['generated_hash']=$generated_hash;
            $this->load->view('student/ipayafrica/pay', $data);
            
        }
    }

 
    public function success()
    {
        
        if(!empty($_GET['status'])){
             
            $params = $this->session->userdata('params');
           
            $payment_id = $_GET['txncd'];;
            $bulk_fees=array();
            $params     = $this->session->userdata('params');
         
            foreach ($params['student_fees_master_array'] as $fee_key => $fee_value) {
           
             $json_array = array(
                'amount'          =>  $fee_value['amount_balance'],
                'date'            => date('Y-m-d'),
                'amount_discount' => 0,
                'amount_fine'     => $fee_value['fine_balance'],
                'description'     => "Online fees deposit through ipayAfrica TXN ID: " . $payment_id,
                'received_by'     => '',
                'payment_mode'    => 'Ipay_africa'
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
        }else{

              redirect(base_url("students/payment/paymentfailed"));
        }
     
    }
}