<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Team process</title>


<!-- Bootstrap -->
	<link href="assets/css/bootstrap.min.css" rel="stylesheet">
	<!-- adminbag main css -->
	<link href="assets/css/main.css" rel="stylesheet">
	

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
			<td>진행상황(${i.PROCESS}%)<div class="progress progress-mini"><div class="progress-bar" style="width: ${i.PROCESS}%;"></div></div> </td>
		</tr>
	</c:forEach>
</table>


</body>
</html>