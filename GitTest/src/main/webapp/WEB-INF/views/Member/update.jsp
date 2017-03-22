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


<script type="text/javascript" src="resources/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
function checkform(){
      var password = document.getElementById("password1");
      var password2 = document.getElementById("password2");
      var email = document.getElementById("email");
      var language = document.getElementById("language");
      var phone = document.getElementById("phone");
      
      if(password.value===""){
         alert("input password");
         return;
      }
      if(password.value!=password2.value){
         alert("check your password");
         return;
      }
      if(password.value===""){
         alert("input password");
         return;
      }

};

</script>

</head>
<body class="aqua-bg login">
<div class="middle-box text-center loginscreen   ">
  <div class="widgets-container">
    <div>
      <h1 class="logo-name">Update</h1>
    </div>
    <h3>Update section</h3>
    <p>Update your personal information</p>
    <form action="update"  class="m-t" method="POST" onsubmit="return checkform()">
      
      <div class="form-group">
        <input type="text" required="" placeholder="Password" class="form-control" name="password" id="password">
      </div>
       <div class="form-group">
        <input type="text" required="" placeholder="Password check" class="form-control" name="password2" id="password2">
      </div>
       <div class="form-group">
        <input type="email" required="" placeholder="Email" class="form-control" name="email" id="email">
      </div>
       <div class="form-group">
        <input type="text" required="" placeholder="Language" class="form-control" name="language" id="language">
      </div>
       <div class="form-group">
        <input type="text" required="" placeholder="Phone" class="form-control" name="phone" id="phone">
      </div>
      
      
      <div class="form-group">
      <button class="btn aqua block full-width m-b" type="submit">Update</button>
      <a href="${pageContext.request.contextPath}/" class="btn btn-sm btn-white btn-block">Cancel</a>
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
<script>
        $(document).ready(function(){
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-red',
                radioClass: 'iradio_square-green',
            });
        });
    </script>
</html>