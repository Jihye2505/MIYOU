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
	$(function() {
		$.ajax({
			type : "get",
			url : "logoutCheck",
			success : function(data) {
				if (data != "true") {
					location.href = "login";
				}
			}
		});
	});

	$(function() {
		$.ajax({
			type : "get",
			url : "lockCheck",
			success : function(data) {
				if (data != "true") {
					location.href = "lockscreen";
				}
			}
		});
	});

	function check() {
		window.open("check", "window", "width=500,height=300");
	}

	function checkForm() {
		var check1 = document.getElementById("check1").value;
		if (check1 == "false"||check1 == null) {
			alert("ID not found");
			return false;
		}
		var check = confirm("Are you sure?");
		if (check) {
			alert("Deleted!");
			return true;
		} else {
			alert("Cancel");
			return false;
		}
	}
	$(function() {
		$("#employee_num").keyup(function(event) {
			$.ajax({
				type : "GET",
				url : "idCheck",
				data : {
					"employee_num" : $("#employee_num").val()
				},
				success : function(data) {

					if (data == "false") {
						$("#check1").text("invalid ID");
						document.getElementById("check1").value = "false";
					} else {
						$("#check1").text("valid ID");
						document.getElementById("check1").value = "true";
					}
				}
			});

		});
	});
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
			<p>Delete a member..</p>
			<form action="memberDelete" class="m-t" method="POST"
				onsubmit="return checkForm();">
				<div class="form-group">
					<input type="text" placeholder="employee_num" class="form-control"
						name="employee_num" id="employee_num">
					<div id="check1"></div>
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