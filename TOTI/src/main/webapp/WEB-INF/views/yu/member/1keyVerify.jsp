<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<title>Insert title here</title>

<style>
.formBlock {
	margin: 15px;
}

#formDiv {
	margin: 0 auto;
	width: 50%;
}
</style>
</head>
<body>
<!-- about section -->
            <section class="about-section">
        	    	<!-- section background -->
        	    	<div class="bg-container-static"></div>
                	<!-- end section background -->            
                	<div class="content col-md-8 col-md-offset-2 col-sm-12 col-sm-rlt col-xs-12 no-pad centering-y">
                    	<div class="col-md-12 col-sm-12">
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
                        	</div>
                        	<div id="formDiv" style="padding-left: 800px;">
							<input type="button" onclick="getParams()" value="시작하기" id="verify">
							</div>
                        	<!-- end company description -->
                    	</div>                    	
                	</div>
                	<!-- end content -->
            	</section>
            <!-- end about section -->

	
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
				url : 'http://localhost:8080/toti/member/verifyidx',
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
							location.href = "http://localhost:8080/toti/main";
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