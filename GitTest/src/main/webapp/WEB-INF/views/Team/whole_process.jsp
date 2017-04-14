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

</head>
<body>

<table border="1">
	<tr>
		<td>부서</td><td>진행상황</td>
	</tr>
	<c:forEach var="i" items="${whole}">
		<tr>
			<td><a href="">${i.DEPT_NAME}</a></td>
			<td align="right">${i.AVER}%
				<div class="progress progress-mini">
					<div class="progress-bar" style="width: ${i.AVER}%;">
					</div>
				</div> 
			</td>
		</tr>
	</c:forEach>
</table>
&nbsp;&nbsp;
<a href="javascript:history.back();">뒤로가기</a>

</body>
</html>