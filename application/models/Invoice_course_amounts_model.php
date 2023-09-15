<?php
class Invoice_course_amounts_model extends CI_Model {

    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }

    // Create a new course amount record
    public function create($data)
    {
        $this->db->insert('invoice_course_amounts', $data);
        return $this->db->insert_id();
    }

    // Find a course amount record by id
    public function find($id)
    {
        $this->db->where('id', $id);
        return $this->db->get('invoice_course_amounts')->row();
    }

    // Update an existing course amount record by id
    public function update($id, $data)
    {
        $this->db->where('id', $id);
        $this->db->update('invoice_course_amounts', $data);
    }

    // Delete a course amount record by id
    public function delete($id)
    {
        $this->db->where('id', $id);
        $this->db->delete('invoice_course_amounts');
    }

    // Retrieve all course amount records
    public function all()
    {
        return $this->db->get('invoice_course_amounts')->result();
    }
}
