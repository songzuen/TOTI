<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/frame/main/header.jsp" %>
    <!-- title -->
    <title>TOTI</title>
</head>
<body>
<%@include file="/WEB-INF/views/frame/loading.jsp" %>
<%@include file="/WEB-INF/views/frame/mainNav.jsp" %>
    <!-- page container -->
    <div class="page-container">
        <!-- section container -->
        <div class="section-container">
            <!-- home section -->
            <section class="home-section">
        	    	<!-- section background -->
        	    	<div class="bg-container"></div>
                	<!-- end section background -->
                	<!-- content -->
                	<div class="content col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-12 col-xs-rlt no-pad centering-y">            	    	
            	    	<div class="col-md-12 col-sm-12">
                	    	<!-- headline -->
                	    	<h1>TOTI</h1>           
                            <div class="sub-title" id="wordsrotator">
                		    	<h4>creative agency</h4>
                	    	</div>                     	    	
                	    	<!-- end headline -->                               
                	    	<!-- short description -->
                	    	<p class="desc" style="width: 100%">
                		    	여기에 머라고 소개글을 넣으면 좋을까요.
                	    	</p>
                	    	<!-- end short description -->
                            <!-- countdown container -->
                        	<div id="countdown" class="countdown-container">
                    	    	
            		        </div>
                        	<!-- end countdown container -->
                    	</div>                    	
                	</div>
                	<!-- end content -->            
            	</section>
            <!-- end home section -->
			<%@include file="/WEB-INF/views/yu/member/2.jsp" %> 
            <%@include file="/WEB-INF/views/yu/member/1.jsp" %>
            <%@include file="/WEB-INF/views/yu/member/regMember.jsp" %>
        </div>
        <!-- end section container -->
    </div>
    <%@include file="/WEB-INF/views/frame/main/footer.jsp" %>
    <!-- end page container -->
    
    
	<script>
		$(document).ready(function() {

			kategorieList();

		});
		
		function kategorieList() {
			
			$.ajax({
				url : 'http://localhost:8080/toti/kategorieList',
				type : 'GET',
				success : function(data) {
					
					var html = '';

					for (var i = 0; i < data.length-1; i++) {
						html += '<div class="dash days_dash">\n<div class="counter">\n';
						html += '<div class="dash_title"><a style="color: white" href="<c:url value="/request?cate_idx='+data[i].cate_idx+'" />"> '+ data[i].cate_name +'</a></div>\n';
						html += '</div>\n';
						html += '</div>\n';
					}

					$('#countdown').html(html);
					
				}

			});
			
		}
	</script>	
</body>
</html>