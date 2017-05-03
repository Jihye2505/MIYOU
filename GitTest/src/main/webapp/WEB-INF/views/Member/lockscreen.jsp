<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Page is locked</title>
	<!-- Bootstrap -->
	<link href="resources/assets/css/bootstrap.min.css" rel="stylesheet">
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
<script>

$(function(){
	$.ajax({
		 type : "get"
	     , url : "logoutCheck"
	     , success : function(data) {
	    	 if(data != "true") {
	    		 location.href = "login";
	    	 }
	     }
	});
});

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
		$.ajax({
			 type : "get", 
			 url : "locking"
		});
	});

	function check_pw(){
		password = document.getElementById("password").value;
		pw = document.getElementById("pw").value;
		
		if(password != pw){
			alert("password is not correct!");
			document.getElementById("pw").value = "";
			return false;
		}
		
		return true;
	}
</script>

</head>

<body class="aqua-bg login">
	<div class="logo">
		<a href="login"> <img src="resources/assets/images/miyou_main.png" alt=""> </a>
	</div>
	<div class="middle-box text-center loginscreen ">
		<div class="widgets-container">
			<div class="bottom20"> <img alt="image" class="img-circle circle-border" src="resources/assets/images/lock.png" width="128" height="128"> </div>
			<h3> ${user.employee_num} </h3>
			<p>Your are in lock screen. You need to enter your password to go back to main page.</p>
			<form class="top15" action="lockscreen" method="post" onsubmit="return check_pw();">
				<input type="hidden" name="employee_num" id="employee_num" value="${user.employee_num}">
				<input type="hidden" id="password" value="${user.password}">
				<div class="form-group">
					<input class="form-control" placeholder="******" required="" type="password" id="pw">
				</div>
				<button type="submit" class="btn aqua block full-width">Unlock</button>
			</form>
		</div>
	</div>
</body>

</html>