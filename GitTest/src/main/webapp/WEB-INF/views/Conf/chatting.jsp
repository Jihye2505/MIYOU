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
<script type="text/javascript" src="resources/jquery-3.1.1.min.js"></script>
<script>
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

<script src="resources/Vidyo/VidyoConnector.js"></script>
<script type="text/javascript">
var vidyoConnector = opener.vidyoConnector;

function sendingMSG(){
	var userN = $("#displayName").val();
	var lang = $("#language1").val();
	var msg = $("#sentMSG").val();
	myText(userN, lang, msg);
	vidyoConnector.SendChatMessage(msg);
	
	$.ajax({
		method:"get",
		url:"saveChat",
		success:function(resp){
			$("#record").html(resp);	
		}
	});
	
	$("#sentMSG").val("");
};



</script>
</head>
<body>

<input id="displayName" type="hidden" value="${user.name}">
<input type="hidden" id="language1" value="${user.language}"> 

	<div class="ibox float-e-margins">
		<div class="panel panel-success">
			<div class="panel-heading"><h2>CHAT</h2></div>
			<div class="panel-body">
				<div id="record" style="overflow:scroll; width:290px ; height:250px; padding:20px">${saveChat}</div>
				<input type="text" id="sentMSG" class="" size="41" autofocus="autofocus" onkeypress="if(event.keyCode==13) {sendingMSG();}">
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