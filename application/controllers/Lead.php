<?php



if (!defined('BASEPATH')) {

    exit('No direct script access allowed');
}



class Lead extends Admin_Controller

{



    public $sch_setting_detail = array();



    public function __construct()

    {

        parent::__construct();

        $this->config->load('app-config');

        $this->load->library('smsgateway');

        $this->load->library('mailsmsconf');

        $this->load->library('encoding_lib');

        $this->load->model("classteacher_model");
        $this->load->model("Band_Score_model");
        $this->load->model("Section_model");
        $this->load->model("Lead_model");

        $this->load->model(array("timeline_model", "student_edit_field_model"));

        $this->blood_group        = $this->config->item('bloodgroup');

        $this->sch_setting_detail = $this->setting_model->getSetting();

        $this->role;
    }



    public function index()

    {



        $data['title']       = 'Student List';

        //  $student_result      = $this->student_model->get();

        //  $data['studentlist'] = $student_result;

        $this->load->view('layout/header', $data);

        $this->load->view('student/studentList', $data);

        $this->load->view('layout/footer', $data);
    }

    public function makestudent($id)
    {
        if (!$this->rbac->hasPrivilege('student', 'can_delete')) {

            access_denied();
        }

        $data['id'] = $id;
        // $data['is_student'] = 1;
        // $this->Lead_model->add($data);
        $band_scrore                = $this->Band_Score_model->getAll();
        $ieltscourses                = $this->Section_model->get();
        $data['ieltscourses']          = $ieltscourses;
        $class                      = $this->class_model->get('', $classteacher = 'yes');

        $data['classlist']          = $class;
        $data['band_scrore']          = $band_scrore;




        $data['new_student'] = $this->Lead_model->get($data['id']);
        $data['new_student']['student_reg_no'] = "";
         

        $this->load->view('layout/header', $data);

        $this->load->view('student/studentCreate', $data);

        $this->load->view('layout/footer', $data);
    }


    public function delete($id)
    {
        if (!$this->rbac->hasPrivilege('student', 'can_delete')) {

            access_denied();
        }

        $this->Lead_model->remove($id);

        $this->session->set_flashdata('msg', '<i class="fa fa-check-square-o" aria-hidden="true"></i> ' . $this->lang->line('delete_message') . '');

        redirect('lead/search');
    }


