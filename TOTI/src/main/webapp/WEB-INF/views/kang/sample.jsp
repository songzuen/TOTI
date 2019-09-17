<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <div>
                	컨텐츠@@@@@@@@@@@@@@@@
                </div>
                <!-- end home variation -->
                <!-- end component -->
            </div>
            <!-- end container -->
        </div>
        <!-- end demo content -->
        <!-- footer -->
    <%@include file="/WEB-INF/views/frame/contents/footer.jsp" %>
    </div>
</body>
</html>
