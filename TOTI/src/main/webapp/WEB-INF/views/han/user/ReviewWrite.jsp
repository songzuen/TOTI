<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/frame/contents/header.jsp"%>
<!-- title -->
<title>TOTI :: 리뷰 쓰기</title>
<style>
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/frame/loading.jsp"%>
	<!-- page container -->
	<div class="page-container">
		<%@include file="/WEB-INF/views/frame/contents/contentsHeader.jsp"%>
		<%@include file="/WEB-INF/views/frame/contents/nav.jsp"%>
		<!-- demo content -->
		<div class="demo-content mrg-top-md">
			<!-- container -->
			<div class="container" style="margin-top: -50px">
				<div class="reviewForm">
					<input type="hidden" value="${review_idx}" id="review_idx">
					<input type="hidden" value="3" id="mento_idx"> <input
						type="hidden" value="1" id="m_idx">
					<div id="mentorProfile">
				</div>
					<form id="reviewFrom">
						<h4>당신의 평가</h4>
						<select>
							<option>5</option>
							<option>4</option>
							<option>3</option>
							<option>2</option>
							<option>1</option>
						</select><br> <input type="text" name="review_cont" id="review_cont">
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
		<%@include file="/WEB-INF/views/frame/contents/footer.jsp"%>
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
						html += '<h2>' + data[i].m_name + ' 멘토님의'
								+ data[i].cate_name + '레슨</h4></div>';

					}
					$('#mentorProfile').html(html);

				}

			});

		}
	</script>
</body>
</html>
