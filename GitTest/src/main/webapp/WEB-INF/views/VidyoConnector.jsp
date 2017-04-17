<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>VidyoConnector</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>

<!-- We've provide some simple styling to get you started. -->
<link href="resources/Vidyo/VidyoConnector.css" rel="stylesheet"
	type="text/css">
	
<!-- main style -->
<link href="resources/assets/css/main.css" rel="stylesheet">

<!-- Here we load the application which knows how to
	invoke the VidyoConnector API. -->
<script	src="https://static.vidyo.io/4.1.9.5/javascript/VidyoClient/VidyoClient.js?onload=onVidyoClientLoaded"></script>
<script src="resources/Vidyo/VidyoConnector.js"></script>
<script type="text/javascript">
	function onVidyoClientLoaded(status) {
		console.log("Status: " + status.state + "Description: "
				+ status.description);
		switch (status.state) {
		case "READY": // The library is operating normally
			$("#connectionStatus").html("Ready to Connect");
			$("#helper").addClass("hidden");
			// After the VidyoClient is successfully initialized a global VC object will become available
			// All of the VidyoConnector gui and logic is implemented in VidyoConnector.js
			StartVidyoConnector(VC);
			break;
		case "RETRYING": // The library operating is temporarily paused
			$("#connectionStatus").html(
					"Temporarily unavailable retrying in " + status.nextTimeout
							/ 1000 + " seconds");
			break;
		case "FAILED": // The library operating has stopped
			ShowFailed(status);
			$("#connectionStatus").html("Failed: " + status.description);
			break;
		case "FAILEDVERSION": // The library operating has stopped
			UpdateHelperPaths(status);
			ShowFailedVersion(status);
			$("#connectionStatus").html("Failed: " + status.description);
			break;
		case "NOTAVAILABLE": // The library is not available
			UpdateHelperPaths(status);
			$("#connectionStatus").html(status.description);
			break;
		}
		return true; // Return true to reload the plugins if not available
	}
	function UpdateHelperPaths(status) {
		$("#helperPlugInDownload").attr("href", status.downloadPathPlugIn);
		$("#helperAppDownload").attr("href", status.downloadPathApp);
	}
	function ShowFailed(status) {
		var helperText = '';
		// Display the error
		helperText += '<h2>An error occurred, please reload</h2>';
		helperText += '<p>' + status.description + '</p>';

		$("#helperText").html(helperText);
		$("#failedText").html(helperText);
		$("#failed").removeClass("hidden");
	}
	function ShowFailedVersion(status) {
		var helperText = '';
		// Display the error
		helperText += '<h4>Please Download a new plugIn and restart the browser</h4>';
		helperText += '<p>' + status.description + '</p>';

		$("#helperText").html(helperText);
	}

	function loadVidyoClientLibrary(webrtc, plugin) {
		//We need to ensure we're loading the VidyoClient library and listening for the callback.
		var script = document.createElement('script');
		script.type = 'text/javascript';
		script.src = 'https://static.vidyo.io/4.1.9.5/javascript/VidyoClient/VidyoClient.js?onload=onVidyoClientLoaded&webrtc='
				+ webrtc + '&plugin=' + plugin;
		document.getElementsByTagName('head')[0].appendChild(script);
	}
	function joinViaBrowser() {
		$("#helperText").html("Loading...");
		$("#helperPicker").addClass("hidden");
		loadVidyoClientLibrary(true, false);
	}

	function loadHelperOptions() {
		var userAgent = navigator.userAgent || navigator.vendor || window.opera;

		// Opera 8.0+
		var isOpera = (userAgent.indexOf("Opera") || userAgent.indexOf('OPR')) != -1;
		// Firefox
		var isFirefox = userAgent.indexOf("Firefox") != -1;
		// Chrome 1+
		var isChrome = userAgent.indexOf("Chrome") != -1;
		// Safari
		var isSafari = !isChrome && userAgent.indexOf("Safari") != -1;
		// AppleWebKit
		var isAppleWebKit = !isSafari && !isChrome
				&& userAgent.indexOf("AppleWebKit") != -1;
		// Internet Explorer 6-11
		var isIE = (userAgent.indexOf("MSIE") != -1)
				|| (!!document.documentMode == true);
		// Edge 20+
		var isEdge = !isIE && !!window.StyleMedia;
		// Check if Mac
		var isMac = navigator.platform.indexOf('Mac') > -1;
		// Check if Windows
		var isWin = navigator.platform.indexOf('Win') > -1;
		// Check if Linux
		var isLinux = navigator.platform.indexOf('Linux') > -1;
		// Check if Android
		var isAndroid = userAgent.indexOf("android") > -1;

		if (!isMac && !isWin && !isLinux) {
			/* Mobile App*/
			if (isAndroid) {
				$("#joinViaApp").removeClass("hidden");
			} else {
				$("#joinViaOtherApp").removeClass("hidden");
			}
			if (isChrome) {
				/* Supports WebRTC */
				$("#joinViaBrowser").removeClass("hidden");
			}
		} else {
			/* Desktop App */
			$("#joinViaApp").removeClass("hidden");

			if (isChrome || isFirefox) {
				/* Supports WebRTC */
				$("#joinViaBrowser").removeClass("hidden");
			}
			if (isSafari || isFirefox || (isAppleWebKit && isMac)
					|| (isIE && !isEdge)) {
				/* Supports Plugins */
				$("#joinViaPlugIn").removeClass("hidden");
			}
		}
	}
	// Runs when the page loads

	// Get voice
	var final_transcript = '';
	var recognizing = false;
	var ignore_onend;
	var start_timestamp;
	var recognition;
	

	if (!('webkitSpeechRecognition' in window)) {
		//upgrade();
	} else {
		recognition = new webkitSpeechRecognition();
		recognition.continuous = true;
		recognition.interimResults = true;
		recognition.onstart = function() {
			recognizing = true;
			$("#messages").html("speaking now");
		};
		recognition.onerror = function(event) {
			if (event.error == 'no-speech') {
				$("#messages").html("no-speech");
			}
			if (event.error == 'audio-capture') {
				$("#messages").html("no microphone");
			}
		};
		recognition.onend = function() {
			recognizing = false;
			if (ignore_onend) {
				return;
			}
			if (!final_transcript) {
				return;
			}
		};
		recognition.onresult = function(event) {
			var interim_transcript = '';
			for (var i = event.resultIndex; i < event.results.length; ++i) {
				if (event.results[i].isFinal) {
					final_transcript = event.results[i][0].transcript;
				} else {
					final_transcript = event.results[i][0].transcript;
				}
			}
			final_transcript = capitalize(final_transcript);
			vidyoConnector.SendChatMessage(final_transcript);
		};
	}
	var two_line = /\n\n/g;
	var one_line = /\n/g;
	function linebreak(s) {
		return s.replace(two_line, '<p></p>').replace(one_line, '<br>');
	}
	var first_char = /\S/;
	function capitalize(s) {
		return s.replace(first_char, function(m) {
			return m.toUpperCase();
		});
	}

	function startButton(event) {
		var userLanguage = $("#language").val();
		if (recognizing) {
			recognition.stop();
			return;
		}
		final_transcript = '';
		if (userLanguage == 'ko') {
			recognition.lang = 'ko-KR';
		} else if (userLanguage == 'ja') {
			recognition.lang = 'ja-JP';
		}
		;
		recognition.start();
		ignore_onend = false;
	}
	var current_style;
	function showButtons(style) {
		if (style == current_style) {
			return;
		}
		current_style = style;
	}

	// 자바스크립트 Ready
	$(function() {
		joinViaBrowser();
		startButton(event);

		$("#chatMessege").on('click', function() {
			var mesg = $("#msg").val();
			vidyoConnector.SendChatMessage(mesg);
		});
	});
