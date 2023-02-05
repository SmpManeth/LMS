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
        $data['is_student'] = 1;
        $this->Lead_model->add($data);
        $band_scrore                = $this->Band_Score_model->getAll();
        $ieltscourses                = $this->Section_model->get();
        $data['ieltscourses']          = $ieltscourses;
        $class                      = $this->class_model->get('', $classteacher = 'yes');

        $data['classlist']          = $class;
        $data['band_scrore']          = $band_scrore;




        $data['new_student'] = $this->Lead_model->get($data['id']);

        // echo "<pre>", print_r($data['new_student']), "</pre>";
        // die();
        $this->session->set_flashdata('msg', '<i class="fa fa-check-square-o" aria-hidden="true"></i> ' . "Updated as a Student" . '');

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


            $newstudentRegNo = $current_year . $current_month . $this->input->post('coursecode') . $this->input->post('bandscore') . $studentRegNo;





            // student_reg_no , User_id *******************************************************************************

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


        $data['lead'] = $lead;



        $data['adm_auto_insert'] = $this->sch_setting_detail->adm_auto_insert;


        $session                 = $this->setting_model->getCurrentSession();

        $data['sch_setting']        = $this->sch_setting_detail;

        $this->form_validation->set_rules('firstname', $this->lang->line('first_name'), 'trim|required|xss_clean');

        $this->form_validation->set_rules('dob', $this->lang->line('date_of_birth'), 'trim|required|xss_clean');

        $this->form_validation->set_rules('class_id', $this->lang->line('class'), 'trim|required|xss_clean');

        $this->form_validation->set_rules('section_id', $this->lang->line('section'), 'trim|required|xss_clean');

        $this->form_validation->set_rules('gender', $this->lang->line('gender'), 'trim|required|xss_clean');



        // echo "<pre>", print_r($data['lead']), "</pre>";
        // die();



        if ($this->form_validation->run() == false) {

            $this->load->view('layout/header', $data);

            $this->load->view('lead/editlead', $data);

            $this->load->view('layout/footer', $data);
        } else {



            $custom_field_post = $this->input->post("custom_fields[students]");

            if (isset($custom_field_post)) {

                $custom_value_array = array();

                foreach ($custom_field_post as $key => $value) {

                    $check_field_type = $this->input->post("custom_fields[students][" . $key . "]");

                    $field_value      = is_array($check_field_type) ? implode(",", $check_field_type) : $check_field_type;

                    $array_custom     = array(

                        'belong_table_id' => $id,

                        'custom_field_id' => $key,

                        'field_value'     => $field_value,

                    );

                    $custom_value_array[] = $array_custom;
                }

                $this->customfield_model->updateRecord($custom_value_array, $id, 'students');
            }

            $student_id      = $this->input->post('student_id');

            $student         = $this->student_model->get($student_id);

            $sibling_id      = $this->input->post('sibling_id');

            $siblings_counts = $this->input->post('siblings_counts');

            $siblings        = $this->student_model->getMySiblings($student['parent_id'], $student_id);

            $total_siblings  = count($siblings);

            $class_id        = $this->input->post('class_id');

            $section_id      = $this->input->post('section_id');

            $hostel_room_id  = $this->input->post('hostel_room_id');

            $fees_discount   = $this->input->post('fees_discount');

            $vehroute_id     = $this->input->post('vehroute_id');

            if (empty($vehroute_id)) {

                $vehroute_id = 0;
            }

            if (empty($hostel_room_id)) {

                $hostel_room_id = 0;
            }



            $data = array(

                'id'                => $id,

                'firstname'         => $this->input->post('firstname'),

                'rte'               => $this->input->post('rte'),

                'state'             => $this->input->post('state'),

                'city'              => $this->input->post('city'),

                'pincode'           => $this->input->post('pincode'),

                'cast'              => $this->input->post('cast'),

                'previous_school'   => $this->input->post('previous_school'),

                'dob'               => $this->customlib->dateFormatToYYYYMMDD($this->input->post('dob')),

                'current_address'   => $this->input->post('current_address'),

                'permanent_address' => $this->input->post('permanent_address'),

                'adhar_no'          => $this->input->post('adhar_no'),

                'samagra_id'        => $this->input->post('samagra_id'),

                'bank_account_no'   => $this->input->post('bank_account_no'),

                'bank_name'         => $this->input->post('bank_name'),

                'ifsc_code'         => $this->input->post('ifsc_code'),

                'guardian_email'    => $this->input->post('guardian_email'),

                'gender'            => $this->input->post('gender'),

                'guardian_name'     => $this->input->post('guardian_name'),

                'guardian_relation' => $this->input->post('guardian_relation'),

                'guardian_phone'    => $this->input->post('guardian_phone'),

                'guardian_address'  => $this->input->post('guardian_address'),

                'vehroute_id'       => $vehroute_id,

                'hostel_room_id'    => $hostel_room_id,

                'note'              => $this->input->post('note'),

                'is_active'         => 'yes',

            );

            if ($this->sch_setting_detail->guardian_occupation) {

                $data['guardian_occupation'] = $this->input->post('guardian_occupation');
            }

            $house             = $this->input->post('house');

            $blood_group       = $this->input->post('blood_group');

            $measurement_date  = $this->input->post('measure_date');

            $roll_no           = $this->input->post('roll_no');

            $lastname          = $this->input->post('lastname');

            $middlename        = $this->input->post('middlename');

            $category_id       = $this->input->post('category_id');

            $religion          = $this->input->post('religion');

            $mobileno          = $this->input->post('mobileno');

            $email             = $this->input->post('email');

            $admission_date    = $this->input->post('admission_date');

            $height            = $this->input->post('height');

            $weight            = $this->input->post('weight');

            $father_name       = $this->input->post('father_name');

            $father_phone      = $this->input->post('father_phone');

            $father_occupation = $this->input->post('father_occupation');

            $mother_name       = $this->input->post('mother_name');

            $mother_phone      = $this->input->post('mother_phone');

            $mother_occupation = $this->input->post('mother_occupation');



            if ($this->sch_setting_detail->guardian_name) {

                $data['guardian_is'] = $this->input->post('guardian_is');
            }



            if (isset($measurement_date)) {

                $data['measurement_date'] = $this->customlib->dateFormatToYYYYMMDD($this->input->post('measure_date'));
            }



            if (isset($house)) {

                $data['school_house_id'] = $this->input->post('house');
            }

            if (isset($blood_group)) {



                $data['blood_group'] = $this->input->post('blood_group');
            }



            if (isset($roll_no)) {



                $data['roll_no'] = $this->input->post('roll_no');
            }



            if (isset($lastname)) {



                $data['lastname'] = $this->input->post('lastname');
            }



            if (isset($middlename)) {

                $data['middlename'] = $this->input->post('middlename');
            }



            if (isset($category_id)) {



                $data['category_id'] = $this->input->post('category_id');
            }



            if (isset($religion)) {



                $data['religion'] = $this->input->post('religion');
            }



            if (isset($mobileno)) {



                $data['mobileno'] = $this->input->post('mobileno');
            }



            if (isset($email)) {



                $data['email'] = $this->input->post('email');
            }



            if (isset($admission_date)) {



                $data['admission_date'] = $this->customlib->dateFormatToYYYYMMDD($this->input->post('admission_date'));
            }



            if (isset($height)) {



                $data['height'] = $this->input->post('height');
            }



            if (isset($weight)) {



                $data['weight'] = $this->input->post('weight');
            }



            if (isset($father_name)) {



                $data['father_name'] = $this->input->post('father_name');
            }



            if (isset($father_phone)) {



                $data['father_phone'] = $this->input->post('father_phone');
            }



            if (isset($father_occupation)) {



                $data['father_occupation'] = $this->input->post('father_occupation');
            }



            if (isset($mother_name)) {



                $data['mother_name'] = $this->input->post('mother_name');
            }



            if (isset($mother_phone)) {



                $data['mother_phone'] = $this->input->post('mother_phone');
            }



            if (isset($mother_occupation)) {



                $data['mother_occupation'] = $this->input->post('mother_occupation');
            }



            $default_image = array('uploads/student_images/default_female.jpg', 'uploads/student_images/default_male.jpg');

            if (in_array($student['image'], $default_image)) {

                if ($this->input->post('gender') == 'Female') {

                    $data['image'] = 'uploads/student_images/default_female.jpg';
                } else {

                    $data['image'] = 'uploads/student_images/default_male.jpg';
                }
            }



            if (!$this->sch_setting_detail->adm_auto_insert) {



                $data['admission_no'] = $this->input->post('admission_no');
            }

            $this->student_model->add($data);

            $data_new = array(

                'student_id'    => $id,

                'class_id'      => $class_id,

                'section_id'    => $section_id,

                'session_id'    => $session,

                'fees_discount' => $fees_discount,

            );

            $insert_id = $this->student_model->add_student_session($data_new);

            if (isset($_FILES["file"]) && !empty($_FILES['file']['name'])) {

                $fileInfo = pathinfo($_FILES["file"]["name"]);

                $img_name = $id . '.' . $fileInfo['extension'];

                move_uploaded_file($_FILES["file"]["tmp_name"], "./uploads/student_images/" . $img_name);

                $data_img = array('id' => $id, 'image' => 'uploads/student_images/' . $img_name);

                $this->student_model->add($data_img);
            }



            if (isset($_FILES["father_pic"]) && !empty($_FILES['father_pic']['name'])) {

                $fileInfo = pathinfo($_FILES["father_pic"]["name"]);

                $img_name = $id . "father" . '.' . $fileInfo['extension'];

                move_uploaded_file($_FILES["father_pic"]["tmp_name"], "./uploads/student_images/" . $img_name);

                $data_img = array('id' => $id, 'father_pic' => 'uploads/student_images/' . $img_name);

                $this->student_model->add($data_img);
            }



            if (isset($_FILES["mother_pic"]) && !empty($_FILES['mother_pic']['name'])) {

                $fileInfo = pathinfo($_FILES["mother_pic"]["name"]);

                $img_name = $id . "mother" . '.' . $fileInfo['extension'];

                move_uploaded_file($_FILES["mother_pic"]["tmp_name"], "./uploads/student_images/" . $img_name);

                $data_img = array('id' => $id, 'mother_pic' => 'uploads/student_images/' . $img_name);

                $this->student_model->add($data_img);
            }



            if (isset($_FILES["guardian_pic"]) && !empty($_FILES['guardian_pic']['name'])) {

                $fileInfo = pathinfo($_FILES["guardian_pic"]["name"]);

                $img_name = $id . "guardian" . '.' . $fileInfo['extension'];

                move_uploaded_file($_FILES["guardian_pic"]["tmp_name"], "./uploads/student_images/" . $img_name);

                $data_img = array('id' => $id, 'guardian_pic' => 'uploads/student_images/' . $img_name);

                $this->student_model->add($data_img);
            }



            if (isset($siblings_counts) && ($total_siblings == $siblings_counts)) {

                //if there is no change in sibling

            } else if (!isset($siblings_counts) && $sibling_id == 0 && $total_siblings > 0) {

                // add for new parent

                $parent_password = $this->role->get_random_password($chars_min = 6, $chars_max = 6, $use_upper_case = false, $include_numbers = true, $include_special_chars = false);



                $data_parent_login = array(

                    'username' => $this->parent_login_prefix . $student_id . "_1",

                    'password' => $parent_password,

                    'user_id'  => "",

                    'role'     => 'parent',

                );



                $update_student = array(

                    'id'        => $student_id,

                    'parent_id' => 0,

                );

                $ins_id = $this->user_model->addNewParent($data_parent_login, $update_student);
            } else if ($sibling_id != 0) {

                //join to student with new parent

                $student_sibling = $this->student_model->get($sibling_id);

                $update_student  = array(

                    'id'        => $student_id,

                    'parent_id' => $student_sibling['parent_id'],

                );

                $student_sibling = $this->student_model->add($update_student);
            } else {
            }



            $this->session->set_flashdata('msg', '<div student="alert alert-success text-left">' . $this->lang->line('update_message') . '</div>');

            redirect('student/search');
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
