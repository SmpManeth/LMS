<div class="content-wrapper" style="min-height: 946px;">
    <style>
        .tablse {
            width: 100%;
            max-width: 100%;
            border-collapse: separate;
            border-spacing: 1em;
        }

        .slot input {
            width: 100%;
            padding: 8px;
            border: 1px solid #D35D6E;
            border-radius: 8px;
            background-color: #F6ECF0;
        }

        .save-button input {
            width: 100%;
            padding: 8px;
            border: none;
            border-radius: 8px;
            color: white;
            background-color: #D35D6E;
        }
    </style>
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

                        <h3 class="box-title"><i class="fa fa-search"></i> <?php echo $this->lang->line('select_criteria'); ?></h3>

                        <div class="box-tools pull-right">

                            <a href="<?php echo site_url('admin/timetable/create') ?>" type="button" class="btn btn-sm btn-primary" autocomplete="off"><i class="fa fa-plus"></i> <?php echo $this->lang->line('add'); ?></a>

                        </div>

                    </div>

                    <form action="<?php echo site_url('admin/timetable/classreport') ?>" method="post" accept-charset="utf-8">
                        <div class="box-body">
                            <?php echo $this->customlib->getCSRF(); ?>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1"><?php echo $this->lang->line('class'); ?></label><small class="req"> *</small>
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


                            </div>

                        </div>

                        <div class="box-footer">

                            <button type="submit" class="btn btn-primary pull-right btn-sm" name="search"><?php echo $this->lang->line('search'); ?></button>

                        </div>

                    </form>

                </div>

                <div class="box box-warning">
                    <div class="box-header ptbnull">
                        <h3 class="box-title titlefix"> IELTS Classes</h3>
                        <hr>
                    </div>

                    <div class="box-body">
                        <div class="table-responsive">
                            <table class="tablse">
                                <thead>
                                    <tr>
                                        <th class="text-center">Slot</th>
                                        <th class="text-center">Date</th>
                                        <th class="text-center">Time</th>
                                        <th class="text-center">Zoom Link</th>
                                        <th class="text-center" colspan="2">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($class_slots as $key => $slot) {
                                        if ($slot['type'] == "IELTS Classes") { ?>
                                            <form action="<?php echo site_url('admin/timetable/timetableupdate/' . $slot['id']) ?>" method="post" accept-charset="utf-8">
                                                <?php echo $this->customlib->getCSRF(); ?>
                                                <tr class="table-row">
                                                   
                                                    <td class="slot"><input name="name" type="text" value="<?php echo $slot['name'] ?>"> </td>
                                                    <td class="slot"><input name="date" type="date" value="<?php echo $slot['date'] ?>"></td>
                                                    <td class="slot"><input name="time" type="time" value="<?php echo $slot['time'] ?>"></td>
                                                    <td class="slot"><input name="link" type="text" value="<?php echo $slot['link'] ?>"></td>
                                                    <td class="save-button"><input class="linka" type="submit" name="save" value="Save"></td>
                                                    <td hidden><input name="id" type="text" value="<?php echo $slot['id'] ?>"> </td>
                                                    <td class="save-button"><input class="linka" type="submit" name="delete" value="Delete"></td>
                                                </tr>
                                            </form>

                                    <?php  }
                                    } ?>


                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="box box-warning">
                    <div class="box-header ptbnull">
                        <h3 class="box-title titlefix">Mock Test</h3>
                        <hr>
                    </div>

                    <div class="box-body">
                        <div class="table-responsive">
                            <table class="tablse">
                                <thead>
                                    <tr>
                                        <th class="text-center">Slot</th>
                                        <th class="text-center">Date</th>
                                        <th class="text-center">Time</th>
                                        <th class="text-center">Zoom Link</th>
                                        <th class="text-center" colspan="2">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($class_slots as $key => $slot) {
                                        if ($slot['type'] == "Mock Test") { ?>
                                            <form action="<?php echo site_url('admin/timetable/timetableupdate/' . $slot['id']) ?>" method="post" accept-charset="utf-8">
                                                <?php echo $this->customlib->getCSRF(); ?>
                                                <tr class="table-row">
                                                    <td class="slot"><input name="name" type="text" value="<?php echo $slot['name'] ?>"> </td>
                                                    <td class="slot"><input name="date" type="date" value="<?php echo $slot['date'] ?>"></td>
                                                    <td class="slot"><input name="time" type="time" value="<?php echo $slot['time'] ?>"></td>
                                                    <td class="slot"><input name="link" type="text" value="<?php echo $slot['link'] ?>"></td>
                                                    <td class="save-button"><input class="linka" type="submit" value="Save"></td>
                                                    <td hidden><input name="id" type="text" value="<?php echo $slot['id'] ?>"> </td>
                                                    <td class="save-button"><input class="linka" type="submit" name="delete" value="Delete"></td>
                                                </tr>
                                            </form>

                                    <?php  }
                                    } ?>


                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="box box-warning">
                    <div class="box-header ptbnull">
                        <h3 class="box-title titlefix">Grammer Classes</h3>
                        <hr>
                    </div>

                    <div class="box-body">
                        <div class="table-responsive">
                            <table class="tablse">
                                <thead>
                                    <tr>
                                        <th class="text-center">Slot</th>
                                        <th class="text-center">Date</th>
                                        <th class="text-center">Time</th>
                                        <th class="text-center">Zoom Link</th>
                                        <th class="text-center" colspan="2">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($class_slots as $key => $slot) {
                                        if ($slot['type'] == "Grammer Classes") { ?>
                                            <form action="<?php echo site_url('admin/timetable/timetableupdate/' . $slot['id']) ?>" method="post" accept-charset="utf-8">
                                                <?php echo $this->customlib->getCSRF(); ?>
                                                <tr class="table-row">
                                                    <td class="slot"><input name="name" type="text" value="<?php echo $slot['name'] ?>"> </td>
                                                    <td class="slot"><input name="date" type="date" value="<?php echo $slot['date'] ?>"></td>
                                                    <td class="slot"><input name="time" type="time" value="<?php echo $slot['time'] ?>"></td>
                                                    <td class="slot"><input name="link" type="text" value="<?php echo $slot['link'] ?>"></td>
                                                    <td class="save-button"><input class="linka" type="submit" value="Save"></td>
                                                    <td hidden><input name="id" type="text" value="<?php echo $slot['id'] ?>"> </td>
                                                    <td class="save-button"><input class="linka" type="submit" name="delete" value="Delete"></td>
                                                </tr>
                                            </form>

                                    <?php  }
                                    } ?>


                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

    </section>

</div>