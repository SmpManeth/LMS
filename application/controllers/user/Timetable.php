<?php



if (!defined('BASEPATH')) {

    exit('No direct script access allowed');
}



class Timetable extends Student_Controller
{



    public function __construct()
    {

        parent::__construct();
        $this->load->model("Course_slots_model");
        $this->load->model("Studentcourseslots_model");
    }



    public function index()
    {

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

        echo "<pre>", print_r($id, true), "</pre>";
        die();
    }
}
