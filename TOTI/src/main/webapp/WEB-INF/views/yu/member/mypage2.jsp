<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>


<%@ include file="/WEB-INF/views/frame/header.jsp"%>
<title>Blog Masonry | Triangle</title>
<style type="text/css">
#mainTable {
	width: 500px;
	left: 30%;
	margin: auto;
	background-color: silver;
}

input {
	margin: 5px;
}

input[type=checkbox] {
	display: none;
}

.formBlock {
	margin: 15px;
}

#formDiv {
	margin-top: 50px;
}

#myInfo {
	color: black;
}

h2 {
	text-align: center;
}

#table {
	color: black;
	margin: 0 auto;
}

img {
	width: 250px;
}

button {
	margin: 5px;
	background-color: silver;
}

input[type=checkbox] {
	display: none;
}

input {
	margin: 5px;
}

#verInfo{
	text-align: center;
	width: 300px;
	background-color: silver;
	color: black;
	padding: 15px 0;
	font-size: 15px;
	margin: auto;
}
 #verInfo2
 {
	text-align: center;
	width: 300px;
	background-color: gold;
	color: white;
	padding: 15px 0;
	font-size: 15px;
	margin: auto;
}
</style>
</head>
<!--/head-->
<body>
	<%@ include file="/WEB-INF/views/frame/nav.jsp"%>
	<!--/#header-->

	<section id="blog" class="padding-top padding-bottom">
		<div class="container">
			<div class="row">
				<div class="col-md">

					<!-- 예시 끝 -->
					<!-- 동준님 이거 쓰세여 회원가입 -->
					<!-- 너비 조절은 col-md-4 col-sm-12 클래스를 통해서 하세여 더 늘리고싶으면 col-md-5 로 올리는 식으로 -->
					<%
						if (ver != null && ver.equals("N")) {
					%>

					<div id="verInfo">일반 회원</div>


					<%
						} else if (ver != null && ver.equals("Y")) {
					%>

				
								<div id="verInfo2">멘토  회원</div>
						</div>
					
				<%
					}
					if (gender != null && gender.equals("M")) {
				%>

				<div class="col-md-4 col-sm-12" id="mainTable">
					<div class="contact-form bottom">
						<div id="formDiv">
							<form id="form" name="contact-form" onsubmit="return false"
								enctype="multipart/form-data">
								<!--  <div style="padding-left:23%;" id=myPhoto></div> -->
								<div id="myInfo"></div>
						</div>
					</div>
				</div>
				<%
					} else if (gender != null && gender.equals("F")) {
				%>
				<div class="col-md-4 col-sm-12" id="mainTable">
					<div class="contact-form bottom">
						<div id="formDiv">
							<form id="form" name="contact-form" onsubmit="return false"
								enctype="multipart/form-data">
								<!--  <div style="padding-left:23%;" id=myPhoto></div> -->
								<div id="myInfo2"></div>
						</div>
					</div>
				</div>
				<%
					} else {
					}
				%>
				<!-- 여기까지 -->


			</div>
		</div>
		</div>
	</section>
	<!--/#blog-->

	<footer id="footer">
		<div class="container">
			<div class="row">
				<div class="col-sm-12 text-center bottom-separator">
					<img src="images/home/under.png" class="img-responsive inline"
						alt="">
				</div>
				<div class="col-sm-12">
					<div class="copyright-text text-center">
						<p>&copy; TOTI Company 2019.</p>
						<p>
							TOTI <a target="_blank"
								href="https://github.com/son9zuen/TOTI/tree/master">Git Hub
								Page</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!--/#footer-->


	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/lightbox.min.js"></script>
	<script type="text/javascript" src="js/wow.min.js"></script>
	<script type="text/javascript" src="js/main.js"></script>

	<script>
		Kakao.init('a0bed70f3e68b9f973d0d2d13611aaea');

		$(document).ready(function() {
			var kakao = '${kakao}';

			if (kakao == 'kakao') {
				// 카카오로 로그인 되어있을 때
				infoWithKakao()
			} else {
				// 일반 회원으로 로그인 되어있을 때
				// myPhoto();  
				myInfo2();
				myInfo();

			}
		});

		function infoWithKakao() {
			Kakao.API
					.request({
						url : '/v2/user/me',
						success : function(res) {

							var id = res.kakao_account.email;
							var photo = res.properties.profile_image;
							var nickname = res.properties.nickname;

							var html = '';
							html += '<h2>카카오 아이디로 임시 로그인 중입니다.</h2>'
							html += '<table id="table"> <tr>';
							html += '<td>아이디: </td>';
							html += '<td>' + id + '</td> </tr>';
							html += '<tr><td>닉네임: </td>';
							html += '<td>' + nickname + '</td></tr>';
							html += '<tr><td>사진</td>';
							html += '<td><img class="img-thumbnail" style="width:150px" src="'+photo+'"></td></tr></table>';
							html += '<button onclick="logoutWithKakao()" style="float: right" class="btn btn-warning btn-fill">로그아웃</button>';

							$('#myInfo').html(html);
						},
						fail : function(error) {
						}
					});
		}

		// 로그아웃
		function logoutWithKakao() {
			Kakao.Auth.logout(function() {

				//alert('카카오 토큰 제거');

				$.ajax({
					url : "/toti/member/logout2",
					type : 'GET',
					dataType : 'text',
					success : function(data) {
						location.href = "/toti/main";
					}
				});
			});
		}

		function myInfo2() {

			var id = '${id}';

			$
					.ajax({
						url : '/toti/member/mypage',
						type : 'GET',
						data : {
							id : id
						},
						success : function(data) {
							//alert(JSON.stringify(data));

							var html = '';
							html += '<table id="table"> <tr>';
							html += '<td>아이디</td>';
							html += '<td>' + data.id + '</td> </tr>';
							html += '<tr><td>이름</td>';
							html += '<td>' + data.name + '</td></tr>';
							html += '<tr><td>성별</td>';
							html += '<td>여자</td></tr>';
							html += '<td>' + data.gender + '</td></tr>'; */
							//html += '<tr><td>회원 등급</td>';
							//html += '<td>' + data.ver + '</td></tr>';
							//	html += '<td><button style="color=black;" onclick="mentorInsert(\'' + data.id + '\')">고수등록</button></td></tr>';
							html += '<tr><td>사진</td>';
							html += '<td><img class="img-thumbnail" alt="Cinque Terre" src="/toti/uploadfile/' + data.photo_name + '"></td></tr>';
							// html += '<tr style="display:none;"><td>가입날짜</td>';
							//html += '<td>' + data.regDate + '</td></tr></table>';
							// html += '<td>' + data.regDate + '</td></tr>';
							html += '<tr><td><button class="btn btn-primary" onclick="edit(\''
									+ data.id + '\')">회원수정</button></td>';
							// html += '<button onclick="deleteMem(\'' + data.id + '\')">회원탈퇴</button>';
							html += '<td><button class="btn btn-primary" onclick="deleteMem(\''
									+ data.id + '\')">회원탈퇴</button>';
									  html += '<button style=\"background-color:gold;\" class=\"btn btn-primary\"><a href=\"/toti/cash\">캐쉬 충전</a></button>';
							//html += '<button style=\"background-color:gold;\" class=\"btn btn-primary\"><a href=\"/toti/insertMentor\">멘티로 전환</a></button></td></tr></table>';

							$('#myInfo2').html(html);
						}

					});
		}

		function myInfo() {

			var id = '${id}';

			$
					.ajax({
						url : '/toti/member/mypage',
						type : 'GET',
						data : {
							id : id
						},
						success : function(data) {
							//alert(JSON.stringify(data));

							var html = '';
							html += '<table id="table"> <tr>';
							html += '<td>아이디</td>';
							html += '<td>' + data.id + '</td> </tr>';
							html += '<tr><td>이름</td>';
							html += '<td>' + data.name + '</td></tr>';
							html += '<tr><td>성별</td>';
							html += '<td>남자</td></tr>';
							//html += '<tr><td>회원 등급</td>';
							//html += '<td>' + data.ver + '</td></tr>';
							//	html += '<td><button style="color=black;" onclick="mentorInsert(\'' + data.id + '\')">고수등록</button></td></tr>';
							html += '<tr><td>사진</td>';
							html += '<td><img class="img-thumbnail" alt="Cinque Terre" src="/toti/uploadfile/' + data.photo_name + '"></td></tr>';
							// html += '<tr style="display:none;"><td>가입날짜</td>';
							//html += '<td>' + data.regDate + '</td></tr></table>';
							// html += '<td>' + data.regDate + '</td></tr>';
							html += '<tr><td><button class="btn btn-primary" onclick="edit(\''
									+ data.id + '\')">회원수정</button></td>';
							// html += '<button onclick="deleteMem(\'' + data.id + '\')">회원탈퇴</button>';
							html += '<td><button class="btn btn-primary" onclick="deleteMem(\''
									+ data.id + '\')">회원탈퇴</button>';
									  html += '<button style=\"background-color:gold;\" class=\"btn btn-primary\"><a href=\"/toti/cash\">캐쉬 충전</a></button>';
							//html += '<button style=\"background-color:gold;\" class=\"btn btn-primary\"><a href=\"/toti/insertMentor\">멘티로 전환</a></button></td></tr></table>';

							$('#myInfo').html(html);
						}

					});

		}

		function logout(id) {

			$.ajax({
				url : "/toti/member/logout",
				data : {
					id : id
				},
				type : 'GET',
				dataType : 'text',
				success : function(data) {
					//alert(data);
					location.href = "/toti/main";
				}
			});

		}

		function deleteMem(id) {

			$.ajax({
				url : '/toti/member/mypage',
				type : 'DELETE',
				data : JSON.stringify({
					id : id
				}),
				contentType : 'application/json; charset=utf-8',
				dataType : 'text',
				success : function(data) {
					//alert(data);
					$.ajax({
						url : "/toti/member/logout",
						data : {
							id : id
						},
						type : 'GET',
						success : function(data) {
							location.href = "/toti/main";
						}
					});
				}
			});
		}

		function edit(id) {

			$
					.ajax({
						url : '/toti/member/mypage/id',
						type : 'GET',
						data : {
							id : id
						},
						success : function(data) {

							var html = '';

							html += '<table id="table"><tr><td>사진</td>';
							html += '<tr><td>사진수정</td>';
							html += '<td><input type="file" id="photo"></td>';
							html += '<td><input id="photoEditbtn" type="button" value="사진 업로드"></td></tr></table><hr>';

							html += '<table id="table"><tr>';
							html += '<td>아이디</td>';
							html += '<td> <input class="form-control" type="text" value="' + data.id + '" id="id" name="id" readonly>'
									+ '</td> </tr>';

							html += '<td> <input class="form-control" type="hidden" value="' + data.idx + '" id="idx" name="idx" readonly>'
									+ '</td> </tr>';
							html += '<td> <input class="form-control" type="hidden" value="' + data.ver + '" id="ver" name="ver" readonly>'
									+ '</td> </tr>';

							html += '<tr><td>비밀번호</td>';
							html += '<td> <input class="form-control" type="password" id="pw" name="pw" onfocusout="checkPw()">'
									+ '</td> </tr>';
							html += '<tr><td>비밀번호 확인</td>';
							html += '<td> <input class="form-control" type="password" id="pw2" name="pw2" ><span id="pwSpan"></span><span id="pwSpan2"></span><input type="checkbox" id="pwCheck"></td></tr>';
							html += '<tr><td>이름</td>';
							html += '<td> <input class="form-control" type="text" value="' + data.name + '" id="name" name="name" readonly>'
									+ '</td></tr>';
							html += '<tr><td>성별</td>';
							html += '<td> <input class="form-control" type="text" value="' + data.gender + '" id="gender" name="gender" readonly>'
									+ '</td></tr>';
							html += '<tr style="display:none"><td>회원 상태</td>';
							html += '<td> <input class="form-control" type="text" value="' + data.ver + '" id="ver"  readonly>'
									+ '</td></tr>';

							html += '<tr><td colspan="2"><input id="upEditbtn" type="button" class="btn btn-primary" value="수정완료"></td></tr></table>';

							html += '<button style="float: right"  onclick="cancel()">취소</button>';

							$('#myInfo').html(html);

							$('#photoEditbtn').click(
									function() {

										var formData = new FormData();

										formData.append('id', $('#id').val());
										if ($('#photo').val()) {
											formData.append('photo',
													$('#photo')[0].files[0]);
										} else {

											return false;
										}
										$.ajax({
											url : '/toti/member/mypage',
											type : 'POST',
											data : formData,
											processData : false, //파일 전송 시 필수
											contentType : false, //파일 전송 시 필수
											dataType : 'text',
											success : function(data) {
											}
										});
									});

							$('#upEditbtn')
									.click(
											function() {

												if (!$('#pwCheck').prop(
														'checked')) {
													alert('비말번호를 다시 확인해주세요');
													return false;
												}

												var checkPw = RegExp(/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,16}$/); // 비밀번호: 영문 4글자~10글자 미만, 최소 1개의 숫자 또는 특수문자 포함

												// 비밀번호 유효성 검사
												if (!checkPw.test($('#pw')
														.val())) {
													$('#pwSpan2')
															.html(
																	'비밀번호는 영문 /숫자를 각각 포함하며 8~16글자 이하로 해주세요 ');
													$('#pwSpan2').css('color',
															'red');
													$('#pw2').focus();
													return false;
												}

												$
														.ajax({
															url : '/toti/member/mypage',
															type : 'PUT',

															//alert("수정되었습니다.");

															data : JSON
																	.stringify({
																		idx : $(
																				'#idx')
																				.val(),
																		name : $(
																				'#name')
																				.val(),
																		id : $(
																				'#id')
																				.val(),
																		pw : $(
																				'#pw')
																				.val(),
																		gender : $(
																				'#gender')
																				.val(),
																		ver : $(
																				'#ver')
																				.val(),
																		photo : $(
																				'#photo_name')
																				.val()
																	}),
															contentType : 'application/json; charset=utf-8',
															dataType : 'text',
															success : function(
																	data) {
																//alert(요청하신 정보로 변경되었습니다.);
																location.href = "/toti/mypage";
																//alert(요청하신 정보로 변경되었습니다.);
															}
														});
												return false;
											});
						}

					});

		}

		function cancel() {
			location.href = "/toti/mypage";
		}

		function checkPw() {
			$('#pw2, #pw').focusout(function() {
				if ($('#pw').val() == $('#pw2').val()) {
					$('#pwSpan').html('비밀번호 일치');
					$('#pwSpan').css('color', 'green');
					$('#pwCheck').prop('checked', true);
				} else {
					$('#pwSpan').html('비밀번호 불일치');
					$('#pwSpan').css('color', 'red');
					$('#pwSpan').focus();
					$('#pwCheck').prop('checked', false);
				}
			});
		}
	</script>
</body>
</html>

