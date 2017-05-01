<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Update</title>
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


<script src="resources/jquery-3.1.1.min.js"></script>
<script>

$(function(){
	$.ajax({
		 type : "get"
	     , url : "lockCheck"
	     , success : function(data) {
	    	 if(data != "true") {
	    		 location.href = "lockscreen";
	    	 }
	     }
	});
});

$(function(){
	$("#employee_num").keyup(function(event) {
       $.ajax({
          type: "GET",
          url: "idCheck",
          data: {
             "employee_num" : $("#employee_num").val()
          },
          success: function(data) {
             
             if(data == "false"){
                $("#check1").text("invalid ID");
                document.getElementById("check1").value = "false";
             }
             else{
                $("#check1").text("valid ID");
                document.getElementById("check1").value = "true";
             }
          }
       });
	    
	 }); 
      //다른부분에 입력하지 않을경우 입력된 부분만 갱신되도록 조건문 걸자!!
});

$(function(){
	$("#manager_num").keyup(function(event) {
       $.ajax({
          type: "GET",
          url: "idCheck",
          data: {
             "employee_num" : $("#manager_num").val()
          },
          success: function(data) {
             
             if(data == "false"){
                $("#check2").text("invalid ID");
                document.getElementById("check2").value = "false";
             }
             else{
                $("#check2").text("valid ID");
                document.getElementById("check2").value = "true";
             }
          }
       });
	 }); 
});

function checkForm(){

	var check1 = document.getElementById("check1").value;
	var check2 = document.getElementById("check2").value;
	if(check1 == "false" || check2 == "false"){
		alert("ID not found");
		return false;
	}
	
	return true;
}

</script>

</head>
<body class="aqua-bg login">
<div class="middle-box text-center loginscreen   ">
  <div class="widgets-container">
    <div>
      <h1 class="logo-name">Update</h1>
    </div><br>
    <h3>Update section for manager</h3>
    <p>Update member's information</p>
    <form action="memberUpdate"  class="m-t" method="POST" onsubmit="return checkForm();">
      <div class="form-group">
        <input type="text" placeholder="employee_num" class="form-control" name="employee_num" id="employee_num">
        <div id="check1"></div>
      </div>
      <div class="form-group">
        <input type="text" placeholder="name" class="form-control" name="name" id="name">
      </div>
      <div class="form-group">
        <input type="text" placeholder="manager_num" class="form-control" name="manager_num" id="manager_num">
     	<div id="check2"></div>
      </div>
      <div class="form-group">
        <select required="" placeholder="Job" class="form-control" name="job_id" id="job_id">
        <option selected="selected">Job</option>
        <c:forEach var="i" items="${jobList}">
        		<option value="${i.job_id}">${i.job_name}</option>     
        </c:forEach>
        </select>
      </div>
       <div class="form-group">
        <select required="" placeholder="Department" class="form-control" name="dept_id" id="dept_id">
        <option selected="selected">Department</option>
        <c:forEach var="i" items="${deptList}">
        		<option value="${i.dept_id}">${i.dept_name}</option>     
        </c:forEach>
        </select>
      </div>
      
      <button class="btn aqua block full-width m-b" type="submit">memberUpdate</button>
      <a href="javascript:history.back();" class="btn btn-sm btn-white btn-block">Cancel</a>
    </form>
    <p class="top15"> <small>SCIT KYSP &copy; 2017</small> </p>
  </div>
</div>
</body>
<!-- Go top -->
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="assets/js/vendor/jquery.min.js"></script>
<!-- icheck -->
<script src="assets/js/vendor/icheck.js"></script>
<!-- bootstrap js -->
<script src="assets/js/vendor/bootstrap.min.js"></script>
<!-- main js -->
<!-- <script src="assets/js/main.js"></script> -->
<script>
        $(document).ready(function(){
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-red',
                radioClass: 'iradio_square-green',
            });
        });
    </script>
</html>
