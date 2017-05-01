<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>deleteMember</title>

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
	
	function check() {
		window.open("check", "window", "width=500,height=300");
	}
	
</script>
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
</head>

<body class="aqua-bg login">
	<div class="middle-box text-center loginscreen ">
		<div class="widgets-container">
			<div>
				<h1 class="logo-name">DELETE</h1>
			</div>
			<h3>GET OUT OF HERE</h3>
			<p>Delete a member..</p>
			<p>byebye-.</p>
			<form action="" class="top15" method="get">
				<div class="form-group">
					<input type="text" required="" placeholder="UserID"
						class="form-control" name="id">
				</div>
				
				<div class="form-group">
					<button class="btn aqua block full-width bottom15" type="submit" onclick="return check();">Search</button>
				</div>
				
				<div class="form-group">
					<input type="password" required="" placeholder="Password"
						class="form-control">
				</div>
				<button class="btn aqua block full-width bottom15" type="submit">Delete</button>
			</form>
			<p class="top15">
				<small>SCIT KYSP &copy;2017</small>
			</p>
		</div>
	</div>
</body>

</html>