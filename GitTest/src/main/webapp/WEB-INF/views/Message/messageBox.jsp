<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Messages</title>
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

<script type="text/javascript">
	function btnSubmit(choice) {
		if(choice==1){
			document.submitForm.action='toRead';
		}if(choice==2){
			document.submitForm.action='toTrash';
		}
		
		document.submitForm.submit();
	}
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
						<form  id="pagingForm" action="messages" method="get">
		                  <table class="table">
		                  <tr>
		                  <td style="border-top: none;">
		                  <div class="col-md-4 input-group">
							<select class=" _select js-states form-control" name="searchTitle">
	                        	<option value="content" ${searchTitle == 'content' ? 'selected':''}>content</option>
								<option value="employee_num" ${searchTitle == 'employee_num' ? 'selected':''}>sender</option>
	                        </select>
						  </div>
						  </td>
						  <td style="border-top: none;">
		                <div class="col-md-6 input-group pull-right">
		                  <input class="form-control input-sm" name="searchText" value="${searchText }" placeholder="Search Text" type="text">
		                  <div class="input-group-btn">
		                    <input class="btn btn-sm aqua" type="submit" value="Search">
		                  </div>
	                  	</div>
	                  	</td>
	                  	</tr>
	                  	</table>
              		</form>
						<form method="post" name="submitForm">
							<div class="mail-box-header">
								<!-- <form class="pull-right mail-search" method="get"
									action="index.html">
									<div class="input-group">
										<input class="form-control input-sm" name="search"
											placeholder="Search email" type="text">
										<div class="input-group-btn">
											<button class="btn btn-sm aqua" type="submit">
												Search</button>
										</div>
									</div>
								</form> -->
								
								<h2>Inbox (${unread} New Messages)</h2>
								<div class="mail-tools tooltip-demo ">
									<a href="messages" data-placement="left" data-toggle="tooltip"
										class="btn btn-white btn-sm"
										data-original-title="Refresh inbox">
										<i class="fa fa-refresh"></i> Refresh
									</a>
									<button title="" data-placement="top" data-toggle="tooltip"
										class="btn btn-white btn-sm"
										data-original-title="Mark as read" type="button" onclick="btnSubmit(1)">
										<i class="fa fa-eye"></i>
									</button>
									<button title="" data-placement="top" data-toggle="tooltip"
										class="btn btn-white btn-sm"
										data-original-title="Move to trash" type="button" onclick="btnSubmit(2)">
										<i class="fa fa-trash-o"></i>
									</button>
								</div>
							</div>
							<div class="mail-box">
								<table class="table table-hover table-mail">
									<tbody>
										<c:forEach var="m" items="${messageList}">
											<tr class="${m.checked}">
												<td class="check-mail">
												<input type="checkbox" class="iCheck" name="check" value="${m.message_num}"></td>
												<td class="mail-ontact">${m.employee_num}
													<c:if test="${m.notice=='N'}"><span class="label label-info pull-right">Notice</span></c:if>
												</td>
												<td class="mail-subject"><a href="readMessage?message_num=${m.message_num}">${m.content }</a></td>
												<td></td>
												<td class="text-right mail-date">${m.send_date}</td>
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
