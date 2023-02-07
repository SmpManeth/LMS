<style type="text/css">
   @media print {

      .no-print,
      .no-print * {

         display: none !important;

      }

   }

   .option_grade {

      display: none;

   }
</style>

<?php

$currency_symbol = $this->customlib->getSchoolCurrencyFormat();

?>

<div class="content-wrapper">

   <section class="content-header">

      <h1>

         <i class="fa fa-user-plus"></i> <?php echo $this->lang->line('my_profile'); ?> <small><?php echo $this->lang->line('student1'); ?></small>

      </h1>

   </section>

   <section class="content">

      <?php

      foreach ($unread_notifications as $notice_key => $notice_value) {

      ?>

         <div class="dashalert alert alert-success alert-dismissible" role="alert">

            <button type="button" class="alertclose close close_notice stualert" data-dismiss="alert" aria-label="Close" data-noticeid="<?php echo $notice_value->id; ?>"><span aria-hidden="true">&times;</span></button>

            <a href="<?php echo site_url('user/notification') ?>"><?php echo $notice_value->title; ?></a>

         </div>

      <?php

      }

      ?>

      <div class="row">

         <div class="col-md-3">

            <div class="box box-primary">

               <div class="box-body box-profile">

                  <?php if ($sch_setting->student_photo) {

                  ?>

                     <img class="profile-user-img img-responsive img-circle" src="<?php

                                                                                    if (!empty($student['image'])) {

                                                                                       echo base_url() . $student['image'];
                                                                                    } else {

                                                                                       echo base_url() . "uploads/student_images/no_image.png";
                                                                                    }

                                                                                    ?>" alt="User profile picture">

                  <?php } ?>

                  <h3 class="profile-username text-center"><?php echo $student['first_name'] ?></h3>

                  <ul class="list-group list-group-unbordered">

                     <li class="list-group-item">

                        <b><?php echo $this->lang->line('admission_no'); ?></b> <a class="pull-right text-aqua"><?php echo $student['student_reg_no']; ?></a>

                     </li>


                     <li class="list-group-item">

                        <b><?php echo $this->lang->line('class'); ?></b> <a class="pull-right text-aqua"><?php echo $course['section']; ?></a>

                     </li>

                  </ul>

               </div>

            </div>

         </div>

         <div class="col-md-9">

            <div class="nav-tabs-custom theme-shadow">

               <ul class="nav nav-tabs">

                  <li class="active"><a href="#activity" data-toggle="tab" aria-expanded="true"><?php echo $this->lang->line('profile'); ?></a></li>

               </ul>

               <div class="tab-content">
                  <div class="tab-pane active" id="activity">

                     <div class="tshadow mb25 bozero">
                        <h3 class="pagetitleh2">Personal Detail</h3>
                        <div class="table-responsive around10 pt0">

                           <table class="table table-hover table-striped">

                              <tbody>
                                 <tr>
                                    <td><?php echo $this->lang->line('date_of_birth'); ?></td>

                                    <td><?php

                                          if (!empty($student['dob'])) {

                                             echo date($this->customlib->getSchoolDateFormat(), $this->customlib->dateyyyymmddTodateformat($student['dob']));
                                          }

                                          ?></td>

                                 </tr>




                                 <?php if ($sch_setting->mobile_no) { ?>

                                    <tr>

                                       <td><?php echo $this->lang->line('mobile_no'); ?></td>

                                       <td><?php echo $student['phone']; ?></td>

                                    </tr>

                                 <?php }
                                 ?>
                                 <?php if ($sch_setting->student_email) { ?>

                                    <tr>

                                       <td><?php echo $this->lang->line('email'); ?></td>

                                       <td><?php echo $student['email']; ?></td>

                                    </tr>

                                 <?php } ?>
                              </tbody>

                           </table>

                        </div>

                     </div>


                     <div class="tshadow mb25 bozero">

                        <h3 class="pagetitleh2"><?php echo $this->lang->line('address'); ?></h3>

                        <div class="table-responsive around10 pt0">

                           <table class="table table-hover table-striped">

                              <tbody>



                                 <tr>

                                    <td class="col-md-4"><?php echo $this->lang->line('current_address'); ?></td>

                                    <td class="col-md-6"><?php echo $student['address']; ?></td>

                                 </tr>


                              </tbody>

                           </table>

                        </div>

                     </div>



                  </div>
               </div>

            </div>

         </div>

      </div>

   </section>

</div>

