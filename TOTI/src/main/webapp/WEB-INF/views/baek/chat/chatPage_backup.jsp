<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/frame/header.jsp"%>
<link href="<c:url value="/css/minjongCss/chat.css" />" rel="stylesheet">
<title>TOTI</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="http://localhost:3000/socket.io/socket.io.js"></script>
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
		<div id="myModal" class="modal">

			<!-- Modal content -->
			<div class="modal-content">
				<span class="close">&times;</span>
				<div id="estInfo"></div>
			</div>

		</div>
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
								<button id="myBtn">견적서 내용</button>
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
					<!-- 여기까지 -->


				</div>
			</div>
		</div>
	</section>
	<!--/#blog-->

	<%@ include file="/WEB-INF/views/frame/footer.jsp"%>

	<script>
		// 사용자 계정 정보
		var user = (${idx});

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
				url : 'http://localhost:8080/toti/chat/estlist/' + user,
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
				url : 'http://localhost:8080/toti/chat/roomlist/' + user,
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
						url : 'http://localhost:8080/toti/chat/room/' + est_idx,
						type : 'GET',
						success : function(data) {

							var html = '';
							html += '채팅방 번호 <input type="text" id="chat_room" value="' + data + '">'
							$('#chatInfo').html(html);
							mentorCheck(m_idx);
							chatTarget(user);
							chatUser(user);
						}
					});

			var socket = io.connect('http://localhost:3000/');

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

			socket.on("loadEst", function(data) {

				var html = '';

				for (var i = 0; i < data.length; i++) {
					html += '<div id = "msg" class = "alarmbox">';
					html += '금액 : ' + data[i].price + '<br>' + data[i].cont;
					html += '</div>';
				}
				var bannerOffset = $('.topFixBanner').offset();

				$('#estInfo').html(html);
			});

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
								html += '상대방 <input type="text" id="target" value="' + data + '">'
								$('#targetName').html(html);
							}
						});
			}

			function chatUser(user) {
				$
						.ajax({
							url : 'http://localhost:8080/toti/chat/room/name/'
									+ user,
							type : 'GET',
							success : function(data) {
								// alert(data);
								var html = '';
								html += '사용자 <input type="text" id="user" value="' + data + '">'
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
				else {
					
					var room_num = $('input#chat_room').val();
					
					$
							.ajax({
								url : 'http://localhost:8080/toti/chat/checkreq/'
										+ room_num,
								type : 'GET',
								success : function(data) {
									var req_idx = data;
									
									
									
									$.ajax({
										url : 'http://localhost:8080/toti/requestData',
										type : 'GET',
										data : {
											request_idx : req_idx,
											m_idx : user
										},
										success : function(data) {
											
											var html = '';
											
											html += '<div class ="text_center"><img src="<c:url value="/uploadfile/'+data.userInfo.m_photo+'" />" class = "profileImg"><div>';
											html += '<div id="requesr_user"><p>'+data.request_date+'</p>';
											html += '<h2>'+data.cate_name+'('+data.service_name+')</h2><h3>'+data.userInfo.m_name+'님</h3></div>';
											html += '<div id="request_con">'
											
											for (var i = 0; i < data.answer.length; i++) {
												html += '<p class="con_p1">'+data.answer[i].quest_name+'</p>';
												html += '<p class="con_p2">'+data.answer[i].answer_cont+'</p>';			
											}
											
											html += '</div>';

											$('#profile').append(html);
											
										}

									});
								}
							});

				}
				
				
				
				
				
				
				
			};

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

		$("#chat_box").scroll(function() { //window에 스크롤링이 발생하면
			if ($(document).scrollTop() > bannerOffset.top) { // 위치 및 사이즈를 파악하여 미리 정한 css class를 add 또는 remove 합니다.
				$('.topFixBanner').addClass('topFixBannerFixed');
			} else {
				$('.topFixBanner').removeClass('topFixBannerFixed');
			}

		});

		// Get the modal
		var modal = document.getElementById('myModal');

		// Get the button that opens the modal
		var btn = document.getElementById("myBtn");

		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];

		// When the user clicks on the button, open the modal 
		btn.onclick = function() {
			modal.style.display = "block";
		}

		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
			modal.style.display = "none";
		}

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
		
	</script>
</body>

</html>