    public function create()
    {


        // print_r($studentRegNo);
        // die();
        if (!$this->rbac->hasPrivilege('student', 'can_add')) {
            access_denied();
        }

        $this->session->set_userdata('top_menu', 'Lead Information');
        $this->session->set_userdata('sub_menu', 'lead/create');


        $data['title']              = 'Add Student';
        $data['title_list']         = 'Recently Added Student';
        $class                      = $this->class_model->get('', $classteacher = 'yes');
        $band_scrore                = $this->Band_Score_model->getAll();
        $ieltscourses                = $this->Section_model->get();
        $data['classlist']          = $class;
        $data['ieltscourses']          = $ieltscourses;
        $data['band_scrore']          = $band_scrore;
        $userdata                   = $this->customlib->getUserData();


        $this->form_validation->set_rules('first_name', ' ', 'trim|required|xss_clean');
        $this->form_validation->set_rules('email', ' ', 'trim|required|xss_clean');
        $this->form_validation->set_rules('ielts_course', ' ', 'trim|required|xss_clean');
        $this->form_validation->set_rules('coursecode', ' ', 'trim|required|xss_clean');
        $this->form_validation->set_rules('bandscore', ' ', 'trim|required|xss_clean');

        // $this->form_validation->set_rules('email', ' ', array('valid_email', array('check_student_email_exists', array($this->student_model, 'check_student_email_exists'))));

        if ($this->form_validation->run() == false) {
            $this->load->view('layout/header', $data);

            $this->load->view('lead/createlead', $data);

            $this->load->view('layout/footer', $data);
        } else {

            $current_year = substr(date('Y'), 2);
            $current_month = date('m');

            $studentRegNo = substr($this->Lead_model->getLaststudent_reg_no(), -4) + 1;
            $studentRegNo = strlen($studentRegNo) < 4 ? '000' . $studentRegNo : $studentRegNo;


            $newstudentRegNo = "LD".$current_year . $current_month . $this->input->post('coursecode') . $this->input->post('bandscore') . $studentRegNo;

            $data_insert = array(

                'student_reg_no'         => $newstudentRegNo,

                'bandscore'               => $this->input->post('bandscore'),

                'first_name'             => $this->input->post('first_name'),

                'last_name'              => $this->input->post('last_name'),

                'phone'           => $this->input->post('phone'),

                'email'              => $this->input->post('email'),

                'address'   => $this->input->post('address'),

                'occupation'               => $this->input->post('occupation'),

                'ielts_course'   => $this->input->post('ielts_course'),

                'expected_band_score' => $this->input->post('expected_band_score'),

                'coursecode'          => $this->input->post('coursecode'),

                'User_id'        =>  $userdata['id'],

                'is_student'         => 0

            );



            $insert                            = true;

            $data_setting                      = array();

            $data_setting['id']                = $this->sch_setting_detail->id;

            $data_setting['adm_auto_insert']   = $this->sch_setting_detail->adm_auto_insert;

            $data_setting['adm_update_status'] = $this->sch_setting_detail->adm_update_status;





            if ($insert) {

                $insert_id = $this->Lead_model->add($data_insert, $data_setting);

                // if (!empty($custom_value_array)) {

                //     $this->customfield_model->insertRecord($custom_value_array, $insert_id);
                // }

                // $data_new = array(

                //     'student_id'    => $insert_id,

                //     'class_id'      => $class_id,

                //     'section_id'    => $section_id,

                //     'session_id'    => $session,

                //     'fees_discount' => $fees_discount,

                // );

                // $this->student_model->add_student_session($data_new);

                // $user_password = $this->role->get_random_password($chars_min = 6, $chars_max = 6, $use_upper_case = false, $include_numbers = true, $include_special_chars = false);



                // $sibling_id         = $this->input->post('sibling_id');

                // $data_student_login = array(

                //     'username' => $this->student_login_prefix . $insert_id,

                //     'password' => $user_password,

                //     'user_id'  => $insert_id,

                //     'role'     => 'student',

                // );



                // $this->user_model->add($data_student_login);

                // $sender_details = array('student_id' => $newstudentRegNo, 'contact_no' => $data_insert['phone'], 'email' => $data_insert['email']);

                // $this->mailsmsconf->mailsms('student_admission', $sender_details);




                // $student_login_detail = array('id' => $insert_id, 'credential_for' => 'student', 'username' => $this->student_login_prefix . $insert_id, 'password' => $user_password, 'contact_no' => $this->input->post('mobileno'), 'email' => $this->input->post('email'));

                // $this->mailsmsconf->mailsms('login_credential', $student_login_detail);



                // if ($sibling_id > 0) {
                // } else {

                //     $parent_login_detail = array('id' => $insert_id, 'credential_for' => 'parent', 'username' => $this->parent_login_prefix . $insert_id, 'password' => $parent_password, 'contact_no' => $this->input->post('guardian_phone'), 'email' => $this->input->post('guardian_email'));

                //     $this->mailsmsconf->mailsms('login_credential', $parent_login_detail);
                // }



                $this->session->set_flashdata('msg', '<div class="alert alert-success">' . $this->lang->line('success_message') . '</div>');

                redirect('lead/create');
            } else {



                $data['error_message'] = $this->lang->line('admission_no') . ' ' . $admission_no . ' ' . $this->lang->line('already_exists');

                $this->load->view('layout/header', $data);

                $this->load->view('student/studentCreate', $data);

                $this->load->view('layout/footer', $data);
            }
        }
    }

    public function sendpassword()

    {



        $student_login_detail = array('id' => $this->input->post('student_id'), 'credential_for' => 'student', 'username' => $this->input->post('username'), 'password' => $this->input->post('password'), 'contact_no' => $this->input->post('contact_no'), 'email' => $this->input->post('email'));



        $msg = $this->mailsmsconf->mailsms('login_credential', $student_login_detail);
    }


    public function edit($id)

