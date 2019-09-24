<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<%@include file="/WEB-INF/views/frame/contents/header.jsp"%>
<!-- title -->
<title>SamplePage</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="http://localhost:82/socket.io/socket.io.js"></script>
<style>
#content {
	width: 700px;
	margin: 0 auto;
}

#chatArea {
	display: none;
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

#memberList {
	width: 300px;
	height: 500px;
	margin: 0 auto;
}

#memberListTable {
	width: 100%;
	border-collapse: collapse;
}

#memberListTable tr td {
	border: 1px solid black;
	width: 100%;
	padding: 5px;
}

#msg {
	width: 595px;
	margin: 0;
	padding: 0;
}

#msg_process {
	width: 87px;
	margin: 0;
	padding: 0;
}

#msgbox {
	padding: 3px;
}

.sendbox {
	text-align: right;
}

.receivebox {
	font-weight: bold;
}

.alarmbox {
	color: gray;
	font-weight: bold;
	text-align: center;
}
</style>
</head>

<body>
	<%@include file="/WEB-INF/views/frame/loading.jsp"%>
	<!-- page container -->
	<div class="page-container">
		<%@include file="/WEB-INF/views/frame/contents/contentsHeader.jsp"%>
		<%@include file="/WEB-INF/views/frame/contents/nav.jsp"%>
		<!-- demo content -->
		<div class="demo-content mrg-top-md">
			<!-- container -->
			<div class="container" style="margin-top: -50px;">
				<div id="chatArea">
					<div id="chatInfo"></div>
					<div id="chat_box"></div>
					<input type="text" id="msg">
					<button id="msg_process">전송</button>
				</div>
			</div>
			<div id="memberList">
				<table id="memberListTable">
				</table>
			</div>
			<!-- end home variation -->
			<!-- end component -->
		</div>
		<!-- end container -->
	</div>
	<!-- end demo content -->
	<!-- footer -->
	<%@include file="/WEB-INF/views/frame/contents/footer.jsp"%>


	<script>
		var user = '${loginInfo.m_id}';

		$(document).ready(
				function() {
					$.ajax({
						url : 'http://localhost:8080/toti/chat/memberlist/'
								+ user,
						type : 'GET',
						success : function(data) {
							var html = '';
							for (var i = 0; i < data.length; i++) {

								html += '<tr>';
								html += '<td onclick="chat(' + '\''
										+ data[i].m_id + '\'' + ');">'
										+ data[i].m_id + '</td>';
								html += '</tr>';
							}
							$('#memberListTable').html(html);
						}
					})
				});

		function chat(m_id) {

			alert(m_id);
			$('#chatArea').css('display', 'block');
			$('#memberList').css('display', 'none');

			$.ajax({
				url : 'http://localhost:8080/toti/chat/room/' + user + '/'
						+ m_id,
				type : 'GET',
				success : function(data) {

					var html = '';
					html += '<input type="hidden" id="chat_room" value="'+ data +'">'
					$('#chatInfo').html(html);
				}
			});

			var socket = io.connect('http://localhost:82/');

			var room_num = $('input#chat_room').val();

			// alert($('#chat_room').val());
			// alert(room_num);

			setTimeout(function() {
				socket.emit("join", {
					room : $('#chat_room').val(),
					user : user,
					target : m_id
				});
			}, 500);
			
			
			socket.on("receiv_msg", function(data) {
				$('<div id = "msgbox" class = "receivebox"></div>').text(
						data.name + " : " + data.message).appendTo("#chat_box");
				scrollDown();
			});
			
			socket.on("send_msg", function(data) {
				$('<div id = "msgbox" class = "sendbox"></div>').text(
						 "나 : " + data.message).appendTo("#chat_box");
				scrollDown();
			});

			socket.on("contact", function(data) {
				$('<div id = "msgbox" class = "alarmbox"></div>').text(
						data.message).appendTo("#chat_box");
				scrollDown();
			});

			$("#msg").keydown(function(key) {
				// 해당하는 키가 엔터키(13) 이라면
				if (key.keyCode == 13) {
					// "msg_process"를 클릭한다.
					msg_process.click();
				}
			});

			$("#msg_process").click(function() {

				socket.emit("send_msg", {
					room : $('#chat_room').val(),
					name : user,
					message : $("#msg").val()
				});
				$("#msg").val("");
			});

		};

		function scrollDown() {
			$('#chat_box').scrollTop($('#chat_box').prop('scrollHeight'));
		}
	</script>
</body>

</html>
