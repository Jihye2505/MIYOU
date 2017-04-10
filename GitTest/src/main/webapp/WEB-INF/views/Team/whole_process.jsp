<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Team process</title>
<!-- Bootstrap -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet">
<!-- adminbag main css -->
<link href="assets/css/main.css" rel="stylesheet">
<style>
	span {
		display : inline-block;
	}
	#detailJobView span {
		width: 100px;
	}
</style>

<script src="resources/jquery-3.1.1.min.js"></script>
<script>
	$(function(){
		$('#detailJobView').css('display','none');
	});
	
	function opened() {
		$('#detailJobView').css('display','block');
	}
	
	function closed() {
		$('#detailJobView').css('display','none');
	} 
</script>

</head>
<body>

<table border="1">
	<tr>
		<td>팀장(${manager.name})</td>
	</tr>
	<c:forEach var="i" items="${members}">
		<tr>
			<td>팀원(${i.NAME})</td>
			<td>뎊아이디(${i.DEPT_NAME})</td>
			<td>잡아이디(${i.JOB_NAME})</td>
			<td>진행상황(${i.PROCESS}%)
				<div class="progress progress-mini">
					<div class="progress-bar" style="width: ${i.PROCESS}%;">
					</div>
				</div> 
			</td>
			<td ><a href="javascript:opened();">상세 업무 보기</a></td>
			<td id="detailJobView" style="display:none">
				<span>${i.SUBTITLE}</span>
				<input type="button" id="b" value="접어두기" onclick="closed();"> 
			</td>
		</tr>
	</c:forEach>
</table>

</body>
</html>