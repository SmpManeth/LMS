<div class="content-wrapper">

    <section class="content-header">

        <h1>

            <i class="fa fa-user-plus"></i> <?php echo $this->lang->line('student_information'); ?>

        </h1>

    </section>

    <section class="content">
        <!-- Student Form  -->
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <form id="form1" action="<?php echo site_url('student/edit/' . $id) ?>" id="employeeform" name="employeeform" method="post" accept-charset="utf-8" enctype="multipart/form-data">
                        <div class="">
                            <div class="bozero">
                                <h4 class="pagetitleh-whitebg">Edit Student Details</h4>
                                <div class="around10">
                                    <?php if ($this->session->flashdata('msg')) { ?>
                                        <?php echo $this->session->flashdata('msg') ?>
                                    <?php } ?>
                                    <?php if (isset($error_message)) { ?>
                                        <div class="alert alert-warning"><?php echo $error_message; ?></div>
                                    <?php } ?>
                                    <?php echo $this->customlib->getCSRF(); ?>
                                    <div class="row">
                                        <?php
                                        //  echo "<pre>", print_r($new_student ,true), "</pre>";
                                        //  die();
                                        ?>


                                        <div class="row">

                                            <!-- Registration Number  -->
                                            <div class="col-md-3">

                                                <div class="form-group">

                                                    <label for="student_reg_no">Registration No</label> <small class="req"> *</small>
                                                    <input hidden id="studentid" name="studentid" placeholder="" type="text" value="<?php echo set_value('student_reg_no', $new_student['id']); ?>" />

                                                    <input disabled id="student_reg_no" name="student_reg_no" placeholder="" type="text" class="form-control" value="<?php echo set_value('student_reg_no', $new_student['student_reg_no']); ?>" />
                                                    <input name="id" type="text" value="<?php echo set_value('student_reg_no', $id); ?>" hidden />

                                                    <span class="text-danger"><?php echo form_error('student_reg_no'); ?></span>

                                                </div>

                                            </div>

                                            <!-- Course Code  -->
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label for="coursecode">Course Code</label><small class="req"> *</small>
                                                    <select id="coursecode" name="coursecode" class="form-control">
                                                        <option selected value="<?php echo $new_student['coursecode']; ?>"><?php echo $new_student['coursecode']; ?></option>
                                                        <?php foreach ($classlist as $class) { ?>
                                                            <option value="<?php echo $class['class'] ?>"><?php echo $class['class'] ?></option>

                                                        <?php } ?>
                                                    </select>
                                                    <span class="text-danger"><?php echo form_error('coursecode'); ?></span>
                                                </div>

                                            </div>

                                            <!-- Band Score  -->
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label for="bandscore">Band Score</label><small class="req"> *</small>
                                                    <select id="bandscore" name="bandscore" class="form-control">
                                                        <option value="<?php echo $new_student['bandscore']; ?>"><?php echo $new_student['bandscore']; ?></option>
                                                        <?php foreach ($band_scrore as $class) { ?>
                                                            <option value="<?php echo $class['band_score'] ?>"><?php echo $class['band_score'] ?></option>

                                                        <?php } ?>
                                                    </select>
                                                    <span class="text-danger"><?php echo form_error('bandscore'); ?></span>
                                                </div>

                                            </div>

                                            <!-- Date of birth  -->
                                            <div class="col-md-3">

                                                <div class="form-group">

                                                    <label for="DOB">Date of Birth</label>

                                                    <input autofocus="" id="dob" name="dob" placeholder="" type="date" class="form-control" value="<?php echo set_value('dob', $new_student['dob']); ?>" />

                                                    <span class="text-danger"><?php echo form_error('dob'); ?></span>

                                                </div>

                                            </div>
                                        </div>

                                        <div class="row">
                                            <!-- First name  -->
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label for="first_name">First Name</label> <small class="req"> *</small>
                                                    <input id="first_name" name="first_name" placeholder="" type="text" class="form-control" value="<?php echo set_value('first_name', $new_student['first_name']); ?>" />
                                                    <span class="text-danger"><?php echo form_error('first_name'); ?></span>
                                                </div>
                                            </div>

                                            <!-- Last name  -->
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label for="last_name">Last Name</label>
                                                    <input autofocus="" id="last_name" name="last_name" placeholder="" type="text" class="form-control" value="<?php echo set_value('last_name', $new_student['last_name']); ?>" />
                                                </div>
                                            </div>

                                            <!-- Phone No  -->
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label for="phone">Phone Number</label>
                                                    <input autofocus="" id="phone" name="phone" placeholder="" type="text" class="form-control" value="<?php echo set_value('phone', $new_student['phone']); ?>" />
                                                </div>
                                            </div>

                                            <!-- Email -->
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label for="email">Email</label><small class="req"> *</small>
                                                    <input id="email" name="email" placeholder="" type="text" class="form-control" value="<?php echo set_value('email', $new_student['email']); ?>" />
                                                    <span class="text-danger"><?php echo form_error('email'); ?></span>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <!-- Address  -->
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label for="address">Address</label>
                                                    <input autofocus="" id="address" name="address" placeholder="" type="text" class="form-control" value="<?php echo set_value('address', $new_student['address']); ?>" />
                                                </div>
                                            </div>

                                            <!-- Occupation  -->
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label for="occupation">Occupation</label>
                                                    <input autofocus="" id="occupation" name="occupation" placeholder="" type="text" class="form-control" value="<?php echo set_value('occupation', $new_student['occupation']); ?>" />
                                                </div>
                                            </div>
                                            <!-- Expected band Score  -->
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label for="expected_band_score">Expected Band Score</label>
                                                    <input autofocus="" id="expected_band_score" name="expected_band_score" placeholder="" type="text" class="form-control" value="<?php echo set_value('expected_band_score', $new_student['expected_band_score']); ?>" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <!-- Parsport No  -->
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label for="passportNo">Passport No</label>
                                                    <input autofocus="" id="passportNo" name="passportNo" placeholder="" type="text" class="form-control" value="<?php echo set_value('passportNo', $new_student['passportNo']); ?>" />
                                                </div>
                                            </div>

                                            <!-- Purpose Of IELTS  -->
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label for="purpose">Purpose Of IELTS</label>
                                                    <input autofocus="" id="purpose" name="purpose" placeholder="" type="text" class="form-control" value="<?php echo set_value('purpose', $new_student['purpose']); ?>" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <!-- IELT Course  -->
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label for="ielts_course">IELTS Course</label><small class="req"> *</small>
                                                    <select id="ielts-courses" name="ielts_course" class="form-control">
                                                                <option selected value=" ">Select</option>
                                                        
                                                        <?php foreach ($ieltscourses as $course) {
                                                            if ($new_student['ielts_course'] == $course['id']) {  ?>
                                                                <option selected value="<?php echo $course['id'] ?>"><?php echo $course['section'] ?></option>
                                                            <?php } else { ?>
                                                                <option value="<?php echo $course['id'] ?>"><?php echo $course['section'] ?></option>
                                                            <?php  }
                                                            ?>
                                                        <?php } ?>
                                                    </select>
                                                    <span class="text-danger"><?php echo form_error('ielts_course'); ?></span>
                                                </div>
                                            </div>
                                            <style>
                                                .mock-slots-container {
                                                    margin: 5px;
                                                }

                                                .slot-item {
                                                    width: 150px;
                                                    float: left;
                                                    margin-right: 20px;
                                                }

                                                .slot-item label {
                                                    display: block;
                                                    margin-bottom: 5px;
                                                }

                                                .course_slots_div-label {
                                                    font-weight: 600;
                                                }

                                                hr {
                                                    border: 1px solid #c6c6c6;
                                                    font-size: 5px;
                                                }
                                            </style>
                                        </div>

                                        <!-- Course Slots  -->
                                        <div class="row">
                                            <div class="box-body">
                                                <div class="col-md-4 course_slots_div">
                                                    <label class="course_slots_div-label" for="course_slots">Ielts Slots</label>
                                                    <div class="form-group ">
                                                        <div id="class-slots-ielts" class="mock-slots-container" style="margin: 5px;">

                                                        </div>
                                                    </div>

                                                </div>

                                            </div>
                                            <hr>
                                            <div class="box-body">

                                                <div class="col-md-5 course_slots_div">
                                                    <label class="course_slots_div-label" for="course_slots">Mock Slots</label>
                                                    <div class="form-group ">
                                                        <div id="class-slotss-mock" class="mock-slots-container">

                                                        </div>
                                                    </div>

                                                </div>

                                            </div>
                                            <hr>
                                            <div class="box-body">

                                                <div class="col-md-5 course_slots_div">
                                                    <label class="course_slots_div-label" for="course_slots">General Slots</label>
                                                    <div class="form-group ">
                                                        <div id="class-slotss-general" class="mock-slots-container" style="margin: 5px;">

                                                        </div>
                                                    </div>

                                                </div>
                                            </div>

                                            <hr>
                                            <div class="box-body">

                                                <div class="col-md-5 course_slots_div">
                                                    <label class="course_slots_div-label" for="course_slots">One-to-One Session</label>
                                                    <div class="form-group ">
                                                        <div id="class-slotss-One-to-One" class="mock-slots-container" style="margin: 5px;">

                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                                <div class="box-footer">
                                    <button type="submit" class="btn btn-info pull-right"><?php echo $this->lang->line('save'); ?></button>
                                </div>

                    </form>

                </div>

            </div>

        </div>
    </section>


