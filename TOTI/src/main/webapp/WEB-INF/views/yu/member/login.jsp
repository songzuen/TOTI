<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>


	<%@ include file="/WEB-INF/views/frame/header.jsp" %>
	<title>Blog Masonry | Triangle</title>
	<style type="text/css">
	#mainTable{
		width:500px;
		left: 30%;
		margin: auto;
		background-color: #2E9AFE;
	}
	
	input{
		margin: 5px;
	}

	input[type=checkbox] {
    	display: none;
	}
	
	</style>
</head><!--/head-->
<body>
	<%@ include file="/WEB-INF/views/frame/nav.jsp" %>
    <!--/#header-->
    
   <section id="blog" class="padding-top padding-bottom">
        <div class="container">
            <div class="row">
                   <div class="col-md">
               
                      <!-- 예시 끝 -->
                     <!-- 동준님 이거 쓰세여 회원가입 -->
                     <!-- 너비 조절은 col-md-4 col-sm-12 클래스를 통해서 하세여 더 늘리고싶으면 col-md-5 로 올리는 식으로 -->
                     <div class="col-md-4 col-sm-12"  id="mainTable">
                         <div class="contact-form bottom">
                         <div id="formDiv">
                             <h2 style="text-align: center; color: white; font-weight: bold;">로그인</h2>
                             <form id="form" name="contact-form">
                                 <div class="form-group">
                                     
                                     <input type="email" name="id" id="id" class="form-control" required="required" placeholder="id" required>
										
                                 </div>
                                 
                                 
                                 <div class="form-group">
                                     <input type="password" name="pw" id="pw" class="form-control"  placeholder="password" required>
                                 </div>
               
               
                                 <div class="form-group">
                                     <input type="submit" style="background-color: #FFBF00; color: white; font-weight: bold;" name="submit" class="btn btn-submit" value="로그인">
                                       <a href="javascript:loginWithKakao()" class="btn btn-submit" id="kakaoLogin">카카오 로그인</a>
                                 </div>
                                 
                                 <div style="display: none;">
								<div class="input-container">
								<input type="text" id="idxstr" name="idxstr">
								<input type="text" id="name" name="name">
								<input type="text" id="photo_name" name="photo_name">
								<input type="text" id="ver" name="ver">
								<input type="text" id="gender" name="gender">
							</div>
						</div> 
						
                             </form>
                             </div>
                         </div>
                     </div>
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
                    <img src="images/home/under.png" class="img-responsive inline" alt="">
                </div>
                <div class="col-sm-12">
                    <div class="copyright-text text-center">
                        <p>&copy; TOTI Company 2019.</p>
                        <p>TOTI <a target="_blank" href="https://github.com/son9zuen/TOTI/tree/master">Git Hub Page</a></p>
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
		$(document).ready(function(){

			$('#form').submit(function(){
					
				

				$.ajax({
						url:'/toti/member/login',
							type : 'POST',
							data : $('#form').serialize(),
							success : function(data) {
							
							if (data.view == 'success') {
								
								
								
								alert('로그인 되었습니다.');
								$('#idxstr').val(data.idxstr);
								$('#name').val(data.name);
								$('#photo_name').val(data.photo_name);
								$('#ver').val(data.ver);
								$('#gender').val(data.gender);
								
// 								alert(data.id);
								
								$.ajax({
									url : "/toti/member/loginProcess",
										type : 'GET',
										data : {
											id : data.id,
											idxstr:data.idxstr,
											name : data.name,
											ver : data.ver ,
											gender : data.gender ,
											photo_name:data.photo_name
											},
								success : function(data) {
								
											location.href = "/toti/main";
											
														}
												});
											}
																if (data.view == 'undefined') {
																	var chk = confirm('인증되지 않은 회원입니다. 메일에서 인증을 하신후 이용해주세요');

																}
																if (data.view == 'loginfail') {
											
																	alert('아이디와 비밀번호가 일치하지 않습니다. 아이디와 비밀번호를 다시 확인해주시기 바랍니다.');
																}
																
															}
														});
												return false;
											});
						});
		
		 Kakao.init('a0bed70f3e68b9f973d0d2d13611aaea');
		  // 로그인
	        function loginWithKakao() {
	            // 로그인 창을 띄웁니다.
	            Kakao.Auth.login({
	                success: function(authObj) {
	                   
	                	//alert('Auth.login >>>>> '+JSON.stringify(authObj));

	                    // 정보 확인 -> id(email) session에 저장
	                        Kakao.API.request({
	                            url: '/v2/user/me',
	                            success: function(res) {
	                                //alert('API.request >>>>> '+JSON.stringify(res));
	                                var id = res.kakao_account.email;
	                                var kakao = 'kakao';
	                                
	                                $.ajax({
	                                    url: "/toti/member/loginProcess2",
	                                    data: {
	                                        id: id,
	                                        kakao: kakao
	                                    },
	                                    type: 'GET',
	                                    success: function(data){
	                                    	alert('카카오로 임시 로그인 되었습니다. ');
	                                    	location.href = "/toti/main";
	                                    }
	                                });
	                            },
	                            fail: function(error) {
	                            }
	                        });
	                    
	                    
	                },
	                fail: function(err) {
	                    alert('실패');
	                }
	            });
	        };
		
	</script>
</body>
</html>