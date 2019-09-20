<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	width: 65%;
	margin: 20px auto;
}

h1,h2,h3,h4,h5,h6{
color:black;
}
#request {
	width: 45%;
	border: 1px solid #ddd;
	float: left;
	margin-right: 5%;
	text-align: center;
}

#estimate {
	width: 45%;
	float: left;
}

table {
	width: 100%;
}

form {

	margin-top: 15px;
}

table tr td:first-child {
	width: 20%;
	text-align: right;
}
table tr td:last-child {
	width: 300px;
	}

table tr:last-child td {
	text-align: center;
	}
	
.divbox {
	width: 90%;
	margin: 0 auto;
	border-radius: 5px 5px;
}

#price {
	border: 1px solid #ddd;
	font-size: 9px;
}

#est_price {
	height: 40px;
	line-height: 40px;
}

#textarea {
	border: 1px solid #ddd;
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
				<!-- 요청서 -->
				<div id="request">
				<h3>요청서</h3>
				<hr>
				<c:forEach items="${viewData}" begin="0" end="0" var="requestInfo"
						varStatus="stat">
						${requestInfo.m_name}<br>
						${requestInfo.m_photo}<br>
						${requestInfo.cate_name }<br>
						${requestInfo.service_name}<br>
						</c:forEach>
						<c:forEach items="${viewData}" var="qna" varStatus="stat">
						${qna.quest_name }<br>
						${qna.answer_cont }
						</c:forEach>
						
				
				</div>
				<!-- 견적서 -->
				<div id="estimate">
				<h3 style="color: black; text-align: center">견적서</h3>
					<form method="post" enctype="multipart/form-data"
						onsubmit="return false">
						<c:forEach items="${viewData}" begin="0" end="0" var="requestInfo"
						varStatus="stat">
						<input type="hidden" id="request_idx" name="request_idx" value="${requestInfo.request_idx}">
						</c:forEach> 
						<input type="text"
							name="mento_idx" id="mento_idx" name="mento_idx" value="3">
						<table>
							<tr>
								<td>금액</td>
								<td>
									<div id="price" class="divbox">
										<input type="text" name="est_price" id="est_price"
											style="width: 90%"><span id="won">원</span>
									</div>
								</td>
							</tr>
							<tr>
								<td>수업 상세 내용</td>
								<td>
									<div id="textarea" class="divbox">
										<textarea rows="7" cols="40" name="est_cont" id="est_cont"></textarea>
									</div>
								</td>
							</tr>
							<tr>
								<td>파일 추가</td>
								<td>
									<div id="file" class="divbox">

										<input type="file" name="est_file" id="est_file">

									</div>
								</td>
							</tr>
							<tr>
								<td colspan="2"><input type="submit" onclick="estimate()"
									value="전송"></td>
							</tr>
						</table>

					</form>
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
			url : 'http://localhost:8080/toti/estimateform/'+request_idx,
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