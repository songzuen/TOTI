<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

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

		
         <div>
            <input type="hidden" name="coin" id="coin" value="0"/>
         </div>

		<div>
            	지	역<input type="text" name="location" id="location" />
         </div>
         <div>
            	무슨 멘토가 되시겠습니까?
            	<input type="radio" name="cate_idx" id="cate_idx" value="1" /> 보컬
				<input type="radio" name="cate_idx" id="cate_idx" value="2" /> 댄스
				<input type="radio" name="cate_idx" id="cate_idx" value="3" /> 악기
				<input type="radio" name="cate_idx" id="cate_idx" value="4" /> 공통
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
	 
	


	 $('#writeForm').submit(function(){
            
  
       $.ajax({
           url : 'http://13.209.47.16:8080/toti/member/mentor',
           type : 'POST',
           data : { 
        	   m_idx : $('#m_idx').val(),
        	   coin : $('#coin').val(),
               location : $('#location').val(),
               cate_idx: $('#cate_idx').val()
               
             

           },
         
           success : function(data){
           	
           	if (data == 'success') {
           	
           	alert('멘토님의 정보가 저장되었습니다.');
           	location.href = "http://13.209.47.16:8080/toti/main";
  			 }
  			 },
  			 error: function(e) {
  			 alert('실패임');
  			location.href = "http://13.209.47.16:8080/toti/insertMen";
      	 }
           

       });
     return false;

 
	  });
  }); 
    </script>
</body>
</html>
