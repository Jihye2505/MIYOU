<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Message</title>
<!-- Bootstrap -->
<link href="resources/assets/css/bootstrap.min.css" rel="stylesheet">
<!-- mailbox -->
<link href="resources/assets/css/mailbox.css" rel="stylesheet">
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
<!-- icheck -->
<link href="resources/assets/css/skins/all.css" rel="stylesheet">
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
</script>	

</head>
<body class="page-header-fixed ">
<div class="page-header navbar navbar-fixed-top">
<%@ include file="../header.jspf"%>
</div>
<div class="clearfix"> </div>
<div class="page-container">
  <!-- Start page sidebar wrapper -->
<%@ include file="../side.jspf"%>
  <!-- Start page content wrapper -->
  <div class="page-content-wrapper">
    <div class="page-content" >
      <div class="wrapper-content ">
        <div class="row">
          <%@ include file="messageSide.jspf"%>
          <div class="col-lg-10 animated fadeInRight">
            <div class="mail-box-header">
              <h2> View Message </h2>
              <div class="mail-tools tooltip-demo ">
<%--                 <h3> <span class="font-noraml">Subject: </span>${message.content } </h3> --%>
                <h5> <span class="pull-right font-noraml">${message.send_date }</span> <span class="font-noraml">From : </span>${message.employee_num }</h5>
              </div>
            </div>
            <div class="mail-box">
              <div class="mail-body">
                  <br>
                  ${message.content }
              </div>
              <div class="mail-body text-right tooltip-demo"> <a href="messageCompose?toUser=${message.employee_num }" class="btn btn-sm btn-white"><i class="fa fa-reply"></i> Reply</a> 
                <a href="toTrash?message_num=${message.message_num }" class="btn btn-sm btn-white" data-original-title="Trash" data-toggle="tooltip" data-placement="top" title=""><i class="fa fa-trash-o"></i> Remove</a>
              </div>
              <div class="clearfix"></div>
            </div>
          </div>
        </div>
      </div>
      <input type="hidden" value="${conf_num}" id="conf_num"> 
      
<!-- start footer -->
<%@ include file="../footer.jspf"%>
    </div>
  </div>
</div>
<!-- Go top -->
<a href="#" class="scrollup"><i class="fa fa-chevron-up"></i></a>
<!-- Go top -->
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="resources/assets/js/vendor/jquery.min.js"></script>
<!-- bootstrap js -->
<script src="resources/assets/js/vendor/bootstrap.min.js"></script>
<!-- icheck -->
<script src="resources/assets/js/vendor/icheck.js"></script>
<!-- slimscroll js -->
<script type="text/javascript" src="resources/assets/js/vendor/jquery.slimscroll.js"></script>
<!-- main js -->
<script src="resources/assets/js/main.js"></script>
<script>
function deleteCheck(){
	$.ajax({
		method:"get",
		url:"deleteCheck",
		success:function(resp){
			if(resp==""){
				alert("Conference Canceled");
				history.go(-1);
				return false;
			}
		}
	})
}
  $(document).ready(function(){
            var callbacks_list = $('.demo-callbacks ul');
            $('input.iCheck').on('ifCreated ifClicked ifChanged ifChecked ifUnchecked ifDisabled ifEnabled ifDestroyed', function(event){
              callbacks_list.prepend('<li><span>#' + this.id + '</span> is ' + event.type.replace('if', '').toLowerCase() + '</li>');
            }).iCheck({
              checkboxClass: 'icheckbox_square-red',
              radioClass: 'iradio_square-grey',
              increaseArea: '20%'
            });
          });

</script>
</body>
</html>
