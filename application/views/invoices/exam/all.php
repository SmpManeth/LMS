<div class="content-wrapper">

    <section class="content-header">
        <h1>
            <i class="fa fa-user-plus"></i>All Invoices
        </h1>
    </section>

    <!-- Main content -->
    <section class="content">
        <div style=" padding: 10px; border-bottom: 2px solid darkred; border-radius: 4px; display: flex; align-items: center; justify-content: space-between;">
            <h3>All Invoices</h3>
           
            <form style="display: flex; justify-content: end; height: 30px;">
                <input type="text" name="search" c>
                <button class="btn btn-sm btn-primary">Search</button>
                <a style="margin-left:5px" href="<?php echo base_url('/invoices/add_exam/') ?>" class="btn btn-primary btn-sm ">Create Invoice</a>
            </form>
           
        </div> 
        <div style="padding: 10px; border-bottom: 2px solid darkred; border-radius: 4px;">
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                        <tr style="border-bottom: 2px solid gray;">
                            <th>Invoice Number</th>
                            <th>Student Name</th>
                            <th>Exam Reg No</th>
                            <th>Exam Type</th>
                            <th>Purpose</th>
                            <th>Test Venue</th>
                            <th>Payment Type</th>
                            <th>Payment Method</th>
                            <th>Exam Fee</th>
                            <th>Contact</th>
                            <th>Country</th>
                            <th>Date & Time</th>
                            <th>Actions</th>
                        </tr>
                    </thead>

                    <tbody>
                        <?php
                        
                        foreach ($records as $record) { 
                            $amount = $record->discount ? ($record->amount - ($record->discount / 100) * $record->amount) : $record->amount
                            
                        ?>
                            <tr class="my-auto d-flex align-items-center">
                                <td><?php echo $record->reference_number ?></td>
                                <td><?php echo $record->student_name?></td>
                                <td><?php echo $record->exam_reg_no ?></td>
                                <td><?php echo $record->exam_type ?></td>
                                <td><?php echo $record->exam_purpose ?></td>
                                <td><?php echo $record->test_venue ?></td>
                                <td><?php echo $record->payment_type ?></td>
                                <td><?php echo $record->payment_method ?></td>
                                <td><?php echo $record->exam_Fee ?></td>
                                <td><?php echo $record->contact ?></td>
                                <td><?php echo $record->country ?></td>
                                <td><?php echo $this->customlib->convertTimezone($record->timestamp, 'Asia/Colombo', 'America/Los_Angeles'); ?></td>
                                <td class="d-flex" style="min-width: 200px;">
                                    <button class="btn btn-primary btn-sm" style="opacity: 0.5;">Email</button>
                                    <a href="<?php echo base_url('/invoices/exam_print/' . $record->reference_number) ?>" class="btn btn-primary btn-sm">Print</a>
                                    <a href="<?php echo base_url('/invoices/exam_delete/' . $record->id) ?>" class="btn btn-primary btn-sm">Delete</a>
                                </td>
                            </tr>
                        <?php  } ?>
                    </tbody>
                </table>
        </div>
    </section>
</div>