<div class="modal fade" id="myTransportFeesModal" role="dialog">

   <div class="modal-dialog modal-sm400">

      <div class="modal-content">

         <div class="modal-header">

            <button type="button" class="close" data-dismiss="modal">&times;</button>

            <h4 class="modal-title title text-center transport_fees_title"></h4>

         </div>

         <div class="modal-body pb0">

            <form id="form11" name="employeeform" method="post" accept-charset="utf-8" enctype="multipart/form-data">

               <input type="hidden" class="form-control" id="transport_student_session_id" value="0" readonly="readonly" />

               <?php echo $this->customlib->getCSRF(); ?>

               <div id='upload_documents_hide_show'>

                  <input type="hidden" name="student_id" value="<?php echo $student_doc_id; ?>" id="student_id">

                  <div class="form-group">

                     <label for="exampleInputEmail1"><?php echo $this->lang->line('title'); ?> <small class="req">*</small></label>

                     <input id="first_title" name="first_title" placeholder="" type="text" class="form-control" value="<?php echo set_value('first_title'); ?>" />

                     <span class="text-danger"><?php echo form_error('first_title'); ?></span>

                  </div>

                  <div class="form-group">

                     <label for="exampleInputEmail1"><?php echo $this->lang->line('documents'); ?> <small class="req">*</small></label>

                     <div class="">

                        <input name="first_doc" placeholder="" type="file" class="form-control filestyle" data-height="40" value="<?php echo set_value('first_doc'); ?>" />

                        <span class="text-danger"><?php echo form_error('first_doc'); ?></span>
                     </div>

                  </div>

               </div>

         </div>

         <div class="modal-footer" style="clear:both">

            <!-- <button type="button" class="btn btn-default pull-left" data-dismiss="modal"><?php //echo $this->lang->line('cancel');     
                                                                                                ?></button> -->

            <button type="submit" class="btn btn-info pull-right"><?php echo $this->lang->line('save'); ?></button>

         </div>

         </form>

      </div>

   </div>

</div>

<?php

function findGradePoints($exam_grade, $exam_type, $percentage)

{



   foreach ($exam_grade as $exam_grade_key => $exam_grade_value) {

      if ($exam_grade_value['exam_key'] == $exam_type) {



         if (!empty($exam_grade_value['exam_grade_values'])) {

            foreach ($exam_grade_value['exam_grade_values'] as $grade_key => $grade_value) {

               if ($grade_value->mark_from >= $percentage && $grade_value->mark_upto <= $percentage) {

                  return $grade_value->point;
               }
            }
         }
      }
   }

   return 0;
}



function findExamGrade($exam_grade, $exam_type, $percentage)

{



   foreach ($exam_grade as $exam_grade_key => $exam_grade_value) {

      if ($exam_grade_value['exam_key'] == $exam_type) {



         if (!empty($exam_grade_value['exam_grade_values'])) {

            foreach ($exam_grade_value['exam_grade_values'] as $grade_key => $grade_value) {

               if ($grade_value->mark_from >= $percentage && $grade_value->mark_upto <= $percentage) {

                  return $grade_value->name;
               }
            }
         }
      }
   }

   return "";
}



function getConsolidateRatio($exam_connection_list, $examid, $get_marks)

{



   if (!empty($exam_connection_list)) {

      foreach ($exam_connection_list as $exam_connection_key => $exam_connection_value) {



         if ($exam_connection_value->exam_group_class_batch_exams_id == $examid) {

            return ($get_marks * $exam_connection_value->exam_weightage) / 100;
         }
      }
   }

   return 0;
}



function getCalculatedExamGradePoints($array, $exam_id, $exam_grade, $exam_type)

{



   $object              = new stdClass();

   $return_total_points = 0;

   $return_total_exams  = 0;

   if (!empty($array)) {



      if (!empty($array['exam_result_' . $exam_id])) {

         foreach ($array['exam_result_' . $exam_id] as $exam_key => $exam_value) {

            $return_total_exams++;

            $percentage_grade    = ($exam_value->get_marks * 100) / $exam_value->max_marks;

            $point               = findGradePoints($exam_grade, $exam_type, $percentage_grade);

            $return_total_points = $return_total_points + $point;
         }
      }
   }



   $object->total_points = $return_total_points;

   $object->total_exams  = $return_total_exams;



   return $object;
}



function getCalculatedExam($array, $exam_id)

{

   $object              = new stdClass();

   $return_max_marks    = 0;

   $return_get_marks    = 0;

   $return_credit_hours = 0;

   $return_exam_status  = false;

   if (!empty($array)) {

      $return_exam_status = 'pass';

      if (!empty($array['exam_result_' . $exam_id])) {

         foreach ($array['exam_result_' . $exam_id] as $exam_key => $exam_value) {



            if ($exam_value->get_marks < $exam_value->min_marks || $exam_value->attendence != "present") {

               $return_exam_status = "fail";
            }



            $return_max_marks    = $return_max_marks + ($exam_value->max_marks);

            $return_get_marks    = $return_get_marks + ($exam_value->get_marks);

            $return_credit_hours = $return_credit_hours + ($exam_value->credit_hours);
         }
      }
   }

   $object->credit_hours = $return_credit_hours;

   $object->get_marks    = $return_get_marks;

   $object->max_marks    = $return_max_marks;

   $object->exam_status  = $return_exam_status;

   return $object;
}

