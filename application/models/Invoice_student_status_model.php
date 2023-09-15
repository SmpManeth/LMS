<?php
class Invoice_student_status_model extends CI_Model {

    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }

    // Create a new student status record
    public function create($data)
    {
        $this->db->insert('invoice_student_status', $data);
        return $this->db->insert_id();
    }

    // Find a student status record by student_id
    public function find($student_id)
    {
        $this->db->where('student_id', $student_id);
        return $this->db->get('invoice_student_status')->row();
    }

    // Update an existing student status record by student_id
    public function update($student_id, $data)
    {
        $this->db->where('student_id', $student_id);
        $this->db->update('invoice_student_status', $data);
    }

    // Delete a student status record by student_id
    public function delete($student_id)
    {
        $this->db->where('student_id', $student_id);
        $this->db->delete('invoice_student_status');
    }

    // Retrieve all student status records
    public function all()
    {
        return $this->db->get('invoice_student_status')->result();
    }
}
