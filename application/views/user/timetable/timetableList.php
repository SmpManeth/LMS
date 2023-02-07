<div class="content-wrapper" style="min-height: 946px;">

    <section class="content-header">

        <h1>

            <i class="fa fa-calendar-times-o"></i> <?php echo $this->lang->line('class_timetable'); ?>
        </h1>

    </section>
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
            ;
            cursor: not-allowed !important;
        }

        .tablse {
            width: 100%;
            max-width: 100%;
            border-collapse: separate;
            border-spacing: 4em;
        }
    </style>
    <!-- Main content -->

    <section class="content">
        <div class="row">
            <div class="col-md-12">


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
                                        <th class="text-center">Attendance</th>
                                        <th class="text-center">Link</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($class_slots as $key => $slot) {
                                        $exists = false;
                                        foreach ($student_course_slots as $key1 => $selectedSlot) {
                                            if ($slot['id'] == $selectedSlot['course_slot_id']) {
                                                $exists = true;
                                            }
                                        }
                                        if ($exists) {
                                            if ($slot['type'] == "IELTS Classes") { ?>
                                                <tr class="table-row">

                                                    <td class="slot"><?php echo $slot['name'] ?></td>
                                                    <td class="slot"><?php echo $slot['date'] ?></td>

                                                    <td class="slot"><?php echo $slot['time'] ?></td>

                                                    <td><a class="slota">Attend</a></td>

                                                    <td><a class="linka" href="https://<?php echo $slot['link'] ?>">Click to Join</a></td>
                                                </tr>
                                            <?php  }
                                        } else {
                                            if ($slot['type'] == "IELTS Classes") { ?>
                                                <tr class="table-row">

                                                    <td class="slot disabled"><?php echo $slot['name'] ?></td>
                                                    <td class="slot disabled"><?php echo $slot['date'] ?></td>

                                                    <td class="slot disabled"><?php echo $slot['time'] ?></td>

                                                    <td><a class="slota-disabled disabled">Attend</a></td>

                                                    <td><a class="linka disabled" href="https://<?php echo $slot['link'] ?>">Click to Join</a></td>
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
                        <h3 class="box-title titlefix">Mock Tests</h3>
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
                                        <th class="text-center">Link</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($class_slots as $key => $slot) {
                                        $exists = false;
                                        foreach ($student_course_slots as $key1 => $selectedSlot) {
                                            if ($slot['id'] == $selectedSlot['course_slot_id']) {
                                                $exists = true;
                                            }
                                        }
                                        if ($exists) {
                                            if ($slot['type'] == "Mock Test") { ?>
                                                <tr class="table-row">

                                                    <td class="slot"><?php echo $slot['name'] ?></td>
                                                    <td class="slot"><?php echo $slot['date'] ?></td>

                                                    <td class="slot"><?php echo $slot['time'] ?></td>

                                                    <td><a class="slota">Attend</a></td>

                                                    <td><a class="linka" href="https://<?php echo $slot['link'] ?>">Click to Join</a></td>
                                                </tr>
                                            <?php  }
                                        } else {
                                            if ($slot['type'] == "Mock Test") { ?>
                                                <tr class="table-row">

                                                    <td class="slot disabled"><?php echo $slot['name'] ?></td>
                                                    <td class="slot disabled"><?php echo $slot['date'] ?></td>

                                                    <td class="slot disabled"><?php echo $slot['time'] ?></td>

                                                    <td><a class="slota-disabled disabled">Attend</a></td>

                                                    <td><a class="linka disabled" href="https://<?php echo $slot['link'] ?>">Click to Join</a></td>
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
                                        <th class="text-center">Link</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($class_slots as $key => $slot) {
                                        $exists = false;
                                        foreach ($student_course_slots as $key1 => $selectedSlot) {
                                            if ($slot['id'] == $selectedSlot['course_slot_id']) {
                                                $exists = true;
                                            }
                                        }
                                        if ($exists) {
                                            if ($slot['type'] == "Grammer Classes") { ?>
                                                <tr class="table-row">

                                                    <td class="slot"><?php echo $slot['name'] ?></td>
                                                    <td class="slot"><?php echo $slot['date'] ?></td>

                                                    <td class="slot"><?php echo $slot['time'] ?></td>

                                                    <td><a class="slota">Attend</a></td>

                                                    <td><a class="linka" href="https://<?php echo $slot['link'] ?>">Click to Join</a></td>
                                                </tr>
                                            <?php  }
                                        } else {
                                            if ($slot['type'] == "Grammer Classes") { ?>
                                                <tr class="table-row">

                                                    <td class="slot disabled"><?php echo $slot['name'] ?></td>
                                                    <td class="slot disabled"><?php echo $slot['date'] ?></td>

                                                    <td class="slot disabled"><?php echo $slot['time'] ?></td>

                                                    <td><a class="slota-disabled disabled">Attend</a></td>

                                                    <td><a class="linka disabled" href="https://<?php echo $slot['link'] ?>">Click to Join</a></td>
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

        </div>



    </section>

</div>