<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Conf No. ${conf_mng.conf_num }</title>
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
<!-- project -->
	<link href="resources/assets/css/project.css" rel="stylesheet">
<script type="text/javascript" src="resources/jquery-3.1.1.min.js"></script>
<script type="text/javascript">

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

function deleteCheck(){
	var check = confirm("Are you sure?");
	if(check){ alert("Deleted!");
		$.ajax({
		  	type : "get"
		    , url : "countDown"
		});
	}else{
		alert("Cancel");
		return false;
	}
}	

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
				<div class="ibox-title">
					<h5>${conf_mng.title }</h5>
				</div>
				
				<div class="list-widget white-bg borderedTable" >
					<ul class="list-unstyled clearfix">
						<li> <i class="fa fa-users"></i> <span class="text">Participant</span> <span class="right">${conf_mng.employee_nums }</span> </li>
						<li> <i class="fa fa-pencil-square-o"></i> <span class="text">Date</span> <span class="right">${viewTodate }</span> </li>
						<li> <i class="fa fa-calendar"></i> <span class="text">Conf date</span> <span class="right">${viewConf_date }</span> </li>
						<li style="border-bottom: none;"> <i class="fa fa-sticky-note-o"></i> <span class="text">Attached file</span> 
							<span class="right">
								<c:if test="${conf_mng.originalfile != null}">
									${conf_mng.originalfile} &nbsp;	
									<a href="download?conf_num=${conf_mng.conf_num }"><span class="label btn circle badge-danger right">Download</span></a>
								</c:if>
							</span> 
						</li>
					</ul>
				</div>
				
				<br><br>
					<div class="form-group">
		                <label class="col-sm-2 control-label">Detail</label>
		                <div class="col-sm-10">
                  <div class="table-scrollable">
                    <table class="table table-hover ">
                      <thead>
                        <tr>
                          <th>  </th>
                          <th> Subtitle </th>
                          <th> Manager </th>
                          <th> Progress </th>
                        </tr>
                      </thead>
                      <tbody>
                          	<c:forEach var="conf_topic" items="${list_topic }">
								<tr>
									<td></td>
									<td>${conf_topic.subtitle }</td>
									<td>${conf_topic.employee_num }</td>
									<td align="right">${conf_topic.process}%
									<div class="progress progress-striped">
                    					<div style="width: ${conf_topic.process }%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="${conf_topic.process }" role="progressbar" class="progress-bar progress-bar-success"> <span class="sr-only"> 40% Complete (success) </span> </div>
                  					</div>
									</td>
								</tr>
							</c:forEach>
                      </tbody>
                    </table>
                  </div>
		                </div>
		              </div>
		              <br>
				 
				 <div class="pull-right">
		<c:if test="${user.employee_num == conf_mng.writer}">
			<table style="margin-right: 10px;">
			<tr>
			<td  style="padding: 10px;">
			<form action="updateConf" method="get">
				<input type="hidden" name="conf_num" value="${conf_mng.conf_num }">
				<input class="btn btn-default btn-sm" type="submit" value="Update">
			</form>
			</td>
			<td>
			<form action="deleteConf" method="post" onsubmit="return deleteCheck()">
				<input type="hidden" name="conf_num" value="${conf_mng.conf_num }">
				<input type="hidden" name="title" value="${conf_mng.title }">
				<input type="hidden" name="conf_date" value="${conf_mng.conf_date }">
				<input type="hidden" name="employee_nums" value="${conf_mng.employee_nums }">
				<input class="btn default btn-sm" type="submit" value="Delete">
			</form>
			</td>
			</tr>
			</table>
		</c:if>
		<c:forEach var="conf_topic" items="${list_topic }">
		<c:if test="${user.employee_num == conf_topic.employee_num}">
			<table style="margin-right: 10px;">
			<tr>
			<td  style="padding: 10px;">
			<form action="updateConf" method="get">
				<input type="hidden" name="conf_num" value="${conf_mng.conf_num }">
				<input class="btn btn-default btn-sm" type="submit" value="Update">
			</form>
			</td>
			</tr>
			</table>
		</c:if>
		</c:forEach>
		
		</div>
				 
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
	<!-- Go top -->
	<a href="#" class="scrollup"><i class="fa fa-chevron-up"></i></a>
	<!-- Go top -->
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="resources/assets/js/vendor/jquery.min.js"></script>
	<!-- bootstrap js -->
	<script src="resources/assets/js/vendor/bootstrap.min.js"></script>
	<!-- icheck -->
	<script src="resources/assets/js/vendor/icheck.js"></script>
	<!-- slimscroll js -->
	<script type="text/javascript" src="resources/assets/js/vendor/jquery.slimscroll.js"></script>
	<!-- main js -->
	<script src="resources/assets/js/main.js"></script>
	<script>
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
	</script>
</body>
</html>

</body>
</html>
