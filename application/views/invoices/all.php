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
            </form>
        </div> 
        <div style="padding: 10px; border-bottom: 2px solid darkred; border-radius: 4px;">
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                        <tr style="border-bottom: 2px solid gray;">
                            <th>Reference Number</th>
                            <th>Student</th>
                            <th>Reg No</th>
                            <th>Course</th>
                            <th>Payment Type</th>
                            <th>Payment Method</th>
                            <th>Amount</th>
                            <th>Discount</th>
                            <th>Date & Time</th>
                            <th>Actions</th>
                        </tr>
                    </thead>

                    <tbody>
                        <?php foreach ($records as $record) { ?>
                            <tr class="my-auto d-flex align-items-center">
                                <td><?php echo $record->reference_number ?></td>
                                <td><?php echo $record->first_name . ' ' . $record->last_name ?></td>
                                <td><?php echo $record->student_reg_no ?></td>
                                <td><?php echo $record->coursecode ?></td>
                                <td><?php echo $record->payment_type ?></td>
                                <td><?php echo $record->payment_method ?></td>
                                <td><?php echo $record->amount ?> LKR</td>
                                <td><?php echo $record->discount ?>%</td>
                                <td><?php echo $record->timestamp ?></td>
                                <td class="d-flex" style="min-width: 1px;">
                                    <button class="btn btn-primary btn-sm">Print</button>
                                    <button class="btn btn-primary btn-sm">Email</button>
                                    <a href="<?php echo base_url('/invoices/delete/' . $record->id) ?>" class="btn btn-primary btn-sm">Delete</a>
                                </td>
                            </tr>
                        <?php  } ?>
                    </tbody>
                </table>
        </div>
    </section>
</div>