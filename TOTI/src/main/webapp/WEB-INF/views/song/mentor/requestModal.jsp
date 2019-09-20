<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	min-width: 900px;
	overflow: auto;
}

.wrapper {
	width: 60%;
	margin: 20px auto;
}

h1, h2, h3, h4, h5, h6 {
	color: black;
}

#request{
width: 100%;
}

#req {
	width: 70%;
	float:left;
}

#request h3{
text-align: left;
}

#request table {
width: 100%;
text-align: left;
}
#request table tr td:nth-child(1){
width: 40%;
height: 24px;
}

#est{
float: left;
text-align: center;
border : 1px solid #ddd;
border-radius: 3px; 
padding: 5px;
}
.modal-body table {
	width: 90%;
	margin: 0 auto;
}

.modal-body form {
	margin-top: 15px;
}

.modal-body table tr td:first-child {
	width: 20%;
	text-align: right;
}

.modal-body table tr td:last-child {
	width: 300px;
}

.modal-body table tr:last-child td {
	text-align: center;
}

.modal-body  .divbox {
	width: 90%;
	margin: 0 auto;
	border-radius: 5px 5px;
}

.modal-body #price {
	border: 1px solid #ddd;
	font-size: 9px;
}

.modal-body #est_price {
	height: 40px;
	line-height: 40px;
}

.modal-body #textarea {
	border: 1px solid #ddd;
}
p{
font-size:12px;
color: #212529;
}

.modal-body #subBtn{
margin: 3% 0;
width: 30%;
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
		<div class="container wrapper">
			<!-- container -->
			<div>
				<!-- 요청서 -->
				<div id="request">
					<h3>요청서</h3>
					<hr>
					<div id="req">
					<table>
					<c:forEach items="${viewData}" begin="0" end="0" var="requestInfo" varStatus="stat">
					<tr>
					<td>
					<p>${requestInfo.m_photo}</p>
					</td>
					<td>
					<p>${requestInfo.m_name}</p>
					</td>
					</tr>
					
					<tr>
					<td>
					<p>${requestInfo.cate_name}</p>
					</td>
					<td>
					<p>${requestInfo.service_name}</p>
					</td>
					</tr>
					</c:forEach>
					
					<c:forEach items="${viewData}" var="qna" varStatus="stat">
					<tr>
					<td>
					<p style="font-weight: 700">${qna.quest_name}</p>
					</td>
					<td>
						<p>${qna.answer_cont }</p>
						</td>
						</c:forEach>

					</table>
				</div>
				</div>
				<!-- 견적서 -->
				<div id="est">
				<c:forEach items="${viewData}" begin="0" end="0" var="requestInfo" varStatus="stat">
				${requestInfo.m_name}님이 멘토를  찾고 계세요! <br>
				${requestInfo.m_name}에게 ${requestInfo.service_name}를 알려주세요!<br>
				</c:forEach>
				<!-- Button to Open the Modal -->
				<button type="button" class="btn btn-primary" data-toggle="modal"
					data-target="#myModal" style="margin:2px auto;">견적서 보내기</button>
				</div>
				<!-- The Modal -->
				<div class="modal" id="myModal">
					<div class="modal-dialog">
						<div class="modal-content">

							<!-- Modal Header -->
							<div class="modal-header">
								<h1 class="modal-title">견적서</h1>
								<button type="button" class="close" data-dismiss="modal">×</button>
							</div>

							<!-- Modal body -->
							<div class="modal-body">
								<form method="post" enctype="multipart/form-data"
									onsubmit="return false">
									<c:forEach items="${viewData}" begin="0" end="0"
										var="requestInfo" varStatus="stat">
										<input type="hidden" id="request_idx" name="request_idx"
											value="${requestInfo.request_idx}">
									</c:forEach>
									<input type="text" name="mento_idx" id="mento_idx"
										name="mento_idx" value="3">
									<table>
										<tr>
											<td><p>금액</p></td>
											<td>
												<div id="price" class="divbox">
													<input type="text" name="est_price" id="est_price"
														style="width: 90%"><span id="won">원</span>
												</div>
											</td>
										</tr>
										<tr>
											<td><p>수업 상세 내용</p></td>
											<td>
												<div id="textarea" class="divbox">
													<textarea rows="7" cols="40" name="est_cont" id="est_cont"></textarea>
												</div>
											</td>
										</tr>
										<tr>
											<td><p>파일 추가</p></td>
											<td>
												<div id="file" class="divbox">

													<input type="file" name="est_file" id="est_file">

												</div>
											</td>
										</tr>
										<tr>
											<td colspan="2"><button type="button" id="subBtn" class="btn btn-primary"
												onclick="estimate()">전송</button></td>
										</tr>
									</table>

								</form>
							</div>

							<!-- Modal footer -->
							<div class="modal-footer">
								<button type="button" class="btn btn-danger"
									data-dismiss="modal">Close</button>
							</div>

						</div>
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

	/* 견적서 */
	function estimate() {
		var formData = new FormData();
		var file = $('#est_file')[0].files[0];

		formData.append('est_price', $('#est_price').val());
		formData.append('est_cont', $('#est_cont').val());
		formData.append('mento_idx', $('#mento_idx').val());

		if (file != null) {
			formData.append('est_file', file);
		}

		var request_idx = $('#request_idx').val();

		$.ajax({
			url : 'http://localhost:8080/toti/estimateform/' + request_idx,
			type : 'POST',
			processData : false,
			contentType : false,
			data : formData,
			success : function(data) {
				if (data == 'success') {
					alert('전송되었습니다.');
				}
			}
		});
		return false;
	}
</script>
</html>