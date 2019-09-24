<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="http://localhost:82/socket.io/socket.io.js"></script>
<link href="<c:url value="/css/nav.css"/>" rel="stylesheet"
	type="text/css" media="all" />

<style>
#content {
	width: 700px;
	margin: 0 auto;
}

#chat_box {
	width: 695px;
	min-width: 695px;
	height: 500px;
	min-height: 500px;
	border: 1px solid black;
	position: relative;
	overflow: auto;
}

#msg {
	width: 600px;
	margin: 0;
	padding: 0;
}

#msg_process {
	width: 87px;
	margin: 0;
	padding: 0;
}

#msgbox {
	
}

.sendbox {
	font-weight: bold;
}

.alarmbox {
	color: gray;
	font-weight: bold;
}
</style>

</head>
<body>
	<div id="content">
		<div id="chat_box"></div>
		<input type="text" id="msg">
		<button id="msg_process">전송</button>
	</div>
	<script>
		$(document).ready(
				function() {
					var socket = io("http://localhost:82");

					// "msg"에서 키를 누를때
					$("#msg").keydown(function(key) {
						// 해당하는 키가 엔터키(13) 이라면
						if (key.keyCode == 13) {
							// "msg_process"를 클릭한다.
							msg_process.click();
						}
					});

					// msg_process를 클릭할 때
					$("#msg_process").click(function() {
						// socket에 sned_msg라는 이벤트로 "msg"의 내용을 담고 전송한다.
						socket.emit("send_msg", $("#msg").val());
						// msg의 내용을 비워준다.
						$("#msg").val("");
					});

					// 알람 메시지
					socket.on('alarm', function(alarm_msg) {
						$('<div id = "msgbox" class = "alarmbox"></div>').text(
								alarm_msg).appendTo("#chat_box");
						scrollDown();

					});

					// 내가 보낸 메시지
					socket.on('send_msg', function(msg) {
						$('<div id = "msgbox" class = "sendbox"></div>').text(
								msg).appendTo("#chat_box");
						scrollDown();
					});

					// 받은 메시지
					socket.on('receive_msg', function(msg) {
						// div 태그를 만들고 msg의 내용을 #chat_box에 추가한다.
						$('<div id = "msgbox"></div>').text(msg).appendTo(
								"#chat_box");

						scrollDown();

					});

				});
		// 스크롤 자동으로 내리도록 처리
		function scrollDown() {
			$('#chat_box').scrollTop($('#chat_box').prop('scrollHeight'));
		}
	</script>

</body>
</html>