<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Sent Messages</title>
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
							<div class="mail-box-header">
								<form class="pull-right mail-search" method="get"
									action="index.html">
									<div class="input-group">
										<input class="form-control input-sm" name="search"
											placeholder="Search email" type="text">
										<div class="input-group-btn">
											<button class="btn btn-sm aqua" type="submit">
												Search</button>
										</div>
									</div>
								</form>
								<h2>Sent Messages</h2>
							</div>
							<div class="mail-box">
								<table class="table table-hover table-mail">
									<tbody>
										<c:forEach var="m" items="${sentMessageList}">
											<tr class="read">
												<td class="check-mail"><span class="label label-warning pull-right">${m.checked}</span></td>
												<td class="mail-ontact">${m.employee_num}</td>
												<td class="mail-subject"><a href="readMessage?message_num=${m.message_num}">${m.content }</a></td>
												<td></td>
												<td class="text-right mail-date">${m.send_date}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
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