    {


        if (!$this->rbac->hasPrivilege('student', 'can_edit')) {

            access_denied();
        }

        $data['title']   = 'Edit Lead';
        $data['id']      = $id;
        $lead         = $this->Lead_model->get($id);
        $class                      = $this->class_model->get('', $classteacher = 'yes');
        $band_scrore                = $this->Band_Score_model->getAll();
        $ieltscourses                = $this->Section_model->get();
        $data['classlist']          = $class;
        $data['ieltscourses']          = $ieltscourses;
        $data['band_scrore']          = $band_scrore;
        $userdata                   = $this->customlib->getUserData();
        // echo "<pre>", print_r($data), "</pre>";
        // die();

        $data['lead'] = $lead;


        $this->form_validation->set_rules('first_name', ' ', 'trim|required|xss_clean');
        $this->form_validation->set_rules('email', ' ', 'trim|required|xss_clean');
        $this->form_validation->set_rules('ielts_course', ' ', 'trim|required|xss_clean');
        $this->form_validation->set_rules('coursecode', ' ', 'trim|required|xss_clean');
        $this->form_validation->set_rules('bandscore', ' ', 'trim|required|xss_clean');

        // //  echo "<pre>", print_r($this->form_validation), "</pre>";
        // //  die(); 
        // //  echo "<pre>", print_r($data), "</pre>";
        // //  die();



        if ($this->form_validation->run() == false) {

            $this->load->view('layout/header', $data);

            $this->load->view('lead/editlead', $data);

            $this->load->view('layout/footer', $data);
        } else {
           
            $data_input = array(

                'id'         => $lead['id'],
                'student_reg_no'         => $lead['student_reg_no'],

                'bandscore'               => $this->input->post('bandscore'),

                'first_name'             => $this->input->post('first_name'),

                'last_name'              => $this->input->post('last_name'),

                'phone'           => $this->input->post('phone'),

                'email'              => $this->input->post('email'),

                'address'   => $this->input->post('address'),

                'occupation'               => $this->input->post('occupation'),

                'ielts_course'   => $this->input->post('ielts_course'),

                'expected_band_score' => $this->input->post('expected_band_score'),

                'coursecode'          => $this->input->post('coursecode'),

                'User_id'        =>  $userdata['id'],

                'is_student'         =>$lead['is_student'],
            );
            

            // echo "<pre>", print_r($data_input), "</pre>";
            // die();

            $this->Lead_model->add($data_input);



            $this->session->set_flashdata('msg', '<div student="alert alert-success text-left">' . $this->lang->line('update_message') . '</div>');

            redirect('lead/search');
        }
    }

    public function search()
    {
        if (!$this->rbac->hasPrivilege('student', 'can_view')) {

            access_denied();
        }

        $this->session->set_userdata('top_menu', 'Lead Information');

        $this->session->set_userdata('sub_menu', 'lead/search');

        // $data['title']           = 'Deal Search';

        // $data['adm_auto_insert'] = $this->sch_setting_detail->adm_auto_insert;

        // $data['sch_setting']     = $this->sch_setting_detail;

        // $data['fields']          = $this->customfield_model->get_custom_fields('students', 1);

        // $class                   = $this->class_model->get();

        // $data['classlist']       = $class;



        $this->form_validation->set_rules('search_text', ' ', 'required|xss_clean');

        if ($this->form_validation->run() == false) {
            $this->load->view('layout/header', $data);

            $this->load->view('lead/dealSearch', $data);

            $this->load->view('layout/footer', $data);
        } else {

            $data['leads'] = $this->Lead_model->getDatatableByFullTextSearch($this->input->post('search_text'));
            // echo "<pre>", print_r($data['leads']), "</pre>";
            // die();



            $this->load->view('layout/header', $data);

            $this->load->view('lead/dealSearch', $data);

            $this->load->view('layout/footer', $data);
            // $this->load->view('lead/dealSearch', $data);








            //     $this->session->set_flashdata('msg', '<div class="alert alert-success">' . $this->lang->line('success_message') . '</div>');

            //     redirect('lead/create');
            // } else {



            //     $data['error_message'] = $this->lang->line('admission_no') . ' ' . $admission_no . ' ' . $this->lang->line('already_exists');

            //     $this->load->view('layout/header', $data);

            //     $this->load->view('student/studentCreate', $data);

            //     $this->load->view('layout/footer', $data);
            // }
        }
    }
}
