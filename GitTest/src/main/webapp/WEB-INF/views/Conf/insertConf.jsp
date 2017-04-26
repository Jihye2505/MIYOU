<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert Conference</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap -->
<link href="resources/assets/css/bootstrap.min.css" rel="stylesheet">
<!-- icheck -->
<link href="resources/assets/css/skins/all.css" rel="stylesheet">
<!-- slimscroll -->
<link href="resources/assets/css/jquery.slimscroll.css" rel="stylesheet">
<!-- Fontes -->
<link href="resources/assets/css/font-awesome.min.css" rel="stylesheet">
<link href="resources/assets/css/simple-line-icons.css" rel="stylesheet">
<!-- all buttons css -->
<link href="resources/assets/css/buttons.css" rel="stylesheet">
<!-- adminbag main css -->
<link href="resources/assets/css/main.css" rel="stylesheet">
<!-- aqua black theme css -->
<link href="resources/assets/css/aqua-black.css" rel="stylesheet">
<!-- media css for responsive  -->
<link href="resources/assets/css/main.media.css" rel="stylesheet">

<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.0/themes/cupertino/jquery-ui.css" rel="stylesheet">
<link href="resources/assets/css/inputosaurus.css" rel="stylesheet">

<!-- datePicker css -->
<link href="resources/assets/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
<link rel="stylesheet" type="text/css" href="resources/assets/css/daterangepicker.css" />
<link href="resources/assets/css/morris.css" rel="stylesheet">
<link href="resources/assets/css/simple-line-icons.css" rel="stylesheet">

<script>
function frmCheck(){
	var title = document.getElementById('title').value;
	var member = document.getElementById('widget2').value;
	if(title == '' || member == '') {
		alert("Please input appropriate title or participant.");
		return false;
	}
	var changed = document.getElementById('changed').value;
	if(changed.length < 15){
		alert('Select appropriate time');
		return false;
	}
	
	return true;
}

function save(obj) {
    if($("input:checkbox[id='warning']").is(":checked")==true){
       obj.value = 'N';
    } 
 }
</script>


</head>
<body class="page-header-fixed ">
	<%@ include file="../header.jspf"%>
	<div class="clearfix"></div>
	<div class="page-container">
		<%@ include file="../side.jspf"%>
		<!-- Start page content wrapper -->
		<div class="page-content-wrapper">
			<div class="page-content">
				<div class="wrapper-content ">
					<div class="row">

<div class="col-lg-12 top20 bottom20">
          <div class="widgets-container">
            <h3>Conference Planning</h3>
            <br>
            <form action="insertConf" method="post" class="form-horizontal">
              <div class="form-group">
                <label class="col-sm-2 control-label">Title</label>
                <div class="col-sm-10">
                  <input class="form-control input-lg bottom15" type="text" name="title" id="title">
                </div>
              </div>
              <hr>
              <div class="form-group">
                <label class="col-sm-2 control-label">Participant</label>
                <div class="col-sm-10">
			       <article>
			         <input type="text" value="" id="widget2" />
			         <div class="markup">
			            <div>
			               <input type="text" id="widget2_reflect" class="original" disabled="disabled" hidden="hidden">
			               <div id="forToList"></div>
			            </div>
			         </div>
			      </article>
                  <!-- <input class="form-control" type="text"> -->
                </div>
                
              </div>
              <hr>
              
              
              
		<div class="form-group">
			<label class="col-sm-2 control-label">Conf date</label>
			<div class="col-sm-10">
			<div class="input-group date form_datetime" data-date="${conf_mng.conf_date }" data-date-format="yyyy-MM-dd - HH:ii p" data-link-field="dtp_input1">
			<input class="form-control" id="changed" type="text" value="${conf_date}" readonly style="z-index: 1;">
			<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span> <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
			<input type="hidden" id="dtp_input1" value="" name="conf_date2"/>
			</div>
			</div>
		</div>
              
              <%-- 
              <div class="form-group">
                <input name="conf_date2" type="hidden" value="${conf_date}" >
                <label class="col-sm-2 control-label">${conf_date}</label>
                <div class="col-sm-10">
                  <select class="form-control bottom15" name="time">
                    <option value="9" >9시</option>
					<option value="10" >10시</option>
					<option value="11" >11시</option>
					<option value="13" >13시</option>
					<option value="14" >14시</option>
					<option value="15" >15시</option>
					<option value="16" >16시</option>
					<option value="17" >17시</option>
                  </select>
                </div>
              </div>
               --%>
              
              <hr>
              <div class="form-group">
                <label class="col-sm-2 control-label">Subtitle</label>
                <div class="col-sm-10">
                  <input class="form-control" type="text" name="subtitle">
                <div id="parah"></div>
                <br>
				<input class="btn aqua btn-outline btn-block sbold uppercase" name="addButton" type="button" value="Add subtitle">
				<input class="btn  red btn-outline btn-block" value="Delete subtitle" type="button" name="delInput">
				
				<input type="hidden" name="writer" value="${user.employee_num }">
                </div>
              </div>
              <hr>
              <div class="form-group">
                <div align="right"> <!-- <div class="col-sm-4 col-sm-offset-2" align="right"> -->
                  <button class="btn aqua" type="submit" onclick="return frmCheck();">Register</button>&nbsp;
                  <button class="btn btn-white" onclick="history.back()">Cancel</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </div>
              </div>
            </form>
          </div>
        </div>
					</div>
				</div>
				
				<!-- start footer -->
				<%@ include file="../footer.jspf"%>
			</div>
		</div>
	</div>
	
	<a href="#" class="scrollup"><i class="fa fa-chevron-up"></i></a>
	<script src="resources/assets/js/vendor/jquery.min.js"></script>
	<script src="resources/assets/js/vendor/bootstrap.min.js"></script>
	<script src="resources/assets/js/vendor/icheck.js"></script>
	<script type="text/javascript" src="resources/assets/js/vendor/jquery.slimscroll.js"></script>
	<script src="resources/assets/js/main.js"></script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
   	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
   
  	<script src="resources/assets/js/inputosaurus.js"></script>
  	
  	<!-- datePicker용 js -->
	<script src="resources/assets/js/vendor/moment.js"></script>
	<script src="resources/assets/js/vendor/daterangepicker.js"></script>
	<script type="text/javascript" src="resources/assets/js/vendor/bootstrap-datetimepicker.js" charset="UTF-8"></script>
	<script type="text/javascript" src="resources/assets/js/vendor/locales/bootstrap-datetimepicker.ko.js" charset="UTF-8"></script>
   	
