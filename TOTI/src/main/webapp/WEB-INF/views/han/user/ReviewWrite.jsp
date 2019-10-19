<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/frame/header.jsp"%>
<!-- title -->
<title>TOTI :: 리뷰 쓰기</title>
<style>

#mentorProfile{
	background-color: #FAFAFA;
}

.img{
		width: 130px;
		float: left;
		border-radius: 50%;
		margin: 10px;
	}

.mentoInfo {
	padding-top : 30px;
}

.starR{
  background: url('https://d1hhkexwnh74v.cloudfront.net/icons/icon-common-review-star-small-empty.svg') no-repeat right 0;
  background-size: auto 100%;
  width: 35px;
  height: 30px;
  display: inline-block;
  text-indent: -9999px;
  cursor: pointer;
}
.starR.on{
	background: url('https://d1hhkexwnh74v.cloudfront.net/icons/icon-common-review-star-small-full.svg') no-repeat right 0;
	background-size: auto 100%;
	width: 35px;
	height: 30px;
	margin-top: 10px;
}

#reviewFrom{
	padding : 0 10%;
}
</style>
</head>
<body>
	<!-- page container -->
	<div class="page-container">
		<%@include file="/WEB-INF/views/frame/nav.jsp"%>
		<!-- demo content -->
		<div class="demo-content mrg-top-md">
			<!-- container -->
			<div class="container" style="margin-top: -50px; margin-bottom: 50px;">
				<div class="reviewFrame">
					
					<div id="mentorProfile" style="height:150px;"></div>
					<form id="reviewFrom">
						<input type="hidden" value="${mento_idx}" id="mento_idx" name="mento_idx"> 
						<input type="hidden" value="${idx}" id="m_idx" name="m_idx">
						<br><div style="font-size: 16px; font-weight: bold">당신의 평가</div>
						<div class="starRev">
						  <span class="starR on">1</span>
						  <span class="starR on">2</span>
						  <span class="starR on">3</span>
						  <span class="starR on">4</span>
						  <span class="starR on">5</span>
						</div><br>
						<input type="hidden" name="review_star" id="restar">
						<input type="text" name="review_cont" id="review_cont" style="width:700px; height:100px;'">
						<br><br><input type="submit" value="리뷰 남기기">
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
				url : 'http://13.209.47.16:8080/toti/mento/' + mento_idx,
				type : 'GET',
				success : function(data) {
					var html = '';
					for (var i = 0; i < data.length; i++) {
						
						html += '<div id="mentoFrame">';
						html += '<img class="img" src="<c:url value="/images/user/'+data[i].m_photo+'" />">';
						html += '<div class="mentoInfo"><h4>' + data[i].m_name
								+ ' 멘토님에게 리뷰를 남겨주세요.</h4></div>';
						html += '<div>' + data[i].m_name + ' 멘토님의 '
								+ data[i].cate_name + ' 레슨</div></div></div>';
						break;
					}
					$('#mentorProfile').html(html);
				}
			});
		}
		
		$('#reviewFrom').submit(function(){
			alert($('#review_star').html());
	            $.ajax({
	                url : 'http://13.209.47.16:8080/toti/review' ,
	                type : 'POST',
	                data : $('#reviewFrom').serialize(),
	                success : function(data){
	    				if(data=='success'){
	    					alert('리뷰가 추가되었습니다.');
	    					location.href="http://13.209.47.16:8080/toti/main";
	    				}else {
	    					alert('등록 실패');
	    				}
	    			}
	            });
	            
	            return false;
	        });
		
		$('.starRev span').click(function(){
			  $(this).parent().children('span').removeClass('on');
			  $(this).addClass('on').prevAll('span').addClass('on');
			  $('#restar').val($(this).text());
			  return false;
			});
		
	</script>
</body>
</html>