?>

<script type="text/javascript">
   var base_url = '<?php echo base_url() ?>';

   function printDiv(elem) {

      Popup(jQuery(elem).html());

   }



   function Popup(data)

   {



      var frame1 = $('<iframe />');

      frame1[0].name = "frame1";

      frame1.css({
         "position": "absolute",
         "top": "-1000000px"
      });

      $("body").append(frame1);

      var frameDoc = frame1[0].contentWindow ? frame1[0].contentWindow : frame1[0].contentDocument.document ? frame1[0].contentDocument.document : frame1[0].contentDocument;

      frameDoc.document.open();

      frameDoc.document.write('<html>');

      frameDoc.document.write('<head>');

      frameDoc.document.write('<title></title>');

      frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/bootstrap/css/bootstrap.min.css">');

      frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/dist/css/font-awesome.min.css">');

      frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/dist/css/ionicons.min.css">');

      frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/dist/css/AdminLTE.min.css">');

      frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/dist/css/skins/_all-skins.min.css">');

      frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/plugins/iCheck/flat/blue.css">');

      frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/plugins/morris/morris.css">');

      frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/plugins/jvectormap/jquery-jvectormap-1.2.2.css">');

      frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/plugins/datepicker/datepicker3.css">');

      frameDoc.document.write('<link rel="stylesheet" href="' + base_url + 'backend/plugins/daterangepicker/daterangepicker-bs3.css">');

      frameDoc.document.write('</head>');

      frameDoc.document.write('<body>');

      frameDoc.document.write(data);

      frameDoc.document.write('</body>');

      frameDoc.document.write('</html>');

      frameDoc.document.close();

      setTimeout(function() {

         window.frames["frame1"].focus();

         window.frames["frame1"].print();

         frame1.remove();

      }, 500);





      return true;

   }
</script>

<script type="text/javascript">
   $("#form11").on('submit', (function(e) {



      e.preventDefault();

      $.ajax({

         url: "<?php echo site_url("user/user/create_doc") ?>",

         type: "POST",

         data: new FormData(this),

         dataType: 'json',

         contentType: false,

         cache: false,

         processData: false,

         success: function(res)

         {



            if (res.status == "fail") {



               var message = "";



               $.each(res.error, function(index, value) {



                  message += value;

               });



               errorMsg(message);



            } else {



               successMsg(res.message);



               window.location.reload(true);

            }

         }

      });





   }));



   /*--dropify--*/

   $(document).ready(function() {

      // Basic

      $('.filestyle').dropify();





   });

   /*--end dropify--*/
</script>

<script type="text/javascript">
   $(document).ready(function() {

      $('.detail_popover').popover({

         placement: 'right',

         title: '',

         trigger: 'hover',

         container: 'body',

         html: true,

         content: function() {

            return $(this).closest('td').find('.fee_detail_popover').html();

         }

      });

   });



   $(document).ready(function() {

      $('table.display').DataTable();

   });
</script>

<script type="text/javascript">
   $(".myTransportFeeBtn").click(function() {

      $("span[id$='_error']").html("");

      $('#transport_amount').val("");

      $('#transport_amount_discount').val("0");

      $('#transport_amount_fine').val("0");

      var student_session_id = $(this).data("student-session-id");

      $('.transport_fees_title').html("<b>Upload Document</b>");

      $('#transport_student_session_id').val(student_session_id);

      $('#myTransportFeesModal').modal({

         backdrop: 'static',

         keyboard: false,

         show: true

      });

   });





   function printDiv() {



      $('.bg-green').removeClass('label');

      $('.label-danger').removeClass('label');

      $('.label-success').removeClass('label');

      var divElements = document.getElementById('exam').innerHTML;

      var oldPage = document.body.innerHTML;

      document.body.innerHTML =

         "<html><head><title></title></head><body>" +

         divElements + "</body>";

      window.print();

      document.body.innerHTML = oldPage;



      location.reload(true);

   }



   $(document).ready(function() {



      $(document).on('click', '.close_notice', function() {

         var data = $(this).data();





         $.ajax({

            type: "POST",

            url: base_url + "user/notification/read",

            data: {
               'notice': data.noticeid
            },

            dataType: "json",

            success: function(data) {

               if (data.status == "fail") {



                  errorMsg(data.msg);

               } else {

                  successMsg(data.msg);

               }



            }

         });





      });

   });
</script>