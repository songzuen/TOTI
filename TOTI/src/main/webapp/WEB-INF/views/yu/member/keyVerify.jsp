<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

	<%@ include file="/WEB-INF/views/frame/header.jsp" %>
	<title>Blog Masonry | Triangle</title>
	<style type="text/css">
	#mainTable{
		width:500px;
		left: 30%;
		margin: auto;
		background-color: #E0F8F1;
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
					<h1>
						<img height="80" src="images/toti_logo.png" alt="logo">
					</h1>
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
                             <h2 style="text-align: center;">회원가입</h2>
                            
                              <h3>회원가입을 축하드립니다</h3>
                	    	<!-- company description -->
                        	<div class="desc">
                    	    	<!-- quote -->
                            	<p class="quote separator-line">
                        	    	what is TOTI??
                            	</p>
                            	<!-- end quote -->
                        
                            	<p class="mrg-top-sm">
									TOTI 는 Mentor와 Mentee의 생산적인 만납의 기회를 제공해 드린다는 의미를 가지고 있으며 "to time"이란 의미를 함축하고 있습니다.
                            	</p>
                        
                            	<p class="mrg-top-sm">
                        	    	취미, 취업, 입시 등 다양한 목표를 가진 멘티와 숨어있는 멘토들의 만남을 주선해드립니다.
                        	    	TOTI는 음악이라는 한가지 주제로 더욱 구체적이며 전문성있는 서비스를 제공합니다. 
                            	</p>
                            	<p class="mrg-top-sm">
                            		음악을 배우고 싶은 멘티님들과
                        	    	멋진 능력과 재능을 가지고 있는 멘토님들의  기다립니다.
                        	    	지금 바로 TOTI를 시작하시겠습니까?
                        	    	
                            	</p>   
                               <div id="formDiv" style="float: right;">
							<input type="button" class="btn btn-submit" onclick="getParams()" value="시작하기" id="verify">
							</div>
                             </div>
                        	
                         </div>
                     </div>
                    <!-- 여기까지 -->
                    
                
                    </div>
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
		$(document).ready(function() {

		});

		function getParams() {
			var url = decodeURIComponent(location.href);
			url = decodeURIComponent(url);

			var params;
			params = url.substring(url.indexOf('?') + 1, url.length);
			params = params.split("&");
			var code = params[0].split("=")[1];
			var id = params[1].split("=")[1];

			//alert('code: ' + code);
			//alert('id: ' + id);

			$.ajax({
				url : '/toti/member/verifyidx',
				type : 'GET',
				data : {
					code : code,
					id : id
				},
				dataType: 'text',
				success : function(data) {
					if (data == 'success') {
						alert('메일 인증이 완료되었습니다.');
						var chk = confirm('다시 로그인 후 이용해주세요');
						if(chk){
							location.href = "/toti/main";
						}
					} else {
						alert('인증 실패');
					}
				}
			});
		}
	</script>
</body>

</html>