<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

	<%@ include file="/WEB-INF/views/frame/header.jsp" %>
<%-- 	<% int idx = (int)session.getAttribute("idx"); %> --%>
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
    <div id="writeArea">

   
    <!-- 작성 폼 -->
   <form method="post" id="writeForm">

         <input type="hidden" name="m_idx" id="m_idx" value="${idx}"/>
		<input type="hidden" name="id" id="id" value="${id}"/>
			<input type="hidden" name="ver" id="ver" value="Y"/>
					
         <div>
            <input type="hidden" name="coin" id="coin" value="0"/>
         </div>

		<div>
            	주소<input type="hidden" class="form-control" id="postcode" placeholder="우편번호"> 
				<input type="button" onclick="execDaumPostcode()" value="주소 검색하기"><br>
				<input type="text" class="form-control" id="location"  placeholder="주소"><br>
				

         </div>
         <div>
            	무슨 멘토가 되시겠습니까?
            	<input type="radio" name="radio" id="radio" value="1" /> 보컬
				<input type="radio" name="radio" id="radio" value="2" /> 댄스
				<input type="radio" name="radio" id="radio" value="3" /> 악기
         </div>
         <div>
         			<input type="submit" value="멘토 정보 등록" />
         </div>
   </form>
   </div>
   </div>
                    <!-- 여기까지 -->
                    
                
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
	 
	/* var id = $('#id').val();
	

	 $('#writeForm').submit(function(){
            
  
       $.ajax({
           url : '/toti/member/mentor',
           type : 'POST',
           data : { 
        	   m_idx : $('#m_idx').val(),
        	   coin : $('#coin').val(),
               location : $('#location').val(),
               cate_idx: $('#cate_idx').val()
               
           },
         
           success : function(data){
           	if (data == 'success') {
               /*   $.ajax({
                     url : '/toti/member/mentor/'+id,
                     type : 'PUT',
                     data: JSON.stringify({
                         ver: $('#ver').val() 
           
                     }),
                     contentType: 'application/json; charset=utf-8',
                     success: function(data) {
                    		alert('멘토님의 정보가 저장되었습니다.');
    			       	location.href = "/toti/main";
                     }
                  

                 });
  			 }
  			 
           },
  			 
  			 error: function(e) {
  			 alert('실패임');
  			location.href = "/toti/insertMen";
      	 }
           

       });
     return false;

 
	  });
  }); */
  
  $('#writeForm').submit(function(){
      
	
      $.ajax({
          url : '/toti/member/mentor',
          type : 'POST',
          data : { 
       	   m_idx : $('#m_idx').val(),
       	   coin : $('#coin').val(),
              location : $('#location').val(),
              
             
              cate_idx:$('input[name="radio"]:checked').val()
              
            

          },
        
          success : function(data){
          	
          	if (data == 'success') {
          		alert(radio);
          	alert('멘토님의 정보가 저장되었습니다. 다시 로그인 해주세요');
          	location.href = "/toti/member/logout";
 			 }
 			 },
 			 error: function(e) {
 			 alert('실패임');
 			location.href = "/toti/insertMen";
     	 }
          

      });
    return false;


	  });
 }); 
  
  
function execDaumPostcode() {
	new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var addr = ''; // 주소 변수

					//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						addr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('postcode').value = data.zonecode;
					document.getElementById("location").value = addr;
					
					// 커서를 상세주소 필드로 이동한다.
					
				}
			}).open();
}
  
    </script>
</body>
</html>
