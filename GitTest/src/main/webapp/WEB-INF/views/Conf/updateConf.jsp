<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Conference Update</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">


<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>


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
	
<!-- <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.0/themes/cupertino/jquery-ui.css" rel="stylesheet"> -->
<link href="resources/assets/css/inputosaurus.css" rel="stylesheet">

<!-- datePicker css -->
<link href="resources/assets/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
<link rel="stylesheet" type="text/css" href="resources/assets/css/daterangepicker.css" />
<link href="resources/assets/css/main.media.css" rel="stylesheet">
<link href="resources/assets/css/morris.css" rel="stylesheet">
<link href="resources/assets/css/simple-line-icons.css" rel="stylesheet">

<script type="text/javascript" src="resources/jquery-3.1.1.min.js"></script>
<script>

$(function(){
	$.ajax({
		 type : "get"
	     , url : "logoutCheck"
	     , success : function(data) {
	    	 if(data != "true") {
	    		 location.href = "login";
	    	 }
	     }
	});
});

$(function(){
	$.ajax({
		 type : "get"
	     , url : "lockCheck"
	     , success : function(data) {
	    	 if(data != "true") {
	    		 location.href = "lockscreen";
	    	 }
	     }
	});
});
</script>

</head>

<body class="page-header-fixed ">
	<%@ include file="../header.jspf"%>
	<div class="clearfix"></div>
	<div class="page-container">
		<%@ include file="../side.jspf"%>
	  <div class="page-content-wrapper">
	    <div class="page-content">
	    <div class="wrapper-content ">
	        <div class="row">
	        
	        <div class="col-lg-12">
			<div class="ibox float-e-margins">
            <div class="tabs-container">
              <ul class="nav nav-tabs">
                <li class="active"><a href="#tab-10" data-toggle="tab"> No. ${conf_mng.conf_num } </a> </li>
              </ul>
              
              <div class="tab-content">
                <div class="tab-pane active" id="tab-10">
                  <div class="panel-body">
              <div class="ibox-content collapse in">
				<br><br>
            <form action="updateConfs" method="get" class="form-horizontal">
              <div class="form-group">
                <label class="col-sm-2 control-label">Title</label>
                <div class="col-sm-10">
                  <!-- <input class="form-control input-lg bottom15" type="text" name="title" id="title"> -->
                  <label class="col-sm-2 control-label"  style="text-align: left;">${conf_mng.title }</label>
                </div>
              </div>
              <hr>
              <div class="form-group">
                <label class="col-sm-2 control-label">Participant</label>
                <div class="col-sm-10">
			       <article>
			         <input type="text" value="${conf_mng.employee_nums }" id="widget2" name="employee_nums"/>
			         <div class="markup">
			            <div>
			               <input type="text" id="widget2_reflect" class="original" disabled="disabled" hidden="hidden">
			               <div id="forToList"></div>
			            </div>
			         </div>
			      </article>
                </div>
                
              </div>
              <hr>

		<div class="form-group">
                <label class="col-sm-2 control-label">Created date</label>
                <div class="col-sm-10">
                  <label class="col-sm-6 control-label" style="text-align: left;">${viewTodate }</label>
                </div>
		</div>              
		<hr>

		<div class="form-group">
			<label class="col-sm-2 control-label">Conf date</label>
			<div class="col-sm-10">
			<div class="input-group date form_datetime" data-date="${stringDate}" data-date-format="yyyy MM dd - HH:ii p" data-link-field="dtp_input1">
			<input class="form-control" type="text" value="${stringDate}" readonly style="z-index: 1;">
			<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span> <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
			<input type="hidden" id="dtp_input1" value="${stringDate}" name="conf_date2"/>
			</div>
			</div>
		</div>
              
              <hr>
              
		<div class="form-group">
			<label class="col-sm-2 control-label">Subtitle</label>
			<div class="col-sm-10">
			<table class="table table-hover ">
                      <thead>
                        <tr>
                          <th> Content </th>
                          <th style="width: 200px"> Manager </th>
                          <th> Progress </th>
                        </tr>
                      </thead>
                      <tbody>
                          	<c:forEach var="conf_topic" items="${list_topic }">
								<tr>
									<td><input class="form-control col-sm-3" type="text" name="subtitle" value="${conf_topic.subtitle }">
										<input type="hidden" name="subtitle_id" value="${conf_topic.subtitle_id }">
									</td>
									
									<td>
									<%-- <input class="form-control col-sm-3" type="text" name="employee_num" value="${conf_topic.employee_num }"> --%>
									<div class="col-sm-12">
								       <article>
								         <input type="text" value="${conf_topic.employee_num }" id="widget3" name="employee_num" class="form-control col-sm-3"/>
								         <div class="markup">
								            <div>
								               <input type="text" id="widget3_reflect" class="original" disabled="disabled" hidden="hidden">
								               <div id="forToList"></div>
								            </div>
								         </div>
								      </article>
					                </div>
									</td>
									
									<td><input class="form-control col-sm-3" type="text" name="process" placeholder="Progress can be input between 0~100." value="${conf_topic.process }"></td>
								</tr>
							</c:forEach>
                      </tbody>
                    </table>
			</div>
		</div>
		<input type="hidden" name="conf_num" value="${conf_mng.conf_num }">
			<input type="hidden" name="title" value="${conf_mng.title }">
			<input type="hidden" name="todate2" value="${conf_mng.todate }">
			<input type="hidden" name="writer" value="${conf_mng.writer }">
			<div align="right">
				<input class="btn aqua" type="submit" value="Update">
				<button class="btn btn-white" type="button" onclick="location.href='selectConf?conf_num=${conf_mng.conf_num }'">cancel</button>
			</div>
            </form>
          </div>
        </div>
				</div>
				</div>
				</div>
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
  
  $('#widget3').inputosaurus({
      width : '100%',
      autoCompleteSource : ${toList },
      activateFinalResult : true,
      change : function(ev){
         $('#widget3_reflect').val(ev.target.value);
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
