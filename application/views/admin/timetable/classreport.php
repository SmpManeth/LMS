<div class="content-wrapper" style="min-height: 946px;">
    <style>
        .slot {
            padding: 20px !important;
            box-shadow: 3px 4px 15px 1px #4640403b;
            border-radius: 20px;
            background: #f3f3f330;
        }

        .slota {
            display: block;
            border: 1px solid red;
            padding: 5px;
            color: red;
            border-radius: 5px;
            text-align: center;
        }

        .linka {
            display: block;
            border: 1px solid #72afd2;
            padding: 5px;
            border-radius: 5px;
            text-align: center;
            width: 50%;
            margin: auto;
        }

        .slota:hover {
            background: red;
            color: white;
            cursor: grab;
        }

        .disabled {
            pointer-events: none;
            color: #d1c7c7;
            cursor: not-allowed !important;
            background: #0000001a !important;
        }

        .slota-disabled {
            display: block;
            border: 1px solid #00000047;
            padding: 5px;
            color: white;
            background: #0000001a !important;
            border-radius: 5px;
            text-align: center;
        }

        .slota-disabled:hover {
            background: #0000001a;
            color: white;
            cursor: not-allowed !important;
        }

        .tablse {
            width: 100%;
            max-width: 100%;
            border-collapse: separate;
            border-spacing: 4em;
        }

        .finish {
            display: block;
            pointer-events: none;
            border: 1px solid #72afd2;
            padding: 5px;
            background-color: #34A853;
            color: White;
            border-radius: 5px;
            text-align: center;
            cursor: not-allowed !important;
        }

        /* .finish:hover{
            pointer-events: none;
            color: White;
        } */
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
                                        <th class="text-center">Action</th>
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
                                                    <td><input name="link" type="text" value="<?php echo $slot['link'] ?>"></td>
                                                    <td><input class="linka" type="submit" value="Save"></td>
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
                                        <th class="text-center">Attendance</th>
                                        <th class="text-center">Zoom Link</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($class_slots as $key => $slot) {
                                        $exists = false;
                                        $attended = 0;
                                        $slotid;
                                        foreach ($student_course_slots as $key1 => $selectedSlot) {
                                            if ($slot['id'] == $selectedSlot['course_slot_id']) {
                                                $exists = true;
                                                if ($selectedSlot['is_attended']) {
                                                    $attended = 1;
                                                }
                                                $slotid = $selectedSlot['id'];
                                            }
                                        }
                                        if ($exists) {
                                            if ($slot['type'] == "Mock Test") { ?>
                                                <tr class="table-row">

                                                    <td class="slot"><?php echo $slot['name'] ?></td>
                                                    <td class="slot"><?php echo $slot['date'] ?></td>

                                                    <td class="slot"><?php echo $slot['time'] ?></td>
                                                    <?php
                                                    if ($attended) { ?>
                                                        <td><a id="<?php echo $slotid ?>" class="finish">Completed</a></td>
                                                    <?php } else { ?>
                                                        <td><a id="<?php echo $slotid ?>" class="slota">Attend</a></td>
                                                    <?php }

                                                    ?>


                                                    <td><a class="linka" href="https://<?php echo $slot['link'] ?>" target="_blank">Click to Join</a></td>
                                                </tr>
                                            <?php  }
                                        } else {
                                            if ($slot['type'] == "Mock Test") { ?>
                                                <tr class="table-row">

                                                    <td class="slot disabled"><?php echo $slot['name'] ?></td>
                                                    <td class="slot disabled"><?php echo $slot['date'] ?></td>

                                                    <td class="slot disabled"><?php echo $slot['time'] ?></td>

                                                    <td><a class="slota-disabled disabled">Attend</a></td>

                                                    <td><a class="linka disabled" target="_blank" href="https://<?php echo $slot['link'] ?>">Click to Join</a></td>
                                                </tr>
                                    <?php  }
                                        }
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
                                        <th class="text-center">Attendance</th>
                                        <th class="text-center">Zoom Link</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($class_slots as $key => $slot) {
                                        $exists = false;
                                        $attended = 0;
                                        $slotid;
                                        foreach ($student_course_slots as $key1 => $selectedSlot) {
                                            if ($slot['id'] == $selectedSlot['course_slot_id']) {
                                                $exists = true;
                                                if ($selectedSlot['is_attended']) {
                                                    $attended = 1;
                                                }
                                                $slotid = $selectedSlot['id'];
                                            }
                                        }
                                        if ($exists) {
                                            if ($slot['type'] == "Grammer Classes") { ?>
                                                <tr class="table-row">

                                                    <td class="slot"><?php echo $slot['name'] ?></td>
                                                    <td class="slot"><?php echo $slot['date'] ?></td>

                                                    <td class="slot"><?php echo $slot['time'] ?></td>
                                                    <?php
                                                    if ($attended) { ?>
                                                        <td><a id="<?php echo $slotid ?>" class="finish">Completed</a></td>
                                                    <?php } else { ?>
                                                        <td><a id="<?php echo $slotid ?>" class="slota">Attend</a></td>
                                                    <?php }

                                                    ?>


                                                    <td><a class="linka" href="https://<?php echo $slot['link'] ?>" target="_blank">Click to Join</a></td>
                                                </tr>
                                            <?php  }
                                        } else {
                                            if ($slot['type'] == "Grammer Classes") { ?>
                                                <tr class="table-row">

                                                    <td class="slot disabled"><?php echo $slot['name'] ?></td>
                                                    <td class="slot disabled"><?php echo $slot['date'] ?></td>

                                                    <td class="slot disabled"><?php echo $slot['time'] ?></td>

                                                    <td><a class="slota-disabled disabled">Attend</a></td>

                                                    <td><a class="linka disabled" target="_blank" href="https://<?php echo $slot['link'] ?>">Click to Join</a></td>
                                                </tr>
                                    <?php  }
                                        }
                                    } ?>


                                </tbody>
                            </table>

                        </div>
                    </div>

                </div>
            </div>

    </section>

</div>