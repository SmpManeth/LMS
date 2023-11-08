<?php
class Exam_Invoice_records_model extends CI_Model {

    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }

    // Create a new invoice record
    public function create($data)
    {
        // Generate a unique reference_number
        $data['exam_reg_no'] = $this->customlib->generateRandomString(10);
        $data['reference_number'] = $this->customlib->generateRandomString(11);

        $this->db->insert('exam_invoice_records', $data);
        return $this->db->insert_id();
    }

    // Find an invoice record by id
    public function find($id)
    {
        $this->db->select('exam_invoice_records.*, students.*, staff.name ,staff.surname');
        $this->db->from('exam_invoice_records');
        $this->db->join('students', 'exam_invoice_records.student_id = students.id', 'left');
        $this->db->join('staff', 'exam_invoice_records.staff_id = staff.id', 'left');
        $this->db->where('exam_invoice_records.reference_number', $id);

        $query = $this->db->get();
        return $query->result();

    }

    // Find invoice records by student_id
    public function find_by_student_id($student_id)
    {
        $this->db->select('exam_invoice_records.*, students.first_name, students.last_name, students.student_reg_no, students.coursecode, students.phone, students.bandscore, staff.name as staff_first_name, staff.surname as staff_last_name');
        $this->db->where('exam_invoice_records.student_id', $student_id);
        $this->db->from('exam_invoice_records');
        $this->db->join('students', 'exam_invoice_records.student_id = students.id', 'left');
        $this->db->join('staff', 'exam_invoice_records.staff_id = staff.id', 'right');
        return $this->db->get()->result();
    }

    // Update an existing invoice record by id
    public function update($id, $data)
    {
        $this->db->where('id', $id);
        $this->db->update('exam_invoice_records', $data);
    }

    // Delete an invoice record by id
    public function delete($id)
    {
        $this->db->where('id', $id);
        $this->db->delete('exam_invoice_records');
    }

    // Search for invoice records based on criteria
    public function search($criteria)
    {
        $this->db->select('exam_invoice_records.*, students.first_name, students.last_name, students.student_reg_no, students.coursecode, students.phone, students.bandscore, staff.name as staff_first_name, staff.surname as staff_last_name');
        $this->db->from('exam_invoice_records');
        $this->db->join('students', 'exam_invoice_records.student_id = students.id', 'left');
        $this->db->join('staff', 'exam_invoice_records.staff_id = staff.id', 'right');

        if (!empty($criteria)) {
            $this->db->group_start();
            $this->db->like('exam_invoice_records.reference_number', $criteria);
            $this->db->or_like('exam_invoice_records.payment_type', $criteria);
            $this->db->or_like('exam_invoice_records.payment_method', $criteria);
            $this->db->or_like('students.first_name', $criteria);
            $this->db->or_like('students.last_name', $criteria);
            $this->db->or_like('students.student_reg_no', $criteria);
            $this->db->or_like('students.coursecode', $criteria);
            $this->db->group_end();
        }

        return $this->db->get()->result();
    }

    // Retrieve all invoice records
    public function all()
    {
        $this->db->select('exam_invoice_records.*, students.*');
        $this->db->from('exam_invoice_records');
        $this->db->join('students', 'exam_invoice_records.student_id = students.id', 'left');
        $results =$this->db->get()->result();
        return $results;
    }
}
