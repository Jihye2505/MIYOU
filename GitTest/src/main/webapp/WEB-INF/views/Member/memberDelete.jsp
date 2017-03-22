<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
   function check() {
      window.open("check", "window", "width=500,height=300");
   }
</script>
</head>
<body>
   <h1>회원탈퇴</h1>
   
   <form action="" method="get">
      <table>
         <tr>
            <td>Employee Id</td>
            <td><input type="text" name="id"></td>
            <td>
               <input type="button" value="검색" onclick="return check();">
            </td>
         </tr>
         <tr>
            <td>Manager Password</td>
            <td><input type="text" name="password" id="password1"></td>
         </tr>
         <tr>
            <td>Manager Password check</td>
            <td><input type="text" id="password2"></td>
         </tr>
         <tr>
            <td>
               <input type="submit" value="삭제">
               <input type="button" value="취소" onclick="">
            </td>
         </tr>
         
      </table>

   </form>
</body>
</html>