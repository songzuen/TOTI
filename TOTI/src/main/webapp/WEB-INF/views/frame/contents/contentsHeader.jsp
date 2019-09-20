<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- home section -->
<div class="home-section" data-stellar-background-ratio="0.5">
	<div class="home-content is-visible">
		<!-- text container -->
		<%@include file="/WEB-INF/views/frame/mainNav.jsp"%>
		<div class="container text-container">
			<div
				class="col-sm-12 col-rlt-left col-xs-rlt centering-y text-center">
				
				<img alt="회원사진" src="<c:url value="/img/logo_white2.png"/>" class="logo" />
				<h4>Hi, Welcome To</h4>
				<h1>OO (멘티던 멘토)님</h1>
			</div>
		</div>
		<!-- end text container -->
	</div>
</div>
<!-- end home section -->