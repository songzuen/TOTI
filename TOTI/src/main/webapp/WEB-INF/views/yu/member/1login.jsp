<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<title></title>

<style>
input[type="text"], input[type="email"], input[type="password"],
	textarea {
	display: inline-block;
	width: 100%;
	padding: 18px 25px 22px 25px;
	font-size: 14px;
	letter-spacing: 0px;
	font-weight: 400;
	color: #262626;
	border: none;
	background: none;
	z-index: 2;
	backface-visibility: hidden;
	border: 2px solid white;
}

textarea {
	height: 150px;
	resize: none;
}

form.contact-form input[type="text"], form.contact-form input[type="email"],
	form.contact-form input[type="password"], form.contact-form textarea {
	color: white;
}
</style>

</head>

<body>
	<!-- contact section -->
	<section class="contact-section">
		<!-- section background -->
		<div class="bg-container-static"></div>
		<!-- end section background -->

		<!-- half overlay -->
		<div class="half-overlay right"></div>
		<!-- end half overlay -->

		<!-- content -->
		<div
			class="content col-md-10 col-md-offset-1 col-sm-12 col-xs-12 no-pad centering-y col-sm-rlt">
			<!-- details -->
			<div class="col-md-4 col-sm-12">
				<!-- office -->
				<div class="details">
					<h5>office</h5>
					<p>
						Pure Pixels <br />India
					</p>
				</div>
				<!-- end office -->

				<!-- phone -->
				<div class="details">
					<h5>phone</h5>
					<p>
						+123 4567 890<br />+123 4567 891
					</p>
				</div>
				<!-- end phone -->

				<!-- email -->
				<div class="details">
					<h5>email</h5>
					<p>
						support@yourdoain.com<br />info@yourdoain.com
					</p>
				</div>
				<!-- end email -->

				<!-- social media -->
				<div class="details">
					<h5>stay connected</h5>

					<!-- social media container -->
					<div class="social-media-container">
						<a class="social-media" href="#"><i class="fa fa-facebook"></i></a>
						<a class="social-media" href="#"><i class="fa fa-twitter"></i></a>
						<a class="social-media" href="#"><i class="fa fa-behance"></i></a>
						<div class="col-xs-12 no-pad text-left mrg-top-xs">
							<a href="<c:url value="reg" />"><button type="submit"
									class="button button-green button-small">회원가입</button></a>
						</div>
						
					</div>
					<!-- end social media container -->
				</div>
				<!-- end social media -->
			</div>
			<!-- end details -->

			<!-- contact form container -->
			<div class="contact-form-container col-md-8 col-sm-12 col-xs-12">
				<h5>로그인</h5>
				<div id="formDiv" style="color: white;">
					<form id="form" class="form-inline" role="form">


						<!-- left side -->
						<div class="col-md-6 col-sm-12 no-pad">
							<div class="input-container">
								<input type="email" id="id" name="id" required> <label
									for="아이디">아이디</label>

								<div class="input-border-bottom"></div>
							</div>
						</div>
						<!-- end left side -->
						<!-- left side -->
						<div class="col-md-6 col-sm-12 no-pad">
							<div class="input-container">
								<input type="password" id="pw" name="pw" required> <label
									for="비밀번호">비밀번호</label>

								<div class="input-border-bottom"></div>
							</div>
						</div>

					 	<div style="display: none;"  class="col-md-6 col-sm-12 no-pad">
							<div class="input-container">
								<input type="text" id="idxstr" name="idxstr">
								<input type="text" id="name" name="name">
								<input type="text" id="photo_name" name="photo_name">
								<div class="input-border-bottom"></div>
							</div>
						</div> 
						<!-- end left side -->

						<!-- button container -->
						<div class="col-xs-12 no-pad text-left mrg-top-xs">
							<button type="submit" class="button button-green button-small">로그인</button>
						</div>

						<!-- end button container  -->


					</form>

				</div>


			</div>
		</div>
	</section>
	<script>
		$(document).ready(function(){

			$('#form').submit(function(){
					
				//var id = $('#id').val();
				

				$.ajax({
						url:'http://localhost:8080/toti/member/login',
							type : 'POST',
							data : $('#form').serialize(),
							success : function(data) {
							//alert(data.view);
							//alert(data.id);
							
							if (data.view == 'success') {
								
								
								
											//인증처리됨 -> 메인화면으로
								alert('로그인 되었습니다.');
								$('#idxstr').val(data.idxstr);
								$('#name').val(data.name);
								$('#photo_name').val(data.photo_name);
								
								alert(data.idxstr);
								alert(data.id);
								
								$.ajax({
									url : "http://localhost:8080/toti/member/loginProcess",
										type : 'GET',
										data : {
											id : data.id,
											idxstr:data.idxstr,
											name : data.name,
											photo_name:data.photo_name
											},
								success : function(data) {
								
											location.href = "http://localhost:8080/toti/main";
											
														}
												});

																	/* Swal.fire('인증되었습니다!')*/
																	//location.href = "http://localhost:8080/toti/member/mypage";
																	//location.href = "${pageContext.request.contextPath}//WEB-INF/views/yu/mypage.jsp";
												}
																if (data.view == 'undefined') {
																	//미인증 회원 -> 이메일 다시 보내기
																	var chk = confirm('인증되지 않은 회원입니다. 메일에서 인증을 하신후 이용해주세요');
// 																	if (chk) {
// 																		$.ajax({
// 																					url : 'http://localhost:8080/toti/member/verifyidx/resend',
// 																					data : {
// 																						id : id,
// 																						idxstr:idxstr
// 																					},
// 																					type : 'GET',
// 																					success : function(data) {
// 																						if (data == 'success') {
// 																							alert("인증키가 메일로 재전송 되었습니다.");
// 																							//$('#span').css('color','green');
// 																						} else {
// 																							//$('#span').html("메일 인증키 전송 실패");
// 																						//$('#span').css('color','red');
// 																						alert("인증에 실패했습니다. 다시이용해주시기 바랍니다.")
// 																						}
// 																					}
// 																				});
// 																	}
																}
																if (data.view == 'loginfail') {
																	//로그인 실패
																	alert('로그인 실패');
																	alert('아이디와 패스워드를 다시 확인해주세요');
																}
															}
														});
												return false;
											});
						});
	</script>
</body>
</html>