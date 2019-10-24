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
                     <div class="col-md-4 col-sm-12"  id="mainTable">
                         <div class="contact-form bottom">
                         <div id="formDiv">
                            
                             <div id="formDiv" style="float: right;">
                             <input type="hidden" id="id" name="id" value="${id}">
							<input type="button" class="btn btn-submit" onclick="getParams()" value="확인" id="ver">
							</div>
                            
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
