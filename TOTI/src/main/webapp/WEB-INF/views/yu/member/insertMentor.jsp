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
		background-color: #E3F6CE;
	}
	
	input{
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
	#myInfo{
		color: black;
	}
	h2{
		text-align: center;
	}
	#table{
		color: black;
		margin: 0 auto;
	}
	img{
		width: 250px;
	}
	button{
		margin: 5px;
		background-color: silver;
	}
	input[type=checkbox] {
    	display: none;
	}
	input{
		margin: 5px;
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
                  <div style="text-align: center;">
                          <h3>1. 고객의 요청을 보내드려요</h3> 	
                           	<ul>
                           		<li>고객은 도움이 필요한 서비스에 대해서 요청서를 작성해요.</li>
                           		<li>요청이 올바른지 검토한 후 고수님께 무료로 보내드려요.</li>
                           	</ul>
                        	<hr><br><br>
                        	<h3>2. 답변을 보낼 고객을 선택하세요.</h3> 	
                           	<ul>
                           		<li>이메일과 문자메시지를 통해 고객의 요청을 전달 해 드려요.</li>
                           		<li>고객에게 견적서를 보낸 후 고용기회를 잡아보세요.</li>
                           		<li>견적서를 보내기 전 멤버십 가입이 필요해요.</li>
                           	</ul>
                        	<hr><br><br>
                        	<h3>3. 맞춤형 견적서를 보내세요.</h3> 	
                           	<ul>
                           		<li>고객이 원하는 요청에 맞춰 견적서를 보내세요.</li>
                           		<li>가격, 연락처, 리뷰, 자격증 등의 정보를 포함시켜 주세요.</li>
                           	</ul>
                        	<hr><br><br>
                        	<h3>4. 고객과 빠르게 연락하세요.</h3> 	
                           	<ul>
                           		<li>요청자는 견적을 비교하고 자신에게 맞는 고수를 선택하세요.</li>
                           		<li>채팅, 안심번호(전화)를 통해 세부사항을 조율하시면 됩니다.</li>
                           	</ul>
                        	<hr><br><br>
                       </div> 	 
                             <input type="hidden" id="id" name="id" value="${id}">
                            
							<input type="button" class="btn btn-submit" onclick="getParams()" value="확인" id="ver">
					
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
   
$(document).ready(function() {

});

function getParams() {
	

	var id = $('#id').val();
	
	//alert('code: ' + code);
	alert('id: ' + id);

	$.ajax({
		url : '/toti/member/verifyidx2',
		type : 'GET',
		data : {
			
			id : id
		},
		dataType: 'text',
		success : function(data) {
			if (data == 'success') {
				
				var chk = confirm('멘토 필수 정보를 등록해주세요');
				if(chk){
					location.href = "/toti/insertMen";
				}
			} else {
				alert('실패');
			}
		}
	});
}
   
     
    </script>
</body>
</html>
