<div class="content-wrapper">

    <section class="content-header">
        <h1>
            <i class="fa fa-user-plus"></i>All Invoices
        </h1>
    </section>

    <!-- Main content -->
    <section class="content">
        <div style="padding: 10px; border-bottom: 2px solid darkred; border-radius: 4px;">
            <h3><?php echo $student['first_name'] . ' ' . $student['last_name'] ?></h3>
            <div style="display: flex; flex-wrap: wrap; justify-content: space-between;">
                <div style="width: 30%;">
                    <p><strong>First Name:</strong> <?php echo $student['first_name'] ?></p>
                    <p><strong>Phone:</strong> <?php echo $student['phone'] ?></p>
                    <p><strong>IELTS Course:</strong> <?php echo $student['coursecode'] ?></p>
                </div>
                <div style="width: 30%;">
                    <p><strong>Last Name:</strong> <?php echo $student['last_name'] ?></p>
                    <p><strong>Email:</strong> <?php echo $student['email'] ?></p>
                    <p><strong>Student Register No:</strong> <?php echo $student['student_reg_no'] ?></p>
                </div>
                <div style="width: 30%;">
                    <p><strong>DOB:</strong> <?php echo $student['dob'] ?></p>
                    <p><strong>Address:</strong> <?php echo $student['address'] ?></p>
                </div>
            </div>
        </div>

        <div style="padding: 10px; border-bottom: 2px solid darkred; border-radius: 4px;">
            <h3>Create Invoice</h3>
            <form action="<?php echo base_url(); ?>/invoices/create" method="post">
                <input type="hidden" id="fullPayment" value="<?php echo $course_full_amount ?>">
                <input type="hidden" name="student_id" value="<?php echo $student['id'] ?>">
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="paymentType">Select Payment Type:</label>
                            <select class="form-control" id="paymentType" name="payment_type" onchange="update_payment_type()">
                                <option value="advance">Advance</option>
                                <option value="first_installment">First Installment</option>
                                <option value="second_installment">Second Installment</option>
                                <option value="full">Full</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="paymentMethod">Payment Method:</label>
                            <select class="form-control" id="paymentMethod" name="payment_method">
                                <option value="cash">Cash</option>
                                <option value="bank_transfer">Bank Transfer</option>
                                <option value="cheque">Cheque</option>
                                <option value="card">Card</option>
                                <option value="other">Other</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="dateTime">Date & Time:</label>
                            <input type="datetime-local" class="form-control" id="dateTime" name="timestamp" readonly>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="totalAmount">Amount:</label>
                            <input type="number" class="form-control" id="totalAmount" name="amount" value="0" min="0"  max="<?php echo $course_full_amount ?>" oninput="update_amount()">
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="amount">Discounted Amount:</label>
                            <input type="number" class="form-control" id="amount" disabled>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="discount">Discount:</label>
                            <input type="number" class="form-control" id="discount" name="discount" value="0" min="0" max="20" oninput="update_amount()" readonly>
                        </div>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Create</button>
            </form>
        </div>

        <div style="padding: 10px; border-bottom: 2px solid darkred; border-radius: 4px;">
            <h3>Invoices</h3>
            <table class="table table-striped table-bordered table-hover">
                <thead>
                    <tr style="border-bottom: 2px solid gray;">
                        <th>Reference Number</th>
                        <th>Payment Type</th>
                        <th>Payment Method</th>
                        <th>Amount</th>
                        <th>Discount</th>
                        <th>Date & Time</th>
                        <th>Actions</th>
                    </tr>
                </thead>

                <tbody>
                    <?php foreach ($records as $record) {
                        $amount = $record->discount ? ($record->amount - ($record->discount / 100) * $record->amount) : $record->amount
                    ?>
                        <tr class="my-auto d-flex align-items-center">
                            <td><?php echo $record->reference_number ?></td>
                            <td><?php echo $payment_types[$record->payment_type] ?></td>
                            <td><?php echo $payment_methods[$record->payment_method] ?></td>
                            <td><?php echo $amount ?> LKR</td>
                            <td><?php echo $record->discount ?>%</td>
                            <td><?php echo $record->timestamp ?></td>
                            <td class="d-flex" style="min-width: 200px;">
                                <button class="btn btn-primary btn-sm" style="opacity: 0.5;">Email</button>
                                <a href="<?php echo base_url('/invoices/print/' . $record->id) ?>" class="btn btn-primary btn-sm">Print</a>
                                <a href="<?php echo base_url('/invoices/delete/' . $record->id) ?>" class="btn btn-primary btn-sm">Delete</a>
                            </td>
                        </tr>
                    <?php  } ?>
                </tbody>
            </table>
        </div>
    </section>

</div>

<script type="text/javascript">

    const totalAmount = document.getElementById("totalAmount")
    const amount = document.getElementById("amount")
    const discount = document.getElementById("discount")
    const paymentType = document.getElementById("paymentType")
    const fullPayment = document.getElementById("fullPayment")
    const dateTimeInput = document.getElementById("dateTime")

    function update_amount() {
        if (discount.value > 20) {
            discount.value = 20;
        }
        amount.value = totalAmount.value - ((totalAmount.value / 100) * discount.value);
    }

    function update_payment_type() {
        if (paymentType.value == "full") {
            totalAmount.value = fullPayment.value;
            discount.removeAttribute('readonly');            
            totalAmount.setAttribute('readonly', true);
        } else{
            discount.value = 0;
            totalAmount.removeAttribute('readonly');            
            discount.setAttribute('readonly', true);         
        }
        update_amount();
    }

    function updateDateTimeField() {
        var now = new Date();

        now.setMinutes(now.getMinutes() - now.getTimezoneOffset());
        now.setMilliseconds(null)
        now.setSeconds(null)

        formattedDateTime = now.toISOString().slice(0, -1);
        dateTimeInput.value = formattedDateTime;
        setInterval(updateDateTimeField, 30000);
    }

    updateDateTimeField();
    update_payment_type();
</script>