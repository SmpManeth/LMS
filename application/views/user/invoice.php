<?php
$currency_symbol = $this->customlib->getSchoolCurrencyFormat();
?>
<div class="content-wrapper" style="min-height: 1126px;">
    <section class="content-header">
        <h1>
            <i class="fa fa-money"></i> Payment
        </h1>
    </section>
    <!-- Main content -->
    <section class="invoice">

        <div class="row">
            <div class="alert alert-success alert-dismissible">

                <h4><i class="fa fa-check"></i> Success</h4>
                Thank you for your payment. <a style='color: #3c8dbc;  display: inline-table;' href="<?php echo site_url('user/user/getfees') ?>">click here</a> to fees payment page.
            </div>

        </div>      
    </section>    
    <div class="clearfix"></div>
</div>