<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/frame/header.jsp"%>
<link href="<c:url value="/css/minjongCss/chat.css" />" rel="stylesheet">
<title>TOTI</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="http://localhost:82/socket.io/socket.io.js"></script>
</head>
<!--/head-->
<body>
	<%@ include file="/WEB-INF/views/frame/nav.jsp"%>
	<!--/#header-->
	<section id="page-breadcrumb">
		<div class="vertical-center sun">
			<div class="container">
				<div class="row">
					<div class="action">
						<div class="col-sm-12">
							<h1 class="title">채 팅</h1>
							<p>-</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--/#action-->

	<section id="blog" class="padding-top padding-bottom">
		<div class="container">
			<div class="row">
				<div class="col-md">
					<!-- 제공하는 컨텐츠 이렇게 넣으세여 예시↓ -->
					<div class="demo-content">
						<!-- container -->
						<div class="container" style="margin: 50px auto;">
							<div id=backBtn>
								<a href="http://localhost:8080/toti/chat/chatLogin" onclick="">뒤로가기</a>
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
						

						<!-- end home variation -->
						<!-- end component -->
					</div>
					<!-- 여기까지 -->


				</div>
			</div>
		</div>
	</section>
	<!--/#blog-->
<%-- 
	<%@ include file="/WEB-INF/views/frame/footer.jsp"%> --%>

	<script>
		// 사용자 계정 정보
		/* var user = '${loginInfo.m_idx}'; */

		// 요일 구할 때 사용할 배열
		var week = new Array('일', '월', '화', '수', '목', '금', '토');
		var count = 0;

		$(document).ready(function() {
			/* alert(${est_idx} +', '+ ${cate_idx} +', '+ ${user} +', '+ ${m_idx}); */
			
			var est_idx = ${est_idx};
			var cate_idx = ${cate_idx};
			var user = ${user};
			var m_idx = ${m_idx};
			
			chat(est_idx, cate_idx, user, m_idx);
			
		});

		function chat(est_idx, cate_idx, user, m_idx) {
			alert(est_idx +', '+ cate_idx +', '+ user +', '+ m_idx);
			$('#backBtn').css('display', 'block');
			$('#chatArea').css('display', 'inline-block');
			$('#profileArea').css('display', 'inline-block');
			$('#estList').css('display', 'none');
			$('#chatRoomList').css('display', 'none');
			$
					.ajax({
						url : 'http://localhost:8080/toti/chat/room/' + est_idx
								+ '/' + cate_idx + '/' + user + '/' + m_idx,
						type : 'GET',
						success : function(data) {

							var html = '';
							html += '<input type="text" id="chat_room" value="' + data + '">'
							$('#chatInfo').html(html);
							mentorCheck(user);
							chatTarget(user);
							chatUser(user);
						}
					});

			var socket = io
					.connect('http://localhost:82/');

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

			
			loadChatLog();
			
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

			/* socket.on("contact", function(data) {
				/* 				$('<div id = "msg" class = "alarmbox"></div><br>').text(
				 data.message).appendTo("#chat_box");
				 scrollDown();
				
				 
				var alarmMsg = '';
				alarmMsg += '<div id = "msgbox" class="text_center">';
				alarmMsg += '<div id = "msg" class = "alarmbox">';
				alarmMsg += data.message;
				alarmMsg += '</div></div>';

				$('#chat_box').append(alarmMsg);
				scrollDown();
			}); */

			$("#input_msg").keydown(function(key) {
				// 해당하는 키가 엔터키(13) 이라면
				if (key.keyCode == 13) {
					// "msg_process"를 클릭한다.
					msg_process.click();
				}
			});

			$("#msg_process").click(function() {

				// 현재 시간
				var d = new Date();
				var currentDate = d.getFullYear() + "년 " + (d.getMonth() + 1)
				+ "월 " + d.getDate() + "일 " + week[d.getDay()] + "요일 ";
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
			
			function loadChatLog(){
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
				
			}

			function mentorCheck(user) {
				$
						.ajax({

							url : 'http://localhost:8080/toti/chat/mentorcheck/'
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
							url : 'http://localhost:8080/toti/chat/room/'
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
							url : 'http://localhost:8080/toti/chat/room/'
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
								url : 'http://localhost:8080/toti/chat/profile/mentor/'
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
							url : 'http://localhost:8080/toti/chat/profile/mentor/review/'
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
