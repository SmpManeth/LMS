<div class="content-wrapper">

    <section class="content-header">
        <h1>
            <i class="fa fa-user-plus"></i>All Invoices
        </h1>
    </section>

    <!-- Main content -->
    <section class="content">

        <div style="padding: 10px; border-bottom: 2px solid darkred; border-radius: 4px;">
            <h3>Create Invoice</h3>
            <form action="<?php echo base_url(); ?>invoices/exam_create" method="post">
                <input type="text" hidden id="student_id" name="student_id" value="<?php echo $student['id'] ?>">
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="invoiceNumber">Invoice Number:</label>
                            <input type="text" disabled class="form-control" id="invoiceNumber" name="invoice_number">
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="studentName">Student Name:</label>
                            <input type="text" class="form-control" id="studentName" name="student_name" value="<?php echo $student['first_name']  ?> <?php echo $student['last_name']  ?>">
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="examRegNo">Exam Reg No:</label>
                            <input type="text" disabled class="form-control" id="examRegNo" name="exam_reg_no">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="examType">Exam Type:</label>
                            <select class="form-control" id="examType" name="exam_type">
                                <option value="Academic (Normal) - Paper Base">Academic (Normal) - Paper Base</option>
                                <option value="General (Normal) - Paper Base">General (Normal) - Paper Base</option>
                                <option value="Academic (Normal) - Computer Base">Academic (Normal) - Computer Base</option>
                                <option value="General (Normal) - Computer Base">General (Normal) - Computer Base</option>
                                <option value="Academic (UK-VI) - Paper Base">Academic (UK-VI) - Paper Base</option>
                                <option value="General (UK-VI) - Paper Base">General (UK-VI) - Paper Base</option>
                                <option value="Academic (UK-VI) - Computer Base">Academic (UK-VI) - Computer Base</option>
                                <option value="General (UK-VI) - Computer Base">General (UK-VI) - Computer Base</option>
                                <option value="Life Skill A1 - Paper Base">Life Skill A1 - Paper Base</option>
                                <option value="Life Skill B1 - Paper Base">Life Skill B1 - Paper Base</option>
                            </select>
                        </div>

                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="purpose">Purpose:</label>
                            <select class="form-control" id="purpose" name="purpose">
                                <option value="Student Visa" <?php echo ($student['purpose'] == 'Student Visa') ? 'selected' : ''; ?>>Student Visa</option>
                                <option value="PR" <?php echo ($student['purpose'] == 'PR') ? 'selected' : ''; ?>>PR</option>
                                <option value="Work Permit" <?php echo ($student['purpose'] == 'Work Permit') ? 'selected' : ''; ?>>Work Permit</option>
                            </select>
                        </div>

                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="testVenue">Test Venue:</label>
                            <input type="text" class="form-control" id="testVenue" name="test_venue">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="paymentType">Payment Type:</label>
                            <select class="form-control" id="paymentType" name="payment_type">
                                <option selected value="IELTS Test Full Payment">IELTS Test Full Payment</option>
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
                            <label for="examFee">Exam Fee:</label>
                            <input type="number" class="form-control" id="examFee" name="exam_fee" value="0" min="0">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="contact">Contact:</label>
                            <input type="text" class="form-control" id="contact" name="contact" value="<?php echo $student['phone']  ?>">
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="country">Country:</label>
                            <input type="text" class="form-control" id="country" name="country">
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="dateTime">Date & Time:</label>
                            <input type="datetime-local" class="form-control" id="dateTime" name="timestamp" readonly>
                        </div>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Create</button>
            </form>
        </div>
    </section>

</div>

<script>
    const dateTimeInput = document.getElementById("dateTime");
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
</script>