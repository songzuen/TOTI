<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/frame/contents/header.jsp"%>

<!-- title -->
<title>SamplePage</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
	<%-- <%@include file="/WEB-INF/views/frame/loading.jsp"%> --%>
	<!-- page container -->
	<div>
		<%@include file="/WEB-INF/views/frame/contents/contentsHeader.jsp"%>
		<%@include file="/WEB-INF/views/frame/contents/nav.jsp"%>
		<!-- demo content -->
		<div class="wrapper">
			<!-- container -->
			<div>

				<!-- 고수 마이페이지 -->
				<div id="mentorPage">
				<input type="text" name="mento_idx" value=>
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
</body>
<script>
	$(document).ready(function() {	
		
		var mento_idx = <%= request.getParameter("mento_idx")%>
		$.ajax({
			url : 'http://localhost:8080/toti/mentorpage/' + mento_idx,
			type : 'GET',
			dataType : 'json',
			success : function(data) {
				var html = '';
				for (var i = 0; i < data.length; i++) {
					 html += data[0].m_photo + '<br>'; 
					html += data[0].mento_idx + '<br>';
					html += data[0].m_name + '<br>';
					html += data[0].cate_idx + '<br>';
					html += data[0].cate_name + '<br>';
					html += data[0].p_shot + '<br>';
					break;
				}
				for (var i = 0; i < data.length; i++) {
					html += data[i].review_cont + '<br>';
				}

				$('#mentorPage').html(html);
			}

		});
	});
	
</script>
</html>