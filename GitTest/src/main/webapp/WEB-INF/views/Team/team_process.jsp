<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Team process</title>
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
		</tr>
	</c:forEach>
</table>

</body>
</html>