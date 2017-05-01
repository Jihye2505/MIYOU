<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>confSummary</title>
<!-- Bootstrap -->
<link href="resources/assets/css/bootstrap.min.css" rel="stylesheet">
<!-- fullcalendar -->
<link href='resources/assets/css/fullcalendar.css' rel='stylesheet' />
<link href='resources/assets/css/fullcalendar.print.css' rel='stylesheet' media='print' />
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
<style type="text/css">
body{ 
    overflow:hidden;
}
</style>
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
<body>

<div class="ibox float-e-margins">
	<div class="panel panel-success">
		<div class="panel-heading">
				<h2>confSummary</h2>
		</div>
		<div class="panel-body">
			<c:if test="${conf_mngForSummary == null}">Nothing found.</c:if>
			<c:if test="${conf_mngForSummary != null}">
				<form action="">
					<h2>Title: ${conf_mngForSummary.title }</h2>
					<h3>Participant : ${employees_numForSummary}</h3>
					<br>
						<table class="table table-hover">
							<thead>
								<tr>
									<th>Subtitle</th>
									<th>Manager</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="i" items="${list_topicForSummary}">
									<tr>
										<td>${i.subtitle }</td>
										<td>${i.employee_num }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
				</form>
			</c:if>
			<br>
			<div class="pull-right">
				<input type="button" value="Close" onclick="javascript:window.close('this')" class="btn  btn-round green btn-outline">	
			</div>
		</div>
	</div>
</div>
<%-- 
<c:if test="${conf_mngForSummary == null}">Nothing found.</c:if>
<c:if test="${conf_mngForSummary != null}">
	<form action="">
		<h2>Title: ${conf_mngForSummary.title }</h2>
		<h3>Participant : ${employees_numForSummary}</h3>
			<table border="1">
				<thead>
					<tr>
						<th>Subtitle</th>
						<th>Manager</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="i" items="${list_topicForSummary}">
						<tr>
							<td>${i.subtitle }</td>
							<td>${i.employee_num }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
	</form>
</c:if> <br>
<input type="button" value="Close" onclick="javascript:window.close('this')">
 --%>
</body>
</html>