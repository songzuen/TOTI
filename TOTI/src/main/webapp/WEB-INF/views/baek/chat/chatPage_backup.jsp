<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<%@include file="/WEB-INF/views/frame/contents/header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- title -->
<title>SamplePage</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script
	src="http://ec2-13-125-96-18.ap-northeast-2.compute.amazonaws.com:3000/socket.io/socket.io.js"></script>
<!-- <script src="http://13.209.47.16:82/socket.io/socket.io.js"></script> -->
<style>
#content {
	width: 100%;
	height: 500px;
}

#chatArea {
	border: 1px solid black;
	width: 72%;
	display: none;
	background-color: #c1c1c1;
	float: left;
	margin-right: 20px;
}

#profileArea {
	border: 1px solid black;
	width: 25%;
	display: none;
	min-height: 500px;
}

#chat_box {
	width: 100%;
	height: 500px;
	min-height: 500px;
	border: 1px solid black;
	position: relative;
	overflow: auto;
}

#list {
	width: 700px;
	height: 500px;
	margin: 0 auto;
}

#estListTable {
	width: 100%;
	border-collapse: collapse;
}

#chatRoomListTable {
	width: 100%;
	border-collapse: collapse;
}

#chatRoomList {
	padding-top: 50px;
}

table tr td {
	border: 1px solid black;
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

.profileTitle {
	text-align: center;
	font-size: 24px;
	font-weight: bold;
}

.profileImg {
	width: 100px;
	height: 100px;
	border: 1px solid black;
	border-radius: 50%;
	margin: 10px auto;
}

.profileName {
	text-align: center;
}

.profileSubTitle {
	margin: 10px 0 2px 2px;
	font-size: 11px;
	color: gray;
	margin-left: 2px;
	font-size: 11px;
}

.profileSubContent {
	margin: 0 2px;
}

hr {
	margin: 0;
	padding: 0;
}

.review {
	margin: 10px 2px;
}

.reviewName {
	font-size: 14px;
}

.reviewStar {
	font-weight: bold;
}

.reviewDate {
	color: gray;
	margin-left: 2px;
	font-size: 11px;
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
				<div id=backBtn>
					<a href="http://13.209.47.16:8080/toti/chat/chatLogin" onclick="">뒤로가기</a>
				</div>
				<div id="chatArea">
					<div id="chatInfo"></div>
					<div id="targetName"></div>
					<div id="userName"></div>
					<div id="chat_box"></div>
					<input type="text" id="input_msg">
					<button id="msg_process">전송</button>
				</div>
				<div id="profileArea">

					<div id="profile"></div>

				</div>
			</div>
			<div id="list">
				<div id="estList">
					<table id="estListTable">
						<tr>
							<td>est_idx</td>
							<td>cate_idx</td>
							<td>mentor_idx</td>
							<td>m_idx</td>
							<td>est_price</td>
							<td>est_const</td>
						</tr>
					</table>
				</div>
				<div id="chatRoomList">
					<table id="chatRoomListTable">
						<tr>
							<td>분야</td>
							<td>상대방</td>
							<td>마지막 메시지</td>
						</tr>
					</table>
				</div>
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
		var user = '${loginInfo.m_idx}';

		// 요일 구할 때 사용할 배열
		var week = new Array('일', '월', '화', '수', '목', '금', '토');

		$(document).ready(function() {

			estlist();

		});

		function estlist() {

			$('#chatArea').css('display', 'none');
			$('#backBtn').css('display', 'none');
			$('#profileArea').css('display', 'none');
			$('#estList').css('display', 'block');

			$('#chat_box').empty();

			$.ajax({
				url : 'http://13.209.47.16:8080/toti/chat/estlist/' + user,
				type : 'GET',
				success : function(data) {
					var html = '';
					for (var i = 0; i < data.length; i++) {

						html += '<tr>';
						html += '<td onclick="chat(' + '\'' + data[i].est_idx
								+ '\'' + ', ' + '\'' + data[i].cate_idx + '\''
								+ ', ' + '\'' + data[i].m_idx + '\'' + ');">'
								+ data[i].est_idx + '</td>';
						html += '<td>' + data[i].cate_idx + '</td>';
						html += '<td>' + data[i].mento_idx + '</td>';
						html += '<td>' + data[i].m_idx + '</td>';
						html += '<td>' + data[i].est_price + '</td>';
						html += '<td>' + data[i].est_cont + '</td>';
						html += '</tr>';
					}
					$('#estListTable').append(html);
				}
			});

			$('#chatRoomList').css('display', 'block');

			$.ajax({
				url : 'http://13.209.47.16:8080/toti/chat/roomlist/' + user,
				type : 'GET',
				success : function(data) {
					var html = '';
					for (var i = 0; i < data.length; i++) {

						var name = data[i].targetname;

						if (user == data[i].room_target) {
							var tmp = data[i].room_target;
							data[i].room_target = data[i].room_user;
							data[i].room_user = tmp;

							name = data[i].username;
						}

						html += '<tr>';
						html += '<td>' + data[i].cate_name + '</td>';
						html += '<td onclick="chat(' + '\'' + data[i].room_num
								+ '\'' + ', ' + '\'' + data[i].room_cat + '\''
								+ ', ' + '\'' + data[i].room_target + '\''
								+ ');">' + name + '</td>';
						html += '<td>' + data[i].last_msg + '</td>';
						html += '</tr>';
					}
					$('#chatRoomListTable').append(html);
				}
			});

		}

		function chat(est_idx, cate_idx, m_idx) {

			$('#backBtn').css('display', 'block');
			$('#chatArea').css('display', 'inline-block');
			$('#profileArea').css('display', 'inline-block');
			$('#estList').css('display', 'none');
			$('#chatRoomList').css('display', 'none');
			$
					.ajax({
						url : 'http://13.209.47.16:8080/toti/chat/room/' + est_idx
								+ '/' + cate_idx + '/' + user + '/' + m_idx,
						type : 'GET',
						success : function(data) {

							var html = '';
							html += '<input type="hidden" id="chat_room" value="' + data + '">'
							$('#chatInfo').html(html);
							mentorCheck(user);
							chatTarget(user);
							chatUser(user);
						}
					});

			var socket = io
					.connect('http://ec2-13-125-96-18.ap-northeast-2.compute.amazonaws.com:3000/');

			var room_num = $('input#chat_room').val();

			// alert($('#chat_room').val());
			// alert(room_num);

			setTimeout(function() {
				socket.emit("join", {
					room : $('#chat_room').val(),
					user : user,
					target : m_idx
				});
			}, 500);

			socket.on("loadChatLog", function(data) {

				var html = '';

				for (var i = 0; i < data.length; i++) {
					/* 					console.log(data[i]); */

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
						html += data[i].user_name + ' : ' + data[i].message;
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
				receiveMsg += data.username + ' : ' + data.message;
				receiveMsg += '</div><span class = "time">' + data.time
						+ '</span></div>';

				$('#chat_box').append(receiveMsg);
				scrollDown();
			});

			socket.on("send_msg", function(data) {
				var sendMsg = '';
				sendMsg += '<div id = "msgbox" class="text_right">';
				sendMsg += '<span class = "time">' + data.time + '</span>';
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
							useridx : user,
							username : $('#user').val(),
							message : $("#input_msg").val(),
							time : currentDate + currentTime
						});
						$("#input_msg").val("");
					});

			function mentorCheck(user) {
				$
						.ajax({

							url : 'http://13.209.47.16:8080/toti/chat/mentorcheck/'
									+ user,
							type : 'GET',
							success : function(data) {
								var html = '';
								html += '<input type="input" id="check" value="' + data + '">'
								$('#profile').html(html);
								mentorProfile(user);
							}

						});
			}

			function chatTarget(user) {
				$
						.ajax({
							url : 'http://13.209.47.16:8080/toti/chat/room/'
									+ m_idx + '/' + user,
							type : 'GET',
							success : function(data) {

								var html = '';
								html += '<input type="hidden" id="target" value="' + data + '">'
								$('#targetName').html(html);
							}
						});
			}

			function chatUser(user) {
				$
						.ajax({
							url : 'http://13.209.47.16:8080/toti/chat/room/'
									+ user,
							type : 'GET',
							success : function(data) {
								// alert(data);
								var html = '';
								html += '<input type="hidden" id="user" value="' + data + '">'
								$('#userName').html(html);
							}
						});
			}
			function mentorProfile(user) {
				if ($('#check').val() == 'Y') {
					$
							.ajax({
								url : 'http://13.209.47.16:8080/toti/chat/profile/mentor/'
										+ user,
								type : 'GET',
								success : function(data) {
									var html = '';
									html += '<div class = "profileTitle">멘토 프로필</div>';
									html += '<div class = "profileImg"> '
											+ data.m_photo + '</div>';
									html += '<div class = "profileName">'
											+ data.m_name + ' (' + data.m_id
											+ ')</div>';
									html += '<div class = "profileSubTitle">코멘트</div>';
									html += '<div class = "profileSubContent">'
											+ data.p_shot + '</div>';
									html += '<div class = "profileSubTitle">학력</div>';
									html += '<div class = "profileSubContent">'
											+ data.p_edu + '</div>';
									html += '<div class = "profileSubTitle">경력</div>';
									html += '<div class = "profileSubContent">'
											+ data.p_career + '</div>';
									html += '<div class = "profileSubTitle">결제 방식</div>';
									html += '<div class = "profileSubContent">'
											+ data.p_pay + '</div><hr>';
									html += '<div class = "mentorReview"></div>';
									$('#profile').append(html);
									mentorProfileReview(user)
								}
							});

				}
			}
			;

			function mentorProfileReview(user) {
				$
						.ajax({
							url : 'http://13.209.47.16:8080/toti/chat/profile/mentor/review/'
									+ user,
							type : 'GET',
							success : function(data) {
								for (var i = 0; i < data.length; i++) {
									var html = '<div class = review>'
									html += '<div class = reviewName>'
											+ data[i].m_name + ' / '
											+ data[i].review_star + '</div>';
									html += '<div class = reviewDate>'
											+ data[i].review_date + '</div>';
									html += '<div>' + data[i].review_cont
											+ '</div>';
									html += '</div>';
									$('.mentorReview').append(html);
								}
							}
						});
			}

		};

		function scrollDown() {
			$('#chat_box').scrollTop($('#chat_box').prop('scrollHeight'));
		}
	</script>
</body>

</html>
 --%>