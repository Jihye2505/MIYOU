<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
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



</head>
<body class="aqua-bg login">
<div class="middle-box text-center loginscreen   ">
  <div class="widgets-container">
    <div>
      <h1 class="logo-name">My Info</h1>
    </div>
    <br><p>check your personal information</p><br>
    <form action="javascript:history.back();" class="m-t" method="POST">
    <input type="hidden" id="h" name="h" value="${user.password}">
      <div class="form-group">
        ID: ${user.employee_num}
      </div>
      <div class="form-group">
        Name: ${user.name}
      </div>
      <div class="form-group">
        Manager: ${user.manager_num}
      </div>
      <div class="form-group">
       E-mail: ${user.email}
      </div>
      <div class="form-group">
        Language: ${user.language}
      </div>
      <div class="form-group">
        Tel: ${user.phone}
      </div>
      <div class="form-group">
       Dept number: ${user.dept_id}
      </div>
      <div class="form-group">
        Job number: ${user.job_id}
      </div>
      
      <button class="btn aqua block full-width m-b" type="submit">Back to main</button>
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
<script src="assets/js/main.js"></script>
</html>