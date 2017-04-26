<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>confSummary</title>
</head>
<body>
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
</body>
</html>