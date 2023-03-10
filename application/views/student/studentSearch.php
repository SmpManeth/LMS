<?php

$currency_symbol = $this->customlib->getSchoolCurrencyFormat();

?>

<div class="content-wrapper">

    <section class="content-header">

        <h1>

            <i class="fa fa-user-plus"></i> <?php echo $this->lang->line('student_information'); ?> <small><?php echo $this->lang->line('student1'); ?></small>
        </h1>

    </section>

    <!-- Main content -->

    <section class="content">

        <div class="row">

            <div class="col-md-12">

                <div class="box box-primary">

                    <div class="box-header with-border">

                        <h3 class="box-title"><i class="fa fa-search"></i> <?php echo $this->lang->line('select_criteria'); ?></h3>

                    </div>

                    <div class="box-body">

                        <form id="form1" action="<?php echo site_url('student/search') ?>" id="studentseachfrom" class="class_search_form" name="studentseachfrom" method="post" accept-charset="utf-8" enctype="multipart/form-data">


                            <?php echo $this->customlib->getCSRF(); ?>
                            <?php if ($this->session->flashdata('msg')) { ?> <div class="alert alert-success"> <?php echo $this->session->flashdata('msg') ?> </div> <?php } ?>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label><?php echo $this->lang->line('search_by_keyword'); ?></label>
                                                <input type="text" name="search_text" id="search_text" class="form-control" value="<?php echo set_value('search_text'); ?>" placeholder="Search By Student Name , Email or Phone Number">
                                            </div>
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <button type="submit" name="searchu" value="searuch_full" class="btn btn-primary pull-right btn-sm checkbox-toggle"><i class="fa fa-search"></i> <?php echo $this->lang->line('search'); ?></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>

                    </div>

                </div><!--./col-md-6-->

            </div><!--./row-->

        </div>


        <div class="nav-tabs-custom border0 navnoshadow">

            <div class="box-header ptbnull"></div>

            <ul class="nav nav-tabs">

                <li class="active"><a href="#tab_1" data-toggle="tab" aria-expanded="true"><i class="fa fa-list"></i> <?php echo $this->lang->line('list'); ?> <?php echo $this->lang->line('view'); ?></a></li>

                <li class=""><a href="#tab_2" data-toggle="tab" aria-expanded="false"><i class="fa fa-newspaper-o"></i> <?php echo $this->lang->line('details'); ?> <?php echo $this->lang->line('view'); ?></a></li>

            </ul>

            <div class="tab-content">

                <div class="tab-pane active table-responsive no-padding" id="tab_1">

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
                                <th colspan="3"><?php echo $this->lang->line('action'); ?></th>

                            </tr>

                        </thead>

                        <tbody>
                            <?php foreach ($students as $key => $array) {

                                $id = $array['id'];
                                unset($array['id']);
                                unset($array['created_at']);
                                unset($array['User_id']);
                                unset($array['is_student']);
                            ?>
                                <tr>
                                    <?php foreach ($array as $key => $singleLead) { ?>


                                        <td class=""><?php echo $singleLead ?></td>

                                    <?php  } ?>
                                    <td><a href="<?php echo base_url(); ?>student/edit/<?php echo $id ?>" class="btn btn-default btn-xs" data-toggle="tooltip" title="<?php echo $this->lang->line('edit'); ?>"><i class="fa fa-pencil"></i></a>
                                        <a href="<?php echo base_url(); ?>student/delete/<?php echo $id ?>" class=" btn text-danger" data-toggle="tooltip" title="<?php echo $this->lang->line('delete'); ?>"><i class="fa fa-eraser"></i></a>
                                        <!-- <a class="btn btn-default btn-xs" data-toggle="modal" data-target="#myModal" data-id="<?php echo $id ?>"><i class="fa fa-clock-o" aria-hidden="true"></i>
                                        </a> -->


                                    </td>
                                    <td>
                                        <hr>
                                    </td>
                                </tr>


                            <?php  } ?>


                        </tbody>

                    </table>

                </div>

            </div>

        </div>
        <!-- Class Slots  -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Modal Title</h4>
                    </div>
                    <div class="modal-body">
                        ID: <span id="id-display"></span>
                        <form id="form1" action="<?php echo site_url('student/assignslot/' . $id) ?>" id="employeeform" name="employeeform" method="post" accept-charset="utf-8" enctype="multipart/form-data">




                        </form>
                        <div class="col-md-8">
                            <div class="form-group">
                                <?php
                                foreach ($course_slots as $key => $slot) { ?>
                                    <label for="slot<?php echo $slot['id'] ?>"><?php echo $slot['name'] ?> </label>
                                    <label for="slot<?php echo $slot['id'] ?>"> - <?php echo $slot['type'] ?> </label>
                                    <!-- <input type="text" value="<?php echo $slot['id'] ?>" name="course_slot_id" hidden required> -->
                                    <input type="checkbox" name="course_slot_id[]" value="<?php echo $slot['id'] ?>" id="slot<?php echo $slot['id'] ?>">
                                <?php    } ?>


                                <span class="text-danger"><?php echo form_error('courseslots'); ?></span>
                            </div>

                        </div>


                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-default" data-dismiss="modal">Save</button>
                    </div>
                </div>
            </div>
        </div>


    </section>

</div>
<script>
    $(document).ready(function() {
        $('#myModal').on('show.bs.modal', function(event) {
            var button = $(event.relatedTarget); // Button that triggered the modal
            var id = button.data('id'); // Extract info from data-* attributes

            // Update the modal's content.
            var modal = $(this);
            modal.find('#id-display').text(id);
        });
    });
</script>