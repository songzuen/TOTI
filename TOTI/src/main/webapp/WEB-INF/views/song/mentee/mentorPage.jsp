<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/frame/contents/header.jsp"%>

<!-- title -->
<title>SamplePage</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
* {
	margin: 0;
	padding: 0
}

body {
	min-width: 700px;
	min-height: 1200px;
}

.wrapper {
	width: 60%;
	margin: 20px auto;
	padding-left: 10px;
}

h2, h3, h4, h5, h6 {
	color: black;
	letter-spacing: 2px;
}

table {
width: 100%;
}
</style>
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
					<c:forEach items="${viewData}" begin="0" end="0" var="mentorInfo"
						varStatus="stat">

						<input type="hidden" name="m_idx" value="${mentorInfo.m_idx}">
						<br>
						<c:if test="${mentorInfo.m_photo eq null}">
					no image
					</c:if>
						<c:if test="${mentorInfo.m_photo ne null}">
					${mentorInfo.m_photo}
					</c:if>


						<br>
						<h3>${mentorInfo.m_name}</h3>
						<br>
						<h4>한줄 소개</h4>
						<br>
					 ${mentorInfo.p_shot}<br>
					기본 정보<br>
					${mentorInfo.tor_location}<br>
					${mentorInfo.p_edu}<br>
					${mentorInfo.p_career}<br>
					제공 서비스 <br>
					${mentorInfo.cate_name}<br> 
					서비스 상세 설명 <br>
					${mentorInfo.p_long}<br>
					</c:forEach>

					<div id="reviewBox">
						<h4>리뷰</h4>
						<c:forEach items="${viewData}" begin="0" end="0" var="mentorInfo">
							<h6>${mentorInfo.cont_cnt}개</h6>
							<br>
						</c:forEach>
						<c:forEach items="${viewData}" var="mentorInfo" varStatus="stat">

							<table>
								<tr>
									<td><h6>${mentorInfo.member_name}</h6></td>
									<td>${mentorInfo.review_star}</td>
									<fmt:formatDate var="reviewDate" pattern="yyyy-MM-dd"
										value="${mentorInfo.review_date}" />
									<td><c:out value="${reviewDate}" /></td>

								</tr>
								<tr>
									<td colspan="3">${mentorInfo.review_cont}</td>
								</tr>
							</table>
							<br>
							<br>
							<br>
					</div>
					</c:forEach>
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
</html>