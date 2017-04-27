<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chat</title>
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
<script src="resources/Vidyo/VidyoConnector.js"></script>
<script type="text/javascript">

 
function sendingMSG(){
	var mesg = $("#msg").val();
	myText($("#displayName").val(), mesg)
	vidyoConnector.SendChatMessage(mesg);
	$("#record").val(mesg);
	$("#msg").val("");
};

$(document).ready(function(){
	
});
 
 
</script>
</head>
<body>

<input id="displayName" type="hidden" value="${user.name}"> 

	<div class="ibox float-e-margins">
		<div class="panel panel-success">
			<div class="panel-heading"><h2>CHAT</h2></div>
			<div class="panel-body">
				<textarea id="record" rows="10" cols="40" style="resize: none;" readonly="readonly"></textarea>
				<input type="text" id="msg" class="" size="41" autofocus="autofocus" onkeypress="if(event.keyCode==13) {sendingMSG();}">
					<br>
					<br>
					<div class="pull-right">
						<input type="button" value="Close" class="btn  btn-round green btn-outline" onclick="javascript:window.close('this')">
					</div>
			</div>
		</div>
	</div>
</body>
</html>