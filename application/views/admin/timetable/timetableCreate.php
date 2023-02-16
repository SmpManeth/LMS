<style type="text/css">
    .select2-container--default .select2-selection--single .select2-selection__rendered {

        line-height: 22px !important;
        border-radius: 0 !important;
        padding-left: 0 !important;
    }

    .input-group-addon .glyphicon {
        font-size: 12px;
    }


    .show {

        display: block;

        z-index: 100;

        background-image: url('../../backend/images/timeloader.gif');

        opacity: 0.6;

        background-repeat: no-repeat;

        background-position: center;

    }

    /* .tab-pane{min-height: 200px;}*/

    .commentForm .input-group {
        position: relative;
        display: block;
        border-collapse: separate;
    }

    .commentForm .input-group-addon {

        position: absolute;

        right: 26px;

        top: 0px;

        z-index: 3;

    }

    .relative {
        position: relative;
    }

    .commentForm .input-group-addon i,

    .commentForm .input-group-addon span {
        padding-left: 13px;
    }

    .commentForm .relative label.text-danger {
        position: absolute;
        bottom: 5px;
    }

    .addbtnright {
        position: absolute;
        right: 0;
        top: -46px;
    }



    @media(max-width:767px) {

        .timeresponsive {
            overflow-x: auto;
            overflow-y: hidden;
        }

        .timeresponsive .dropdown-menu {
            z-index: 1060;
            bottom: 0 !important;
            height: 250px;
            padding: 20px;
        }

        .tablewidthRS {
            width: 690px;
        }

    }
</style>

<script src="<?php echo base_url(); ?>backend/custom/jquery.validate.min.js"></script>



<div class="content-wrapper">

    <!-- Content Header (Page header) -->

    <section class="content-header">

        <h1>

            <i class="fa fa-mortar-board"></i> <?php echo $this->lang->line('academics'); ?> <small><?php echo $this->lang->line('student_fees1'); ?></small>
        </h1>

    </section>

    <!-- Main content -->

    <section class="content">

        <div class="row">

            <div class="col-md-12">

                <div class="box box-primary">

                    <div class="box-header with-border">

                        <h3 class="box-title"><i class="fa fa-search"></i>Add Course Slots</h3>

                        <div class="box-tools pull-right">

                        </div>

                    </div>

                    <form action="<?php echo site_url('admin/timetable/create') ?>" method="post" accept-charset="utf-8">

                        <div class="box-body">



                            <?php echo $this->customlib->getCSRF(); ?>

                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label><?php echo $this->lang->line('class'); ?><small class="req"> *</small></label>
                                        <select autofocus="" id="class_id" name="class_id" class="form-control">
                                            <option value=""><?php echo $this->lang->line('select'); ?></option>
                                            <?php
                                            foreach ($ieltscourses as $class) { ?>
                                                <option value="<?php echo $class['id'] ?>"> <?php echo $class['section'] ?></option>
                                            <?php } ?>
                                        </select>
                                        <span class="text-danger"><?php echo form_error('class_id'); ?></span>
                                    </div>
                                </div>

                                <div class="col-md-4">

                                    <div class="form-group">

                                        <label>Slot Type<small class="req"> *</small></label>

                                        <select id="type" name="type" class="form-control">
                                        <option value="">Select</option>
                                            <option value="Grammer Classes">Grammer Classes</option>
                                            <option value="IELTS Classes">IELTS Classes</option>
                                            <option value="Mock Test">Mock Test</option>
                                            <option value="One-to-One Session">One-to-One Session</option>
                                        </select>

                                        <span class="text-danger"><?php echo form_error('type'); ?></span>

                                    </div>

                                </div>

                                <div class="col-md-4">

                                    <div class="form-group">

                                        <label>Slot Name<small class="req"> *</small></label>

                                        <input name="name" id="name" type="text" class="form-control">

                                        <span class="text-danger"><?php echo form_error('name'); ?></span>

                                    </div>

                                </div>

                            </div>

                        </div>

                        <div class="box-footer">

                            <button type="submit" class="btn btn-primary pull-right btn-sm">Add Slot</button>

                        </div>

                    </form>





                    <div class="box-header ptbnull"></div>

                    <div class="nav-tabs-custom">

                        <ul class="nav nav-tabs" id="myTabs">

                            <?php

                            $count = 1;



                            foreach ($getDaysnameList as $days_key => $days_value) {

                                $cls = "";

                                if ($count == 1) {
                                }

                            ?>

                                <li <?php echo $cls; ?>><a href="#tab_<?php echo $count; ?>" data-c="<?php echo set_value('class_id'); ?>" data-days="<?php echo $days_value; ?>" data-s="<?php echo set_value('section_id'); ?>" data-group="<?php echo set_value('subject_group_id'); ?>" data-day="<?php echo $days_key; ?>" data-toggle="tab" aria-expanded="true"><?php echo $days_value; ?></a></li>



                            <?php

                                $count++;
                            }

                            ?>

                        </ul>

                        <div class="tab-content">

                            <?php

                            $count = 1;

                            foreach ($getDaysnameList as $days_key => $days_value) {

                                $cls = "class='tab-pane'";

                                if ($count == 1) {
                                }

                            ?>

                                <div <?php echo $cls; ?> id="tab_<?php echo $count; ?>">

                                </div>



                            <?php

                                $count++;
                            }

                            ?>



                        </div>

                    </div>

                </div>
            </div>
        </div>

    </section>

</div>
