<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Progress of my dept</title>
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

<style>
	span {
		display : inline-block;
	}
	.detailJobView span {
		width: 150px;
		
	}
</style>

<script src="resources/jquery-3.1.1.min.js"></script>
<script>

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

	$(function(){
		$('.detailJobView').css('display','none');
		$('#closed').css('display', 'none');
	});
	
	function opened() {
		$('.detailJobView').css('display','block');
		$('#opened').css('display', 'none');
		$('#closed').css('display', 'inline-block');
	}
	
	function closed() {
		$('.detailJobView').css('display','none');
		$('#closed').css('display', 'none');
		$('#opened').css('display', 'inline-block');
	} 
</script>

</head>
<body class="page-header-fixed ">
<%@ include file="../header.jspf"%>
<div class="clearfix"> </div>
<div class="page-container">
	<%@ include file="../side.jspf"%>
  <!-- Start page content wrapper -->
  <div class="page-content-wrapper">
    <div class="page-content" >
    <div class="wrapper-content ">
				<c:if test="${members == '[]'}">
							Nothing found. <br><br>
				</c:if>
				<c:if test="${members != '[]'}">
      <div class="row wrapper border-bottom page-heading">
				      <div class="col-lg-12">
						<h1>${members[0].DEPT_NAME} progress status</h1>
				      </div>
      </div>
      
      <div class="wrapper-content ">
        <div class="row">
        
			<div class="list-widget white-bg borderedTable" >
        			<table class="table table-hover borderedTable">
                      <thead>
                        <tr>
                          <th>Name</th>
                          <th>Dept</th>
                          <th>Position</th>
                          <th>Progress</th>
                          <th class="detailJobView" style="display:none"></th>
                        </tr>
                      </thead>
                      <tbody>
                          	<c:forEach var="i" items="${members}">
                          	<tr>
								<td>${i.NAME}</td>
								<td>${i.DEPT_NAME}</td>
								<td>${i.JOB_NAME}</td>
								<td align="right">${i.PROCESS}%
									<div class="progress progress-striped">
                    					<div style="width: ${i.PROCESS}%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="${i.PROCESS}" role="progressbar" class="progress-bar progress-bar-success">  </div>
                  					</div>
								</td>
								<td class="detailJobView" style="display:none">
									 <div>Title: ${i.TITLE}</div>
									 <div>Content: ${i.SUBTITLE}</div>
								</td>
							</tr>
							</c:forEach>
                      </tbody>
                    </table>
        </div>
<%--         
	<table border="1">
		<tr>
			<td>이름</td><td>부서명</td><td>직급</td><td>진행상황</td>
		</tr>
		<c:forEach var="i" items="${members}">
			<tr>
				<td>${i.NAME}</td>
				<td>${i.DEPT_NAME}</td>
				<td>${i.JOB_NAME}</td>
				<td align="right">${i.PROCESS}%
					<div class="progress progress-mini">
						<div class="progress-bar" style="width: ${i.PROCESS}%;"></div>
					</div>
				</td>
				<td class="detailJobView" style="display:none">
					 <div>제목: ${i.TITLE}</div>
					 <div>내용: ${i.SUBTITLE}</div>
				</td>
			</tr>
		</c:forEach>
	</table>
	<br>
 --%>	
<div class="pull-right">
	<br>
	<a href="javascript:opened();" id="opened" class="btn btn-info">Detail view</a>
	<a href="javascript:closed();" id="closed" class="btn btn-default">To fold</a>
</div>
				</div>
				</div>
	</c:if>
<!-- 	<a href="javascript:history.back();">뒤로가기</a> -->

				<!-- start footer -->
				<%@ include file="../footer.jspf"%>
				</div>
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
 
 
</script>
</body>
</html>