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
	width: 100%;
	height: 500px;
}

#chatArea {
	border: 1px solid black;
	width: 77%;
	display: none;
	background-color: #c1c1c1;
	float: left;
	margin-right: 20px;
}

#profileArea {
	border: 1px solid black;
	width: 20%;
	display: none;
}

#chat_box {
	width: 100%;
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

#input_msg {
	width: 80%;
	margin: 0;
	padding: 0;
}

#msg_process {
	width: 15%;
	margin: 0;
	padding: 0;
}

#msgbox {
	width: 100%;
	padding: 2px 10px;
}

#msg {
	display: inline-block;
	padding: 10px;
	border-radius: 5%;
	background-color: white;
}

.time {
	font-size: 11px;
	color: gray;
	padding: 0 5px;
}

.receivebox {
	font-weight: bold;
}

.alarmbox {
	color: gray;
	font-weight: bold;
}

.text_right {
	text-align: right;
}

.text_center {
	text-align: center;
}

.area {
	margin: 0 auto;
	background-color: blue;
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
		<div class="demo-content">
			<!-- container -->
			<div class="container" style="margin: 50px auto;">

				<div id="chatArea">
					<div id="chatInfo"></div>
					<div id="chat_box"></div>
					<input type="text" id="input_msg">
					<button id="msg_process">전송</button>
				</div>
				<div id="profileArea">

					<div>프로필</div>

					<br> <br>

					<div>
						기본정보

						<ul>
							<li>본인 인증 여부</li>
							<li>고용된 횟수</li>
							<li>지역</li>
						</ul>

					</div>

					<br> <br>

					<div>추가 정보</div>

					<br> <br>

					<div>제공 서비스</div>

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

		<!-- end demo content -->
		<!-- footer -->
		<%@include file="/WEB-INF/views/frame/contents/footer.jsp"%>
	</div>
	<script>
		// 사용자 계정 정보
		var user = '${loginInfo.m_id}';

		// 요일 구할 때 사용할 배열
		var week = new Array('일', '월', '화', '수', '목', '금', '토');

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
			$('#chatArea').css('display', 'inline-block');
			$('#profileArea').css('display', 'inline-block');
			$('#memberList').css('display', 'none');

			$
					.ajax({
						url : 'http://localhost:8080/toti/chat/room/' + user
								+ '/' + m_id,
						type : 'GET',
						success : function(data) {

							var html = '';
							html += '<input type="hidden" id="chat_room" value="' + data + '">'
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

			socket.on("loadChatLog", function(data) {

				var html = '';

				for (var i = 0; i < data.length; i++) {
					console.log(data[i]);

					if (user == data[i].room_user) {
						html += '<div id = "msgbox" class="text_right">';
						html += '<span class = "time">' + data[i].message_date
								+ '</span>';
						html += '<div id = "msg" class = "sendbox">';
						html += '나 : ' + data[i].message;
						html += '</div></div>';

					} else {
						html += '<div id = "msgbox">';
						html += '<div id = "msg" class = "receivebox">';
						html += data[i].room_user + ' : ' + data[i].message;
						html += '</div><span class = "time">'
								+ data[i].message_date + '</span></div>';
					}

					$('#chat_box').html(html);
				}
				scrollDown();
			});

			socket.on("receiv_msg", function(data) {
				var receiveMsg = '';
				receiveMsg += '<div id = "msgbox">';
				receiveMsg += '<div id = "msg" class = "receivebox">';
				receiveMsg += data.name + ' : ' + data.message;
				receiveMsg += '</div></div>';

				$('#chat_box').append(receiveMsg);
				scrollDown();
			});

			socket.on("send_msg", function(data) {
				var sendMsg = '';
				sendMsg += '<div id = "msgbox" class="text_right">';
				sendMsg += '<div id = "msg" class = "sendbox">';
				sendMsg += '나 : ' + data.message;
				sendMsg += '</div></div>';

				$('#chat_box').append(sendMsg);
				scrollDown();
			});

			socket.on("contact", function(data) {
				/* 				$('<div id = "msg" class = "alarmbox"></div><br>').text(
				 data.message).appendTo("#chat_box");
				 scrollDown();
				
				 */
				var alarmMsg = '';
				alarmMsg += '<div id = "msgbox" class="text_center">';
				alarmMsg += '<div id = "msg" class = "alarmbox">';
				alarmMsg += data.message;
				alarmMsg += '</div></div>';

				$('#chat_box').append(alarmMsg);
				scrollDown();
			});

			$("#input_msg").keydown(function(key) {
				// 해당하는 키가 엔터키(13) 이라면
				if (key.keyCode == 13) {
					// "msg_process"를 클릭한다.
					msg_process.click();
				}
			});

			$("#msg_process").click(
					function() {

						// 현재 시간
						var d = new Date();
						var currentDate = d.getFullYear() + "년 "
								+ (d.getMonth() + 1) + "월 " + d.getDate()
								+ "일 " + week[d.getDay()] + "요일 ";
						var currentTime = d.getHours() + ":" + d.getMinutes();

						socket.emit("send_msg", {
							room : $('#chat_room').val(),
							name : user,
							message : $("#input_msg").val(),
							time : currentDate + currentTime
						});
						$("#input_msg").val("");
					});

		};

		function scrollDown() {
			$('#chat_box').scrollTop($('#chat_box').prop('scrollHeight'));
		}
	</script>
</body>

</html>
