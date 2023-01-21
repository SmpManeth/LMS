<div class="content-wrapper">

    <!-- Main content -->

    <section class="content">

        <div class="row">

            <div class="col-md-12">

                <div class="box box-primary">

                    <form id="form1" action="<?php echo site_url('lead/create') ?>" id="dealform" name="dealform" method="post" accept-charset="utf-8" enctype="multipart/form-data">

                        <div class="">
                            <div class="bozero">
                                <h4 class="pagetitleh-whitebg">Add Lead</h4>
                                <div class="around10">

                                    <?php if ($this->session->flashdata('msg')) { ?>
                                        <?php echo $this->session->flashdata('msg') ?>
                                    <?php } ?>

                                    <?php if (isset($error_message)) { ?>
                                        <div class="alert alert-warning"><?php echo $error_message; ?></div>
                                    <?php } ?>

                                    <?php echo $this->customlib->getCSRF(); ?>

                                    <div class="row">

                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">Course Code</label><small class="req"> *</small>
                                                <select id="class_id" name="class_id" class="form-control">
                                                    <option value="">Select</option>
                                                    <?php foreach ($classlist as $class) { ?>
                                                        <option value="<?php echo $class['id'] ?>"><?php echo $class['class'] ?></option>

                                                    <?php } ?>
                                                </select>
                                                <span class="text-danger"><?php echo form_error('class_id'); ?></span>
                                            </div>

                                        </div>


                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">Band Score</label><small class="req"> *</small>
                                                <select id="class_id" name="class_id" class="form-control">
                                                    <option value="">Select</option>
                                                    <?php foreach ($classlist as $class) { ?>
                                                        <option value="<?php echo $class['id'] ?>"><?php echo $class['class'] ?></option>

                                                    <?php } ?>
                                                </select>
                                                <span class="text-danger"><?php echo form_error('class_id'); ?></span>
                                            </div>

                                        </div>


                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="admission_no">Student Registration No</label> <small class="req"> *</small>
                                                <input autofocus="" id="admission_no" name="admission_no" placeholder="" type="text" class="form-control" value="<?php echo set_value('admission_no'); ?>" />
                                                <span class="text-danger"><?php echo form_error('admission_no'); ?></span>
                                            </div>
                                        </div>

                                    </div>

                                    <div class="row">

                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="admission_no">First Name</label> <small class="req"> *</small>
                                                <input autofocus="" id="admission_no" name="admission_no" placeholder="" type="text" class="form-control" value="<?php echo set_value('admission_no'); ?>" />
                                                <span class="text-danger"><?php echo form_error('admission_no'); ?></span>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="admission_no">Last Name</label> <small class="req"> *</small>
                                                <input autofocus="" id="admission_no" name="admission_no" placeholder="" type="text" class="form-control" value="<?php echo set_value('admission_no'); ?>" />
                                                <span class="text-danger"><?php echo form_error('admission_no'); ?></span>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="admission_no">Phone Number</label>
                                                <input autofocus="" id="admission_no" name="admission_no" placeholder="" type="text" class="form-control" value="<?php echo set_value('admission_no'); ?>" />
                                                <span class="text-danger"><?php echo form_error('admission_no'); ?></span>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="admission_no">Email</label>
                                                <input autofocus="" id="admission_no" name="admission_no" placeholder="" type="text" class="form-control" value="<?php echo set_value('admission_no'); ?>" />
                                                <span class="text-danger"><?php echo form_error('admission_no'); ?></span>
                                            </div>
                                        </div>

                                    </div>

                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="admission_no">Address</label> <small class="req"> *</small>
                                                <input autofocus="" id="admission_no" name="admission_no" placeholder="" type="text" class="form-control" value="<?php echo set_value('admission_no'); ?>" />
                                                <span class="text-danger"><?php echo form_error('admission_no'); ?></span>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="admission_no">Occupation</label> <small class="req"> *</small>
                                                <input autofocus="" id="admission_no" name="admission_no" placeholder="" type="text" class="form-control" value="<?php echo set_value('admission_no'); ?>" />
                                                <span class="text-danger"><?php echo form_error('admission_no'); ?></span>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">IELTS Course</label><small class="req"> *</small>
                                                <select id="class_id" name="class_id" class="form-control">
                                                    <option value="">Select</option>
                                                    <?php foreach ($classlist as $class) { ?>
                                                        <option value="<?php echo $class['id'] ?>"><?php echo $class['class'] ?></option>

                                                    <?php } ?>
                                                </select>
                                                <span class="text-danger"><?php echo form_error('class_id'); ?></span>
                                            </div>

                                        </div>


                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="admission_no">Expected Band Score</label> <small class="req"> *</small>
                                                <input autofocus="" id="admission_no" name="admission_no" placeholder="" type="text" class="form-control" value="<?php echo set_value('admission_no'); ?>" />
                                                <span class="text-danger"><?php echo form_error('admission_no'); ?></span>
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





<script type="text/javascript" src="<?php echo base_url(); ?>backend/dist/js/savemode.js"></script>