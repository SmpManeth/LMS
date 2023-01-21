<div class="content-wrapper">

    <!-- Main content -->

    <section class="content">

        <div class="row">

            <div class="col-md-12">

                <div class="box box-primary">

                    <form id="form1" action="<?php echo site_url('lead/create') ?>" id="leadform" name="leadform" method="post" accept-charset="utf-8" enctype="multipart/form-data">

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

                                        <!-- Course Code  -->
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="coursecode">Course Code</label><small class="req"> *</small>
                                                <select id="coursecode" name="coursecode" class="form-control">
                                                    <option value="">Select</option>
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
                                                    <option value="">Select</option>
                                                    <?php foreach ($band_scrore as $class) { ?>
                                                        <option value="<?php echo $class['band_score'] ?>"><?php echo $class['band_score'] ?></option>

                                                    <?php } ?>
                                                </select>
                                                <span class="text-danger"><?php echo form_error('bandscore'); ?></span>
                                            </div>

                                        </div>
                                    </div>

                                    <div class="row">

                                        <!-- First name  -->
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="first_name">First Name</label> <small class="req"> *</small>
                                                <input id="first_name" name="first_name" placeholder="" type="text" class="form-control" value="<?php echo set_value('first_name'); ?>" />
                                                <span class="text-danger"><?php echo form_error('first_name'); ?></span>
                                            </div>
                                        </div>

                                        <!-- Last name  -->
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="last_name">Last Name</label>
                                                <input autofocus="" id="last_name" name="last_name" placeholder="" type="text" class="form-control" value="<?php echo set_value('last_name'); ?>" />
                                            </div>
                                        </div>

                                        <!-- Phone No  -->
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="phone">Phone Number</label>
                                                <input autofocus="" id="phone" name="phone" placeholder="" type="text" class="form-control" value="<?php echo set_value('phone'); ?>" />
                                            </div>
                                        </div>

                                        <!-- Email -->
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="email">Email</label><small class="req"> *</small>
                                                <input  id="email" name="email" placeholder="" type="text" class="form-control" value="<?php echo set_value('email');?>" />
                                                <span class="text-danger"><?php echo form_error('email'); ?></span>
                                            </div>
                                        </div>

                                    </div>

                                    <div class="row">

                                        <!-- Address  -->
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="address">Address</label>
                                                <input autofocus="" id="address" name="address" placeholder="" type="text" class="form-control" value="<?php echo set_value('address'); ?>" />
                                            </div>
                                        </div>

                                        <!-- Occupation  -->
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="occupation">Occupation</label>
                                                <input autofocus="" id="occupation" name="occupation" placeholder="" type="text" class="form-control" value="<?php echo set_value('occupation'); ?>" />
                                            </div>
                                        </div>

                                        <!-- IELT Course  -->
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="ielts_course">IELTS Course</label><small class="req"> *</small>
                                                <select id="ielts_course" name="ielts_course" class="form-control">
                                                    <option value="">Select</option>
                                                    <?php foreach ($ieltscourses as $course) { ?>
                                                        <option value="<?php echo $course['section'] ?>"><?php echo $course['section'] ?></option>

                                                    <?php } ?>
                                                </select>
                                                <span class="text-danger"><?php echo form_error('ielts_course'); ?></span>
                                            </div>

                                        </div>

                                        <!-- Expected band Score  -->
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="expected_band_score">Expected Band Score</label>
                                                <input autofocus="" id="expected_band_score" name="expected_band_score" placeholder="" type="text" class="form-control" value="<?php echo set_value('expected_band_score'); ?>" />
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