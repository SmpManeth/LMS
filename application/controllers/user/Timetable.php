<?php



if (!defined('BASEPATH')) {

    exit('No direct script access allowed');
}



class Timetable extends Student_Controller
{



    public function __construct()
    {

        parent::__construct();
        $this->CI          = &get_instance();

        $this->load->model("Course_slots_model");
        $this->load->model("Student_model");

        $this->load->model("Studentcourseslots_model");

        $this->config->load('app-config');

        $this->load->library('smsgateway');

        $this->load->library('mailsmsconf');

        $this->load->library('encoding_lib');

        $this->sch_setting_detail = $this->setting_model->getSetting();

        $this->role;
    }



    public function index()
    {
        // echo "<pre>", print_r($student_id, true), "</pre>";
        // die();
        $this->session->set_userdata('top_menu', 'Time_table');

        $student_id = $this->customlib->getStudentSessionUserID();

        $student = $this->student_model->get($student_id);






        $class_slots = $this->Course_slots_model->get($student[0]['ielts_course']);
        $student_course_slots = $this->Studentcourseslots_model->getByStudentID($student[0]['id']);

        $data['student_course_slots'] = $student_course_slots;
        $data['class_slots'] = $class_slots;
        // echo "<pre>", print_r($data), "</pre>";
        // die();

        $this->load->view('layout/student/header', $data);

        $this->load->view('user/timetable/timetableList', $data);

        $this->load->view('layout/student/footer', $data);
    }



    public function attendclass($id)
    {

        $data['id'] = $id;
        $data['is_attended'] = 1;

        $id = $this->Studentcourseslots_model->add($data);
    }


    // public function search()

    // {
    //     $permissions = array();
    //     $admin_session = $this->CI->session->userdata('admin');
    //     foreach ($admin_session['roles'] as $key => $role) {

    //         $permissions            = $key;
    //     }

    //     if ($permissions === 'Super Admin') {
    //     } else {
    //         access_denied();
    //     }
    //     $course_slots                = $this->Course_slots_model->get();
    //     $data['course_slots'] = $course_slots;

    //     $this->session->set_userdata('top_menu', 'Student Information');

    //     $this->session->set_userdata('sub_menu', 'student/search');

    //     $data['title']           = 'Student Search';

    //     $data['adm_auto_insert'] = $this->sch_setting_detail->adm_auto_insert;

    //     $data['sch_setting']     = $this->sch_setting_detail;

    //     $data['fields']          = $this->customfield_model->get_custom_fields('students', 1);

    //     $class                   = $this->class_model->get();

    //     $data['classlist']       = $class;

    //     $this->form_validation->set_rules('search_text', ' ', 'trim|xss_clean');

    //     if ($this->form_validation->run() == false) {
    //         $this->load->view('layout/header', $data);

    //         $this->load->view('student/studentSearch', $data);

    //         $this->load->view('layout/footer', $data);
    //     } else {

    //         $data['students'] = $this->Student_model->getDatatableByFullTextSearch($this->input->post('search_text'));

    //         // echo "<pre>", print_r($data['students']), "</pre>";
    //         // die();

    //         $this->load->view('layout/header', $data);

    //         $this->load->view('student/studentSearch', $data);

    //         $this->load->view('layout/footer', $data);
    //     }
    // }
}
