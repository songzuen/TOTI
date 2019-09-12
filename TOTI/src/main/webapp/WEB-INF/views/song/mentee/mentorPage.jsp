<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/frame/contents/header.jsp"%>
<!-- title -->
<title>SamplePage</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
	<%@include file="/WEB-INF/views/frame/loading.jsp"%>
	<!-- page container -->
	<div>
		<%@include file="/WEB-INF/views/frame/contents/contentsHeader.jsp"%>
		<%@include file="/WEB-INF/views/frame/contents/nav.jsp"%>
		<!-- demo content -->
		<div class="wrapper">
			<!-- container -->
			<div>

				<!-- 고수 마이페이지 -->
				<div id="mentorPage"></div>
				<!-- end home variation -->
				<!-- end component -->
			</div>
			<!-- end container -->
		</div>
		<!-- end demo content -->
		<!-- footer -->
		<%@include file="/WEB-INF/views/frame/contents/footer.jsp"%>
	</div>
</body>
<script>
	$(document).ready(function() {

	});
	

	function mentorPage(mento_idx){
		$.ajax({
			url :'http://localhost:8080/toti/mentorpage/'+mento_idx,
			type : 'GET',
			dataType : 'json',
			contentType : 'application/json; charset=utf-8',
			success : function(data){
				var html = '';
				html += data.m_name;
				
				$('#mentorPage').html(html);
			}
			
		});
	}
</script>
</html>