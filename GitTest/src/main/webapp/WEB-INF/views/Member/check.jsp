<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>아이디에 따른 정보 검색</h1>
<form action="">
   <input type="text" id="id">
   <input type="button" value="검색"><br>
   <c:if test="true">   <!-- 검색조건은 DB만들고 난 후 해야됨!! -->
      사원이름: <br>
      소속: <br>
      직급: <br>
   </c:if>
   <c:if test="true">
      검색된 데이터가 없습니다. <br>
   </c:if>
   
   <input type="submit" value="확인">
</form>
</body>
</html>