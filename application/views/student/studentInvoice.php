<?php
    var_dump($student)
?>

<div>
<table class="table table-striped table-bordered table-hover student-list" data-export-title="<?php echo $this->lang->line('student') . " " . $this->lang->line('list'); ?>">
    <thead>
        <tr>
            <th>Student Register No</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Phone</th>
            <th>Band Score</th>
            <th>Email</th>
            <th>DOB</th>
            <th>Address</th>
            <th>Occupation</th>
            <th>IELTS Course</th>
            <th>Expected Band Score</th>
            <th>Course Code</th>
            <th>Passport No</th>
            <th>Purpose</th>

        </tr>

    </thead>

    <tbody>
        <?php

            $id = $student['id'];
            unset($student['id']);
            unset($student['created_at']);
            unset($student['User_id']);
            unset($student['is_student']);
        ?>
        <tr>
            <?php foreach ($student as $key => $singleLead) { ?>
                <td class=""><?php echo $singleLead ?></td>
            <?php  } ?>
        </tr>

    </tbody>

</table>
</div>
