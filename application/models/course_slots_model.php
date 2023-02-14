<?php



if (!defined('BASEPATH'))

    exit('No direct script access allowed');



class Course_slots_model extends MY_Model
{



    public function __construct()
    {

        parent::__construct();

        $this->current_session = $this->setting_model->getCurrentSession();
    }



    /**

     * This funtion takes id as a parameter and will fetch the record.

     * If id is not provided, then it will fetch all the records form the table.

     * @param int $id

     * @return mixed

     */

    public function get($name = null)
    {
        

        
        $this->db->select()->from('course_slots');

        if ($name != null) {

            $this->db->where('course_slots.course_id', $name);
        }
        $query = $this->db->get();

        
        if ($name != null) {

            return $query->result_array();
        } else {

            return $query->result_array();
        }
    }

    public function getbyStudentId($id = null)
    {
        


        $this->db->select()->from('course_slots');

        if ($name != null) {

            $this->db->where('course_slots.course_id', $id);
        }

        $query = $this->db->get();

        if ($name != null) {

            return $query->result_array();
        } else {

            return $query->result_array();
        }
    }


    /**

     * This function will delete the record based on the id

     * @param $id

     */

    public function remove($id)
    {

        $this->db->trans_start(); # Starting Transaction

        $this->db->trans_strict(false); # See Note 01. If you wish can remove as well

        //=======================Code Start===========================

        $this->db->where('id', $id);

        $this->db->delete('course_slots');

        $message = DELETE_RECORD_CONSTANT . " On course_slots id " . $id;

        $action = "Delete";

        $record_id = $id;

        $this->log($message, $record_id, $action);

        //======================Code End==============================

        $this->db->trans_complete(); # Completing transaction

        /* Optional */

        if ($this->db->trans_status() === false) {

            # Something went wrong.

            $this->db->trans_rollback();

            return false;
        } else {

            //return $return_value;

        }
    }



    /**

     * This function will take the post data passed from the controller

     * If id is present, then it will do an update

     * else an insert. One function doing both add and edit.

     * @param $data

     */

    public function add($data)
    {
       
     

        //=======================Code Start===========================

        if (isset($data['id'])) {

            $this->db->where('id', $data['id']);

            $id =$this->db->update('course_slots', $data);
            
            $message = UPDATE_RECORD_CONSTANT . " On course_slots id " . $data['id'];
           
            $action = "Update";

            $record_id = $data['id'];

            $this->log($message, $record_id, $action);


        } else {

            $this->db->insert('course_slots', $data);

            $insert_id = $this->db->insert_id();

            $message = INSERT_RECORD_CONSTANT . " On course_slots id " . $insert_id;

            $action = "Insert";

            $record_id = $insert_id;

            $this->log($message, $record_id, $action);

            //======================Code End==============================

            return $insert_id;
        }
    }



    public function list()
    {

        $this->db->select()->from('course_slots');

        $this->db->order_by("id", "desc");

        $list = $this->db->get();

        return $list->result_array();
    }
}