</div>
<script>
    $(document).ready(function() {

        var studentid = $("#studentid").val();
        var AllselectedSlots;
        $("#ielts-courses").change(function() {

           
            $("#class-slots-ielts").empty();
            $("#class-slotss-mock").empty();
            $("#class-slotss-general").empty();
            $("#class-slotss-One-to-One").empty();

            var ieltsCourseid = $(this).val();

            $.ajax({
                url: `http://lms.ieltsatcia.com/student/getcourseslotdata/${ieltsCourseid}`,
                type: "GET",
                success: function(classSlots) {
                    $.ajax({
                        url: `http://lms.ieltsatcia.com/student/getcourseslotdataofStudents/${studentid}`,
                        type: "GET",
                        success: function(selectedSlotss) {
                            AllselectedSlots = JSON.parse(selectedSlotss)
                        }
                    });
                    classSlots = JSON.parse(classSlots);

                    var SelectedDisplayInputs = [];
                    var SelectedDisplayInputsmock = [];
                    var SelectedDisplayInputsGrammer = [];
                    var SelectedDisplayInputsOnetoOne = [];


                    var UnSelectedDisplayInputs = [];

                    classSlots.forEach(Slot => {
                        var exists = false;
                        AllselectedSlots.forEach(selectedSlot => {
                            if (Slot.id == selectedSlot.course_slot_id) {
                                exists = true;
                            }
                        });
                        if (Slot.type === "IELTS Classes") {
                            if (exists) {
                                SelectedDisplayInputs.push(`<div class="slot-item"><label for="class-slot-${Slot.id}">${Slot.name} </label><input checked type="checkbox" name="ielts_course_slot[]" id="class-slot-${Slot.name}" value="${Slot.id}"></div>`);
                            } else {
                                SelectedDisplayInputs.push(`<div class="slot-item"><label for="class-slot-${Slot.id}">${Slot.name} </label><input type="checkbox" name="ielts_course_slot[]" id="class-slot-${Slot.name}" value="${Slot.id}"></div>`);
                            }
                        }
                        if (Slot.type === "Mock Test") {
                            if (exists) {
                                SelectedDisplayInputsmock.push(`<div class="slot-item"><label for="class-slot-${Slot.id}">${Slot.name} </label><input checked type="checkbox" name="ielts_course_slot[]" id="class-slot-${Slot.name}" value="${Slot.id}"></div>`);
                            } else {
                                SelectedDisplayInputsmock.push(`<div class="slot-item"><label for="class-slot-${Slot.id}">${Slot.name} </label><input type="checkbox" name="ielts_course_slot[]" id="class-slot-${Slot.name}" value="${Slot.id}"></div>`);
                            }
                        }
                        if (Slot.type === "Grammer Classes") {
                            if (exists) {
                                SelectedDisplayInputsGrammer.push(`<div class="slot-item"><label for="class-slot-${Slot.id}">${Slot.name} </label><input checked type="checkbox" name="ielts_course_slot[]" id="class-slot-${Slot.name}" value="${Slot.id}"></div>`);
                            } else {
                                SelectedDisplayInputsGrammer.push(`<div class="slot-item"><label for="class-slot-${Slot.id}">${Slot.name} </label><input type="checkbox" name="ielts_course_slot[]" id="class-slot-${Slot.name}" value="${Slot.id}"></div>`);
                            }
                        }
                        if (Slot.type === "One-to-One Session") {
                            if (exists) {
                                SelectedDisplayInputsOnetoOne.push(`<div class="slot-item"><label for="class-slot-${Slot.id}">${Slot.name} </label><input checked type="checkbox" name="ielts_course_slot[]" id="class-slot-${Slot.name}" value="${Slot.id}"></div>`);
                            } else {
                                SelectedDisplayInputsOnetoOne.push(`<div class="slot-item"><label for="class-slot-${Slot.id}">${Slot.name} </label><input type="checkbox" name="ielts_course_slot[]" id="class-slot-${Slot.name}" value="${Slot.id}"></div>`);
                            }
                        }
                    });
                    $("#class-slots-ielts").append(SelectedDisplayInputs);
                    $("#class-slotss-mock").append(SelectedDisplayInputsmock);
                    $("#class-slotss-general").append(SelectedDisplayInputsGrammer);
                    $("#class-slotss-One-to-One").append(SelectedDisplayInputsOnetoOne);
                }
            });
        });
    });
</script>
<script type="text/javascript" src="<?php echo base_url(); ?>backend/dist/js/savemode.js"></script>