</script>

</head>

<!-- We execute the VidyoConnectorApp library on page load
to hook up all of the events to elements. -->
<body id="vidyoConnector">
	<div id="options" class="optionsHide">
		<img class="logo" src="resources/assets/images/miyou.png" />

		<form>
			<div id="optionsParameters">
				<p>
					<!-- The host of our backend service. -->
					<!-- <label>Host</label> --> 
					<input type="hidden" id="host"	value="prod.vidyo.io">
				</p>
				<p>
					<!-- A token that is derived from the deveoper key assigned to your account which will allow access for this particular instance.
			The token will contain user ID, expiration date and an optional vCard of the user.
			For test purposes, you can skip this and just insert anything you like, but your video sessions will be limited by duration.
			For more information visit the developer section of http://vidyo.io -->
					<!-- <label>Token</label>
			<input type="text" id="token" placeholder="ACCESS-TOKEN" value="">  -->
					<input type="hidden" id="token" placeholder="ACCESS-TOKEN" value="${token}">
				</p>
				<p>
					<!-- This is the display name that other users will see. -->
					<label for="displayName">User Name</label>
							<c:choose>
							<c:when test="${user.dept_id == 100}">
								<input id="displayName" type="text" placeholder="Display Name" value="${user.name} &#40;관리팀&#41;"> 
						    </c:when>
						    <c:when test="${user.dept_id == 200}">
								<input id="displayName" type="text" placeholder="Display Name" value="${user.name} &#40;인사팀&#41;"> 
						    </c:when>
						    <c:when test="${user.dept_id == 301}">
								<input id="displayName" type="text" placeholder="Display Name" value="${user.name} &#40;영업1팀&#41;"> 
						    </c:when>
						    <c:when test="${user.dept_id == 302}">
								<input id="displayName" type="text" placeholder="Display Name" value="${user.name} &#40;영업2팀&#41;"> 
						    </c:when>
						    <c:when test="${user.dept_id == 303}">
								<input id="displayName" type="text" placeholder="Display Name" value="${user.name} &#40;영업3팀&#41;"> 
						    </c:when>
						    <c:when test="${user.dept_id == 401}">
								<input id="displayName" type="text" placeholder="Display Name" value="${user.name} &#40;개발1팀&#41;"> 
						    </c:when>
						    <c:when test="${user.dept_id == 402}">
								<input id="displayName" type="text" placeholder="Display Name" value="${user.name} &#40;개발2팀&#41;"> 
						    </c:when>
						    <c:when test="${user.dept_id == 403}">
								<input id="displayName" type="text" placeholder="Display Name" value="${user.name} &#40;개발3팀&#41;"> 
						    </c:when>
							</c:choose> 
				</p>
				<p>
					<!-- This is the "room" or "space" to which you're connecting
			the user. Other users who join this same Resource will be able to see and hear each other.
			-->
					<label for="resourceId">Conference ID</label> <input id="resourceId"
						type="text" placeholder="Conference Reference" value="${roomNum }">
				</p>
			</div>
			<p>
				<!-- On page load, this input is filled with a list of all the available cameras on the user's system. -->
				<label for="cameras">Cameras</label> <select id="cameras">
					<option value='0'>None</option>
				</select>
			</p>
			<p>
				<!-- On page load, this input is filled with a list of all the available microphones on the user's system. -->
				<label for="microphones">Microphones</label> <select
					id="microphones">
					<option value='0'>None</option>
				</select>
			</p>
			<p>
				<!-- On page load, this input is filled with a list of all the available microphones on the user's system. -->
				<label for="speakers">Speakers</label> <select id="speakers">
					<option value='0'>None</option>
				</select>
			</p>
		</form>
		<div id="messages">
			<!-- All Vidyo-related messages will be inserted into these spans. -->
			<span id="error"></span> <span id="message"></span>
		</div>
	</div>
	<!-- This is the div into which the Vidyo component will be inserted. -->
	<div id="renderer" class="rendererWithOptions pluginOverlay"></div>
	<div id="toolbar">
		<span id="participantStatus"></span>

		<!-- This button toggles the camera privacy on or off. -->
		<button id="cameraButton" title="Camera Privacy"
			class="toolbarButton cameraOn"></button>

		<!-- This button joins and leaves the conference. -->
		<button id="joinLeaveButton" title="Join Conference"
			class="toolbarButton callStart"></button>

		<!-- This button mutes and unmutes the users' microphone. -->
		<button id="microphoneButton" title="Microphone Privacy"
			class="toolbarButton microphoneOn"></button>

		<input type="button" id="chatMessege" value="sending"> 
		<input type="text" id="msg" name="msg">
		<!-- <input type="button" id="translate" value="translate" onclick="startButton(event)"> -->
		<input type="hidden" id="language" value="${user.language}"> <span
			id="connectionStatus">Initializing</span> <span id="clientVersion"></span>
	</div>
	<div id="failed" class="hidden">
		<table>
			<tr>
				<td><img class="logo" src="resources/assets/images/error.png" /></td>
			</tr>
			<tr>
				<td id="failedText">Error</td>
			</tr>
		</table>
	</div>
</body>
</html>