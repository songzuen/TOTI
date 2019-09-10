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
                    	    	<!-- days left -->
                            	<div class="dash days_dash">
                			    	<div class="counter">
            	    	    	        <div class="dash_title">보컬</div>
            	    	    	        <div style="color: white"><a href="<c:url value="/sample" />">이미지넣기</a></div>
							        </div>
                		    	</div>
                                <!-- end days left -->
                                <!-- hours left -->
                                <div class="dash hours_dash">
            	    		        <div class="counter">
            	    	    	        <div class="dash_title">댄스</div>
            	    	    	        <div style="color: white">이미지넣기</div>
							        </div>
            	    	        </div>
                                <!-- end hours left -->
                                <!-- minutes left -->
                                <div class="dash minutes_dash">
            	    		        <div class="counter">
            	        		        <div class="dash_title">악기</div>
            	        		        <div style="color: white">이미지넣기</div>
							        </div>
                		        </div>
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
</body>
</html>