<script>
 $(function () {
  $('#myForm').validator();
 });

 $(document)
	.ready(
			function() {
				var callbacks_list = $('.demo-callbacks ul');
				$('input.iCheck')
						.on(
								'ifCreated ifClicked ifChanged ifChecked ifUnchecked ifDisabled ifEnabled ifDestroyed',
								function(event) {
									callbacks_list
											.prepend('<li><span>#'
													+ this.id
													+ '</span> is '
													+ event.type
															.replace(
																	'if',
																	'')
															.toLowerCase()
													+ '</li>');
								}).iCheck({
							checkboxClass : 'icheckbox_square-red',
							radioClass : 'iradio_square-grey',
							increaseArea : '20%'
						});
			});
  
  //추가 버튼
  $(document).on("click","input[name=addButton]",function(){
       
      var addStText =  '<br><input type="text" name="subtitle" class="form-control">';
           
      var inputHtml = $( "input[name=subtitle]:last" ); 
       
      inputHtml.after(addStText); 
       
  });
   
  //삭제 버튼
  $(document).on("click","input[name=delInput]",function(){
       
      var stHtml = $( "input[name=subtitle]:last" ); 
      var brHtml = $( "br:last" ); 
      
      stHtml.remove();
      brHtml.remove();
       
  });
  
  $('#widget2').inputosaurus({
      width : '100%',
      autoCompleteSource : ${toList },
      activateFinalResult : true,
      change : function(ev){
         $('#widget2_reflect').val(ev.target.value);
         var forToList = document.getElementById("forToList");
         forToList.innerHTML="<input type='text' name='employee_nums' hidden='hidden' value="+ev.target.value+">";
      }
   });

   $('.markup').on('click', 'a', function(ev){ $(ev.currentTarget).next('div').toggle();});
   
   $('.form_datetime').datetimepicker({
       //language:  'fr',
       weekStart: 1,
       todayBtn:  1,
   autoclose: 1,
   todayHighlight: 1,
   startView: 2,
   forceParse: 0,
       showMeridian: 1
   });
 $('.form_date').datetimepicker({
       language:  'fr',
       weekStart: 1,
       todayBtn:  1,
   autoclose: 1,
   todayHighlight: 1,
   startView: 2,
   minView: 2,
   forceParse: 0
   });
 $('.form_time').datetimepicker({
       language:  'fr',
       weekStart: 1,
       todayBtn:  1,
   autoclose: 1,
   todayHighlight: 1,
   startView: 1,
   minView: 0,
   maxView: 1,
   forceParse: 0
   });

       $(function () {
           $('#datetimepicker12').datetimepicker({
               inline: true,
               sideBySide: true
           });
     
      $('input[name="daterange"]').daterangepicker();       

       $('input[name="dateTimeRange"]').daterangepicker({
       timePicker: true,
       timePickerIncrement: 30,
       locale: {
           format: 'dd MM yyyy - HH:mm'
       }
   });

   });
</script>
</body>
</html>