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
						  <span class="starR">1</span>
						  <span class="starR">2</span>
						  <span class="starR">3</span>
						  <span class="starR">4</span>
						  <span class="starR">5</span>
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
		
	if($('#mento_idx').val() == $('#m_idx').val()){
		alert('본인은 리뷰작성이 불가능합니다.');
		location.href="/toti/profile/"+$('#mento_idx').val();
	}
	
	
	
		$(document).ready(function() {
			mentorProfile($('#mento_idx').val());
		});
		
		function mentorProfile(mento_idx) {
			$.ajax({
				url : '/toti/mento/' + mento_idx,
				type : 'GET',
				success : function(data) {
					var html = '';
					for (var i = 0; i < data.length; i++) {
						
						html += '<div id="mentoFrame">';
						html += '<img class="img" src="<c:url value="/uploadfile/'+data[i].m_photo+'" />">';
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
			if($('#restar').val() == ""){
				alert('별점을 선택해주세요.');
			}else if($('#m_idx').val() == ""){
				alert('로그인 후 이용해주세요.');
				location.href="/toti/login";
			}
	            $.ajax({
	                url : '/toti/review' ,
	                type : 'POST',
	                data : $('#reviewFrom').serialize(),
	                success : function(data){
	    				if(data=='success'){
	    					alert('리뷰가 추가되었습니다.');
	    					location.href="/toti/mentor/"+$('#mento_idx').val();
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
