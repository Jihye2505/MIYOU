<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Login</title>
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


<body class="login-layout-full login">
<div class="page-brand-info">
  <div class="brand"> <img class="brand-img" src="resources/assets/images/miyou.png" alt="..."> </div>
  <p class="font-size-20">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
    tempor incididunt ut labore et dolore magna aliqua.</p>
</div>
<div class="loginColumns ">
  <div>
    <h1 class="logo-name">MIYOU</h1>
  </div>
  <h3>Start your meeting with MIYOU</h3>
  <p>Now, don't panic even when you meet foreign fellows.</p>
  <form action="login"  class="top15" method="post">
    <div class="form-group">
      <input required="" placeholder="Username" class="form-control" type="text" name="employee_num">
    </div>
    <div class="form-group">
      <input required="" placeholder="Password" class="form-control" type="password" name="password">
    </div>
    <button class="btn aqua block full-width bottom15" type="submit">Login</button>
  </form>
  <p class=" copyR"> <small>SCIT KYSP &copy; 2017</small> </p>
</div>
</body>


</html>