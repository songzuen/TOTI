<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/frame/contents/header.jsp"%>
<!-- title -->
<title>TOTI :: 상세 프로필 설정</title>
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
				<hr>
					<div id="mento"> </div>

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
			MentoList();
		});
		
		function MentoList() {
			
			$.ajax({
				url : 'http://localhost:8080/toti/mento/mentoList',
				type : 'GET',
				success : function(data) {
					
					var html = '';
					for (var i = 0; i < data.length; i++) {
						html += '<div><a href="<c:url value="/profile/'+data[i].mento_idx+'" />"> '+ data[i].mento_idx +'</a></div>\n';
					}
					$('#mento').html(html);
					
				}
			});
			
		}
		
		
	</script>
</body>

</html>