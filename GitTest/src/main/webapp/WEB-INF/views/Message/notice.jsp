<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Notice</title>
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
	<%@ include file="../header.jspf"%>
	<div class="clearfix"></div>
	<div class="page-container">
		<%@ include file="../side.jspf"%>
		<!-- Start page content wrapper -->
		<div class="page-content-wrapper">
			<div class="page-content">
				<div class="wrapper-content ">
					<div class="row">
						<%@ include file="messageSide.jspf"%>
						<div class="col-lg-10 animated fadeInRight">
						
						<form method="post" action="toTrash">
							<div class="mail-box-header">
								<h2>Notice</h2>
								<div class="mail-tools tooltip-demo ">
									<div class="btn-group pull-right">
									</div>
									<button title="" data-placement="top" data-toggle="tooltip" class="btn btn-white btn-sm"
										data-original-title="Move to trash">
										<i class="fa fa-trash-o"></i>
									</button>
								</div>
							</div>
							<div class="mail-box">
								<table class="table table-hover table-mail">
									<tbody>
										<c:forEach var="n" items="${noticeList}">
											<tr class="${n.checked}">
												<td class="check-mail">
												<input type="checkbox" class="iCheck" name="check" value="${n.message_num}"></td>
												<td class="mail-ontact">${n.employee_num} <span class="label label-info pull-right">Notice</span></td>
												<td class="mail-subject"><a href="readMessage?message_num=${n.message_num}">${n.content }</a></td>
												<td></td>
												<td class="text-right mail-date">${n.send_date}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</form>
							
						</div>
					</div>
				</div>

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
	<script type="text/javascript"
		src="resources/assets/js/vendor/jquery.slimscroll.js"></script>
	<!-- main js -->
	<script src="resources/assets/js/main.js"></script>
	<script>
		$(document)
				.ready(
						function() {
							var callbacks_list = $('.demo-callbacks ul');
							$('input.iCheck')
									.on(
											'ifCreated ifClicked ifChanged ifChecked ifUnchecked ifDisabled ifEnabled ifDestroyed',
											function(event) {
												callbacks_list
														.prepend('<li><span>#'
																+ this.id
																+ '</span> is '
																+ event.type
																		.replace(
																				'if',
																				'')
																		.toLowerCase()
																+ '</li>');
											}).iCheck({
										checkboxClass : 'icheckbox_square-red',
										radioClass : 'iradio_square-grey',
										increaseArea : '20%'
									});
						});
	</script>
</body>
</html>
