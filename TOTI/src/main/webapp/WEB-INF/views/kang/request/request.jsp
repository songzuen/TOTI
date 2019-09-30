<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/frame/contents/header.jsp"%>
<!-- title -->
<title>TOTI</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
* {
	margin: 0;
	padding: 0; 
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

p {
	font-size: 12px;
	color: #212529;
}

.modal-body #subBtn {
	margin: 3% 0;
	width: 30%;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/frame/loading.jsp"%>
	<!-- page container -->
	<div class="page-container">
		<%@include file="/WEB-INF/views/frame/contents/contentsHeader.jsp"%>
		<%@include file="/WEB-INF/views/frame/contents/nav.jsp"%>
		<!-- demo content -->
		<div class="demo-content mrg-top-md">
			<!-- container -->
			<div class="container wrapper" style="margin-top: -50px">
				<div>
				<input type="hidden" value="${request_idx}" id="request_idx">
            	<input type="hidden" value="1" id="m_idx"> 
            		견적서를 기다려주세요!<br><hr>
					작성한 요청서
				<div id="request">
				
				</div>
					<!-- end home variation -->
				<!-- end component -->
				</div>
			</div>
			<!-- end container -->
		</div>
		<!-- end demo content -->
		<!-- footer -->
		<%@include file="/WEB-INF/views/frame/contents/footer.jsp"%>
	</div>
	
	<script type="text/javascript">

		$(document).ready(function() {
		
			rquestData();
		
		});
	
		function rquestData() {

			$.ajax({
				url : 'http://localhost:8080/toti/requestData',
				type : 'GET',
				data : {
					request_idx : $('#request_idx').val(),
					m_idx : $('#m_idx').val()
				},
				success : function(data) {
					
					var html = '';
					
					html += '<img alt="이미지없음" height="100px" src="<c:url value="/img/user/'+data.userInfo.m_photo+'" />"><br>';
					html += data.userInfo.m_name+'님';
					html += '<p style="text-align: right;">'+data.request_date+'</p>';
					html += '<p>분야 : '+data.cate_name+'</p>';
					html += '<p>선택한 서비스 : '+data.service_name+'</p>';
					
					for (var i = 0; i < data.answer.length; i++) {
						
						html += '<p>'+data.answer[i].quest_name+'</p>';
						html += '<p>'+data.answer[i].answer_cont+'</p>';
						
					}

					html += '<a class="btn btn-dark" onclick="request_del('+data.request_idx+')">요청서 취소하기</a>'
					
					$('#request').html(html);
					
				}

			});
			
		}
		
		
		function request_del(request_idx) {
			
			
			
		}
	
	</script>	
	
</body>
</html>
