<div class="content-wrapper">
    <section class="content">
        <legend>Student</legend>
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
<form class="form-horizontal">
<fieldset>

<!-- Form Name -->
<legend>Create Invoice</legend>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="registration_no" >Registration Number</label>  
  <div class="col-md-4">
  <input id="registration_no" value="<?php echo $student['id'] ?>" name="registration_no" type="text" placeholder="Registration Number" class="form-control input-md" required="">

  </div>
</div>

<!-- Select Basic -->
<div class="form-group">
  <label class="col-md-4 control-label" for="payment_type">Payment Type</label>
  <div class="col-md-4">
    <select id="payment_type" name="payment_type" class="form-control">
      <option value="1">LifeSkills 1</option>
      <option value="2">LifeSkills 2</option>
      <option value="4">LifeSkills 3</option>
      <option value="">LifeSkills Final</option>
    </select>
  </div>
</div>

<!-- Select Basic -->
<div class="form-group">
  <label class="col-md-4 control-label" for="payment_method">Payment Method</label>
  <div class="col-md-4">
    <select id="payment_method" name="payment_method" class="form-control">
      <option value="1">Cash</option>
      <option value="2">Bank Transfer</option>
      <option value="3">Cheque</option>
    </select>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="amount">Amount</label>  
  <div class="col-md-4">
  <input id="amount" name="amount" type="text" placeholder="Amount" class="form-control input-md" required="">
    
  </div>
</div>

<!-- Date input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="amount">Date</label>  
  <div class="col-md-4">
  <input id="date" name="date" type="date" placeholder="Date" class="form-control input-md" required="">
    
  </div>
</div>

<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for=""></label>
  <div class="col-md-4">
    <button id="" name="" class="btn btn-primary pull-right">Create</button>
  </div>
</div>

</fieldset>
</form>

<legend>Invoices</legend>

    </section>
</div>