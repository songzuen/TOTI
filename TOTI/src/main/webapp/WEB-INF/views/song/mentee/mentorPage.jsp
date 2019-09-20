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
	overflow: auto;
}

.wrapper {
	width: 60%;
	margin: 20px auto;
	padding-left: 10px;
}
 h4, h5, h6 {
	color: black;
	letter-spacing: 2px;
	margin: 0;
	padding: 0;
}

#mentorPage {
	width: 70%;
	float: left;
}

.buttonWrapper {
	widows: 30%;
	float: left;
}

.info {
	margin: 10px;
}

table {
	width: 100%;
}

table tr td:nth-child(1) {
	width: 20%;
}


.rBox {
	border: 1px solid #ddd;
	border-radius: 3px;
	text-align: center;
	padding: 5px;
	margin: 5px;
	position: relative;
}
</style>
</head>
<body>
	<%-- <%@include file="/WEB-INF/views/frame/loading.jsp"%>  --%>
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

						<!-- 고수 프로필 사진 -->
						<div class="info">${mentorInfo.m_photo}</div>

						<!-- 고수 이름 -->
						<div class="info">
							<h3>${mentorInfo.m_name}</h3>
						</div>

						<!-- 고수 한 줄 소개 -->
						<div class="info">
							<h4>한줄 소개</h4>
							${mentorInfo.p_shot}<br>
						</div>

						<!-- 기본 정보 -->
						<div class="info">
							<h4>기본 정보</h4>
						</div>

						<!-- 활동 지역 -->
						<c:if test="${mentorInfo.tor_location ne null }">
							<div class="info">${mentorInfo.tor_location}</div>
						</c:if>
						<c:if test="${mentorInfo.tor_location eq null }">
						</c:if>

						<!-- 고수 학력 -->
						<c:if test="${mentorInfo.p_edu ne null }">
							<div class="info">${mentorInfo.p_edu}</div>
						</c:if>
						<c:if test="${mentorInfo.p_edu eq null }">
						</c:if>

						<!-- 고수 경력 -->
						<c:if test="${mentorInfo.p_career ne null }">
							<div class="info">${mentorInfo.p_career}</div>
						</c:if>
						<c:if test="${mentorInfo.p_career eq null }">
						</c:if>

						<!-- 제공 분야 -->
						<div class="info">
							<h4>분야</h4>
							${mentorInfo.cate_name}
						</div>


						<!-- 제공 서비스 -->
						<div class="info">
							<h4>제공 서비스</h4>
						</div>
						<c:if test="${mentorInfo.tor_sname ne null }">
							<div class="info">${mentorInfo.tor_sname}</div>
						</c:if>
						<c:if test="${mentorInfo.tor_sname eq null }">
							<div class="info">제공 서비스 없음</div>
						</c:if>

					</c:forEach>
					<!-- 고수 상세 설명 -->
					<div class="info">
						<c:forEach items="${viewData}" begin="0" end="0" var="mentorInfo"
							varStatus="stat">
							<h4>서비스 상세 설명</h4>
					${mentorInfo.p_long}<br>
						</c:forEach>
					</div>

					<!-- 리뷰 박스 -->
					<div id="reviewBox" class="info">
						<c:forEach items="${viewData}" begin="0" end="0" var="mentorInfo">
							<h4>
								리뷰<span style="font-size: 10px; letter-spacing: 1px;">${mentorInfo.cont_cnt}개(${mentorInfo.str}점)</span>
							</h4>

							<script>
								var list = new Array();
							</script>
						</c:forEach>

						<c:forEach items="${viewData}" var="mentorInfo" varStatus="stat">

							<table>
								<tr>
									<td><h6 id="review_name">
											<!-- <script>
												list.push('${mentorInfo.member_name}');
											</script> -->
											${mentorInfo.member_name}

										</h6></td>
									<td>${mentorInfo.review_star}</td>
									<fmt:formatDate var="reviewDate" pattern="yyyy-MM-dd"
										value="${mentorInfo.review_date}" />
									<td><c:out value="${reviewDate}" /></td>

								</tr>
								<tr>
									<td colspan="3">${mentorInfo.review_cont}</td>
								</tr>
							</table>
						</c:forEach>
					</div>
				</div>


				<div class="buttonWrapper">
					<div id="requestBtnBox" class="rBox">
						<c:forEach items="${viewData}" begin="0" end="0" var="mentorInfo"
							varStatus="stat">
							${mentorInfo.m_name} 멘토님에게 <br> 원하는 서비스의 견적을 받아보세요
						</c:forEach>
						<br>
						<button type="button" id="subBtn" class="btn btn-primary">견적
							요청하기</button>
					</div>

					<div id="reviewBtnBox" class="rBox">
						<c:forEach items="${viewData}" begin="0" end="0" var="mentorInfo"
							varStatus="stat">
						${mentorInfo.m_name} 멘토님의 수업이 어떠셨나요?<br>
						${mentorInfo.m_name} 멘토님에 관한 후기를 남겨주세요
						</c:forEach>
						<br>
						<button type="button" id="subBtn" class="btn btn-primary">리뷰
							작성하기</button>
					</div>
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

	});
</script>
</html>