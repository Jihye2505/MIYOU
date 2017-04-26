<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Memo</title>
<!-- Bootstrap -->
<link href="resources/assets/css/bootstrap.min.css" rel="stylesheet">
<!-- fullcalendar -->
<link href='resources/assets/css/fullcalendar.css' rel='stylesheet' />
<link href='resources/assets/css/fullcalendar.print.css' rel='stylesheet' media='print' />
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
<style type="text/css">
body{ 
    overflow:hidden;
}
</style>
</head>
<body>
<form action="">
	<div class="ibox float-e-margins">
		<div class="panel panel-success">
			<div class="panel-heading"><h2>MEMO</h2></div>
			<div class="panel-body">
				<textarea rows="10" cols="47" style="resize: none;"></textarea>
					<br>
					<br>
					<div class="pull-right">
					<input type="reset" value="Flush" class="btn btn-round btn-default">
					<input type="button" value="Close" class="btn  btn-round green btn-outline" onclick="javascript:window.close('this')">
					</div>
			</div>
		</div>
	</div>
</form>
<!-- 
<h2>Memo</h2>
<form action="">
	<textarea rows="10" cols="30"></textarea>
	<br>
	<input type="submit" value="저장하기">
	<input type="reset" value="Flush">
	<input type="button" value="Close" onclick="javascript:window.close('this')">
</form>
 -->
</body>
</html>