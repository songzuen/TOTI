<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/frame/header.jsp"%>
<link href="<c:url value="/css/minjongCss/chat.css" />" rel="stylesheet">
<title>TOTI</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://chat.yal-toti.tk/socket.io/socket.io.js"></script>

<style>
</style>
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
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--/#action-->

	<section id="blog" class="padding-top padding-bottom">
		<div id="estModal" class="modal">

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
						<div id="chat" class="container" style="margin: 30px auto;">
							<div id="buttons">
								<a href="#" onclick="goBackPage()">뒤로가기</a> <a
									onclick="modalDisplay()">견적서 내용</a> <a onclick="goRtcPage()">화상채팅</a>
							</div>
							<div id="chatArea">
								<div id="chatInfo"></div>
								<div id="targetName"></div>
								<div id="userName"></div>
								<!-- <button id="rtcBtn" onclick="goRtcPage()">화상 채팅</button> -->
								<div id="chat_box"></div>
								<div id="chat_input">
									<textarea id="input_msg"></textarea>
									<button id="msg_process">
										<span>전송</span>
									</button>
								</div>
							</div>
							<div id="profileArea">

								<div id="profile"></div>

							</div>
						</div>

						<div id="rtcPage" class="container"></div>
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
	
		// 사용자 idx
		var user = (${idx});
		
		// 견적서 (채팅 방) idx
		var est_idx = (${est_idx});
		
		// 상대방 idx
		var m_idx = (${m_idx});

		// 요일 구할 때 사용할 배열
		var week = new Array('일', '월', '화', '수', '목', '금', '토');

		$(document).ready(function() {

			/* alert("사용자 : " +user + "\n상대방 : " + m_idx + "\n채팅방 : " + est_idx); */
			
			chat(est_idx, m_idx);

		});


		function chat(est_idx, m_idx) {

			$('#buttons').css('display', 'block');
			$('#chatArea').css('display', 'inline-block');
			$('#profileArea').css('display', 'inline-block');
			$('#list').css('display', 'none');
			$('#chatRoomList').css('display', 'none');
			$
					.ajax({
						url : '/toti/chat/room/' + est_idx,
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

			var socket = io.connect('https://chat.yal-toti.tk/');

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
					
					// 천의 자리 마다 , 찍기
					var regexp = /\B(?=(\d{3})+(?!\d))/g;
					var price = data[i].price.toString().replace(regexp, ',');
					
					html += '<div id = "alarmMsg" class = "alarmbox">';
					html += '* 금액, 결제방식, 수업내용 등 견적서 내용을 자세하게 확인해주세요.<br>' +'<br>' + '금액 : ' + price + '<br><br>' +  data[i].cont;
					html += '</div>';
				}
				var bannerOffset = $('.topFixBanner').offset();

				$('#estInfo').html(html);
			});

			socket.on("loadChatLog", function(data) {

				var html = '';

				for (var i = 0; i < data.length; i++) {
					
					if(data[i].msg_user == 0) {
						html += '<div id = "msgbox" class="text_center">';
						html += '<div id = "noticemsg" class = "noticebox">';
						html += data[i].message;
						html += '</div></div>';
					}else if (user == data[i].msg_user) {
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
				if (key.keyCode == 13 && key.shiftKey == true) {
					
				} else if (key.keyCode == 13) {
					msg_process.click();// "msg_process"를 클릭한다.
					return false;
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
						
						// 줄 바꿈 적용
						var str = document.getElementById("input_msg").value;
						str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
						document.getElementById("input_msg").value = str;

						socket.emit("send_msg", {
							room : $('#chat_room').val(),
							useridx : user,
							username : $('#user').val(),
							message : str,
							time : currentDate + currentTime
						});
						$("#input_msg").val('');
					});

			function mentorCheck(user) {
				
				var room_num = $('input#chat_room').val();
				
				$
						.ajax({

							url : '/toti/chat/mentorcheck/'+ user + '/' + room_num,
							type : 'GET',
							success : function(data) {
								var html = '';
								html += '<input type="hidden" id="check" value="' + data + '">'
								$('#profile').html(html);
								mentorProfile(user);
							}

						});
			}

			function chatTarget(user) {
				
				
				$
						.ajax({
							url : '/toti/chat/room/'
									+ m_idx + '/' + user + '/' + est_idx,
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
							url : '/toti/chat/room/name/'
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
				if ($('#check').val() == 'N') {
					$
							.ajax({
								url : '/toti/chat/profile/mentor/'
										+ m_idx,
								type : 'GET',
								success : function(data) {
									var html = '';
									html += '<div class = "profileTitle">멘토 프로필</div>';
									html += '<div class = "profileImg"><img src="<c:url value="/images/user/' + data.m_photo + '"/>"class = "profileImg"></div>';
									html += '<div class = "profileName">'
											+ data.m_name + ' (' + data.m_id
											+ ')</div><div>';
									html += '<p class = "con_p1">코멘트</p>';
									html += '<p class = "con_p2">'
											+ data.p_shot + '</p>';
									html += '<p class = "con_p1">학력</p>';
									html += '<p class = "con_p2">'
											+ data.p_edu + '</p>';
									html += '<p class = "con_p1">경력</p>';
									html += '<p class = "con_p2">'
											+ data.p_career + '</p></div>';
									html += '<p class = "con_p1">결제 방식</p>';
									html += '<p class = "con_p2">'
											+ data.p_pay + '</p><hr>';
									html += '<div class = "mentorReview"></div>';
									$('#profile').append(html);
									mentorProfileReview(m_idx);
								}
							});

				}
				else {
					
					var room_num = $('input#chat_room').val();
					
					$
							.ajax({
								url : '/toti/chat/checkreq/'
										+ room_num,
								type : 'GET',
								success : function(data) {
									var req_idx = data;
									
									
									$.ajax({
										url : '/toti/request/requestData',
										type : 'GET',
										data : {
											request_idx : req_idx,
											m_idx : m_idx
										},
										success : function(data) {
											
											var html = '';
											
											html += '<div class = "profileTitle">요청서 내용</div><div class ="text_center"><img src="<c:url value="/images/user/'+data.userInfo.m_photo+'" />" class = "profileImg"><div>';
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
				
				var fullStar = '<span><img id=\"star\" src=\"https://d1hhkexwnh74v.cloudfront.net/icons/icon-common-review-star-small-full.svg\"></span>';
				var halfStar = '<span><img id=\"star\" src=\"https://d1hhkexwnh74v.cloudfront.net/icons/icon-common-review-star-small-half.svg\"></span>';
				
				$
						.ajax({
							url : '/toti/chat/profile/mentor/review/'
									+ user,
							type : 'GET',
							success : function(data) {
								for (var i = 0; i < data.length; i++) {
									
									var star = data[i].review_star;
									var halfCheck = 'N'
									
									if (star % 1 == 0.5) {
										halfCheck = 'Y'
									}
									
									var html = '<div class = review>'
									html += '<div class = reviewName>'
											+ data[i].m_name + '</div><div class="reviewStar"></div>';
									html += '<div class = reviewDate>'
											+ data[i].review_date + '</div>';
									html += '<div>' + data[i].review_cont
											+ '</div>';
									html += '</div>';
									$('.mentorReview').append(html);
									
									for(var i = 0; i < star; i++) {
										$('.reviewStar').append(fullStar);
									}
									if (star % 1 == 0.5) {
										$('.reviewStar').append(halfStar);
									}
								}
							}
						});
			}
			
		};

		function scrollDown() {
			$('#chat_box').scrollTop($('#chat_box').prop('scrollHeight'));
		}
		
		function goRtcPage() {
			var roomnum = est_idx;
			var target = $('#target').val();
			var user = $('#user').val();
			var html = '';

			html += '<div class="buttons">';
			html += '<a href=# onclick="goChatPage()">화상 종료</a></div>';
			
/* 			html += '<iframe src="/toti/chat/rtc?roomnum= '+ room_num +'"></iframe>'; */
			html += '<iframe src="/toti/chat/rtc/' + roomnum + '/' + target + '/' + user +'" onLoad="autoResize(this);"></iframe>';
 
				$('#rtcPage').html(html);
				
				$('#chat').css('display', 'none');
		}
		
		function goBackPage() {
			history.back();
		}
		
		function goChatPage() {
			$('#rtcPage').empty();
			$('#chat').css('display', 'block');
		}
		
		// modal
		var modal = document.getElementById('estModal');
		var estBtn = document.getElementsByClassName('estBtn');
		var span = document.getElementsByClassName("close")[0];

		function modalDisplay() {
			modal.style.display = "block";
		}

		span.onclick = function() {
			modal.style.display = "none";
		}

		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}

		
		// iframe 사이즈 조절
		function autoResize(obj){
			var newheight;
			var newwidth;
				if(obj.contentDocument){
					newheight = obj.contentDocument.documentElement.scrollHeight+30;
					newwidth = obj.contentDocument.documentElement.scrollWidth+30;
				} else {
					newheight=obj.contentWindow.document.body.scrollHeight+30;
					newwidth=obj.contentWindow.document.body.scrollWidth+30;
				}
			obj.height= newheight + "px";
			obj.width= newwidth + "px";
		}
		
	</script>
</body>

</html>
