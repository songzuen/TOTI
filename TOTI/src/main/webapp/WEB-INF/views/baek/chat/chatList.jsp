<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/frame/header.jsp"%>
<link href="<c:url value="/css/minjongCss/chat.css" />" rel="stylesheet">
<title>TOTI</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

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
						<div id="list">
							<div id="chatRoomList"></div>
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

		$(document).ready(function() {

			chatList();

		});

		function chatList() {

			$('#chatRoomList').css('display', 'block');

			$.ajax({
				url : '/toti/chat/roomlist/' + user,
				type : 'GET',
				success : function(data) {
					var html = '';
					for (var i = 0; i < data.length; i++) {

						var target_name = data[i].room_targetname;
						var target_photo = data[i].room_targetphoto;

						if (user == data[i].room_target) {
							var tmp = data[i].room_target;
							data[i].room_target = data[i].room_user;
							data[i].room_user = tmp;

							target_name = data[i].room_username;
							target_photo =data[i].room_userphoto;
						}
						if (data[i].room_lastmsgTime == null) {
							var lastmsgTime = '';
						} else {
							var lastmsgTime = formatChange(data[i].room_lastmsgTime);
						}
						
						if (data[i].room_lastmsg == null) {
							var lastmsg = '새로운 견적서가 도착했습니다.';
						} else {
							var lastmsg = data[i].room_lastmsg;
						}

/* 						html += '<tr>';
						html += '<td>' + data[i].cate_name + ' / ' + data[i].service_name + '</td>';
						html += '<td>' + target_photo + '</td>'
						html += '<td onclick="goChatPage(' + '\'' + data[i].room_num
								+ '\'' + ', ' + '\'' + data[i].room_target + '\''
								+ ');">' + target_name + '</td>';
						html += '<td>' + data[i].room_lastmsg + '</td>';
						html += '<td>' + lastmsgTime + '</td>';
						html += '</tr>'; */
						
						html += '<div class="est_wrap">';
						html += '<div class="est_user">'+ data[i].cate_name + ' / ' + data[i].service_name +'<p class="list_date">'+lastmsgTime+'</p><div class="est_user_img">';
						html += '<img src="<c:url value="/images/user/'+target_photo+'"/>"></div>';
						html += '<div class="est_user_info" onclick="goChatPage(' + data[i].room_num +', ' + data[i].room_target + ')">';
						html += '<p class="list_name">'+target_name+'</p>';
						html += '<p class="list_msg">'+lastmsg+'</p>';
						html += '</div></div></div></div>';
					}
					$('#chatRoomList').append(html);
				}
			});
		}
		function goChatPage(est_idx, m_idx) {
			location.href ='/toti/chat/chatPage/' + est_idx + '/' + m_idx;
		}
		function formatChange(str) {
/* 			str = str.replace(/\s/g,'');
			str = str.replace("년", "-");
			str = str.replace("월", "-");
			str = str.replace("일", ""); */
			
			str = str.split(" ")
			var tmp = '';
			
			for(var i=0; i<str.length; i++) {
				console.log(str[i]);
 				if(i != 3){
 					tmp += str[i];
				} 
			}
			
			tmp = tmp.replace("년", "-");
			tmp = tmp.replace("월", "-");
			tmp = tmp.replace("일", " ");
			
			
			return tmp;
		}
		
		
		
	</script>
</body>

</html>
