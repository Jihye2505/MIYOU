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
function pagingForSubmit(currentPage){
	var form = document.getElementById("pagingForm");
	var page = document.getElementById("page");
	page.value = currentPage;
	form.submit();
	
}

function countPerPage() {
	var countPerPage = document.getElementById("countPerPage").value;
	alert(countPerPage)
	location.href('boardList?countPerPage=20');
}

</script>
</head>
<body>
<div>
<h2>[ 회의 목록 ]</h2>
<a href="login">처음으로</a>
<a href="confList?searchTitle=employee_num&page=1&searchText=${user }">내 업무 확인</a>
<!-- 검색 -->
<form id="pagingForm" action="confList" method="get">
	<select name="searchTitle">
		<option value="title" ${searchTitle == 'title' ? 'selected':''}>제목</option>
		<option value="subtitle" ${searchTitle == 'subtitle' ? 'selected':''}>내용</option>
		<option value="employee_nums" ${searchTitle == 'employee_nums' ? 'selected':''}>참여자</option>
		<option value="employee_num" ${searchTitle == 'employee_num' ? 'selected':''}>담당자</option>
	</select> 
	<input type="hidden" name="page" id="page">
	<input type="text" name="searchText" value="${searchText }"> 
	<input type="button" onclick="pagingForSubmit(1)" value="검색">
</form>
<br />
<!-- <select id="countPerPage" onchange="countPerPage(this)"> -->
<!-- 		<option value="10">10</option> -->
<!-- 		<option value="15">15</option> -->
<!-- 		<option value="20">20</option> -->
<!-- </select> -->
<table border="1">
	<tr>
		<th>회의번호</th>
		<th>제목</th>
		<th>참여자</th>
		<th>작성일</th>
		<th>회의날짜</th>
	</tr>
	<c:forEach var="conf" items="${confList }">
		<tr>
			<td>${conf.conf_num }</td>
			<td><a href="selectConf?conf_num=${conf.conf_num }">${conf.title }</a></td>
			<td>${conf.employee_nums }</td>
			<td>${conf.todate }</td>
			<td>${conf.conf_date }</td>
		</tr>
	</c:forEach>
</table>
</div>
<div>
<c:if test="${navi.startPageGroup != 1 }" >
	<a href="javascript:pagingForSubmit(${navi.startPageGroup-1 })" >◁◁</a>
</c:if>
<c:if test="${navi.currentPage != 1 }" >
	<a href="javascript:pagingForSubmit(${navi.currentPage-1 })" >◀</a>
</c:if>
<c:forEach var="page" begin="${navi.startPageGroup }" end="${navi.endPageGroup }">
	<a href="javascript:pagingForSubmit(${page })">${page }</a>
</c:forEach>
<c:if test="${navi.currentPage<navi.totalPageCount }" >
	<a href="javascript:pagingForSubmit(${navi.currentPage+1 })" >▶</a>
</c:if>
<c:if test="${navi.endPageGroup<navi.totalPageCount }" >
	<a href="javascript:pagingForSubmit(${navi.endPageGroup+1 })" >▷▷</a>
</c:if>
</div>
</body>
</html>