<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Join</title>
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
<!--[if lt IE 9]> <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script> <![endif]-->
<!--[if lt IE 9]> <script src="dist/html5shiv.js"></script> <![endif]-->

<script type="text/javascript" src="resources/jquery-3.1.1.min.js"></script>
<script type="text/javascript">

function deleteCheck(){
	var check = confirm("삭제")
	if(check) alert("삭제완료");
	else alert("취소");
	return;
}	

</script>
</head>
<body>
<table border="1">
	<tr>
		<td>회의 번호</td>
		<td>참여자</td>
		<td>작성일</td>
		<td>회의날짜</td>
		<td>첨부파일</td>
	</tr>
	<tr>
		<td>${conf_mng.conf_num }</td>
		<td>${conf_mng.employee_nums }</td>
		<td>${conf_mng.todate }</td>
		<td>${conf_mng.conf_date }</td>
		<td>
			<c:if test="${conf_mng.originalfile != null}">
				<a href="download?conf_num=${conf_mng.conf_num }">${conf_mng.originalfile}></a>
				<img src="download?conf_num=${conf_mng.conf_num }">
			</c:if>
		</td>
	</tr>
</table>
<br>
제목 : ${conf_mng.title }
<br>
<table border="1">	
	<tr>
		<td>안건</td>
		<td>담당자</td>
		<td>진행상황</td>
	</tr>

	<c:forEach var="conf_topic" items="${list_topic }">
		<tr>
			<td>${conf_topic.subtitle }</td>
			<td>${conf_topic.employee_num }</td>
			<td>${conf_topic.process }</td>
		</tr>
	</c:forEach>
</table>
	<c:if test="${user.employee_num == conf_mng.writer}">
		<form action="updateConf" method="get">
			<input type="hidden" name="conf_num" value="${conf_mng.conf_num }">
			<input type="submit" value="수정">
		</form>
		<form action="deleteConf" method="post" onclick="deleteCheck()">
			<input type="hidden" name="conf_num" value="${conf_mng.conf_num }">
			<input type="submit" value="삭제">
		</form>
	</c:if>
</body>
</html>