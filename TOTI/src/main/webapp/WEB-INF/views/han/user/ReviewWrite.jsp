<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/frame/header.jsp"%>
<!-- title -->
<title>TOTI :: 리뷰 쓰기</title>
<style>
</style>
</head>
<body>
	<!-- page container -->
	<div class="page-container">
		<%@include file="/WEB-INF/views/frame/nav.jsp"%>
		<!-- demo content -->
		<div class="demo-content mrg-top-md">
			<!-- container -->
			<div class="container" style="margin-top: -50px">
				<div class="reviewFrame">
					
					<div id="mentorProfile"></div>
					<form id="reviewFrom">
						<input type="hidden" value="${mento_idx }" id="mento_idx" name="mento_idx"> 
						<input type="hidden" value="1" id="m_idx" name="m_idx">
						<h4>당신의 평가</h4>
						<select name="review_star" id="review_star">
							<option value="5">5</option>
							<option value="4">4</option>
							<option value="3">3</option>
							<option value="2">2</option>
							<option value="1">1</option>
						</select><br> <input type="text" name="review_cont" id="review_cont" style="width:700px; height:100px;'">
						<br> <input type="submit" value="리뷰 남기기">
					</form>
				</div>

				<!-- end home variation -->
				<!-- end component -->
			</div>
			<!-- end container -->
		</div>
		<!-- end demo content -->
		<!-- footer -->
		<%@include file="/WEB-INF/views/frame/footer.jsp"%>
	</div>

	<script>
		$(document).ready(function() {
			mentorProfile($('#mento_idx').val());
		});

		function mentorProfile(mento_idx) {
			$.ajax({
				url : 'http://localhost:8080/toti/mento/' + mento_idx,
				type : 'GET',
				success : function(data) {
					var html = '';
					for (var i = 0; i < data.length; i++) {
						
						html += '<div id="mentoInfo">';
						html += data[i].m_photo;
						html += '<h4>' + data[i].m_name
								+ ' 멘토님에게 리뷰를 남겨주세요.</h4></div>';
						html += '<h2>' + data[i].m_name + ' 멘토님의 '
								+ data[i].cate_name + ' 레슨</h4></div>';
						break;
					}
					$('#mentorProfile').html(html);
				}
			});
		}
		
		$('#reviewFrom').submit(function(){
	            $.ajax({
	                url : 'http://localhost:8080/toti/review' ,
	                type : 'POST',
	                data : $('#reviewFrom').serialize(),
	                success : function(data){
	    				if(data=='success'){
	    					alert('리뷰가 추가되었습니다.');
	    					location.href="http://localhost:8080/toti/main";
	    				}else {
	    					alert('등록 실패');
	    				}
	    			}
	            });
	            
	            return false;
	        });
	</script>
</body>
</html>
