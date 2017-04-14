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
	.detailJobView span {
		width: 150px;
		
	}
</style>

<script src="resources/jquery-3.1.1.min.js"></script>
<script>
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
<body>
<c:if test="${members == '[]'}">
	내 부서의 업무 진행사항이 없습니다. <br><br>
</c:if>
<c:if test="${members != '[]'}">
	${members[0].DEPT_NAME} 업무 현황
	<br><br>
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
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="javascript:opened();" id="opened">상세업무 보기</a>
	<a href="javascript:closed();" id="closed">접어두기</a>
</c:if>
&nbsp;&nbsp;
<a href="javascript:history.back();">뒤로가기</a>
</body>
</html>