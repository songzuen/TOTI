<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/frame/contents/header.jsp" %>
    <!-- title -->
    <title>SamplePage</title>
</head>
<body>
<%@include file="/WEB-INF/views/frame/loading.jsp" %>
    <!-- page container -->
    <div class="page-container">
		<%@include file="/WEB-INF/views/frame/contents/contentsHeader.jsp" %>
		<%@include file="/WEB-INF/views/frame/contents/nav.jsp" %>
        <!-- demo content -->
        <div class="demo-content mrg-top-md">
            <!-- container -->
            <div class="container" style="margin-top: -50px">
            <input type="text" value="${request_idx}" id="request_idx">
                		요청서 작성 완료!
                		<hr>
                		견적서를 기다려주세요!<br>
                		
                		작성한 요청서
                		
                		
                <!-- end home variation -->
                <!-- end component -->
            </div>
            <!-- end container -->
        </div>
        <!-- end demo content -->
        <!-- footer -->
    <%@include file="/WEB-INF/views/frame/contents/footer.jsp" %>
    </div>
    <script type="text/javascript">

	

	$(document).ready(function() {
		
		rquestData($('#request_idx').val());
		
	});
	
	
	function rquestData(request_idx) {
		
		$.ajax({
			url : 'http://localhost:8080/toti/request/'+request_idx,
			type : 'GET',
			success : function(data) {
				
				
			
			}

		});
		
	}
	
	</script>
</body>
</html>
