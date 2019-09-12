<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
body{
min-width: 900px;
}

.wrapper {
	width: 80%;
	margin: 20px auto;
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

.divbox{
width: 60%;
margin : 0 auto;
}
#price {
	border : 1px solid #ddd;
	font-size : 9px;
	
}

#est_price{
height: 40px;
line-height: 40px;
}

#textarea{
border:  1px solid #ddd;
}

</style>
</head>
<body>
	<%@include file="/WEB-INF/views/frame/loading.jsp"%>
	<!-- page container -->
	<div>
		<%@include file="/WEB-INF/views/frame/contents/contentsHeader.jsp"%>
		<%@include file="/WEB-INF/views/frame/contents/nav.jsp"%>
		<!-- demo content -->
		<div class="wrapper">
			<!-- container -->
			<div>
				<!-- 요청서 -->
				<div id="request">요청서</div>
				<!-- 견적서 -->
				<div id="estimate">
					<form method="post" enctype="multipart/form-data"
						onsubmit="return false">
						
						<h3 style="color : black; text-align: center">견적서</h3> <input type="hidden" name="request_idx"> <input
							type="hidden" name="mento_idx">
							
							 금액<br> 
							 <div id="price" class="divbox">
							 <input type="text" name="est_price" id="est_price" style="width: 90%"><span id="won">원</span>
							 </div>
							 수업 상세 내용<br>
							 <div id="textarea" class="divbox">
						<textarea rows="7" cols="40" name="est_cont"></textarea>
						</div>
						
						<div id="file" class="divbox">
						파일 추가 
						<input type="file" name="est_file"> 
						<input type="submit" onclick="estimate()" value="전송">
						</div>
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

	function estimate() {
		var formData = new FormData();
		var file = $('#est_file')[0].files[0];
		formData.append('est_price', $('#est_price').val());
		formData.append('est_cont', $('#est_cont').val());

		if (file != null) {
			formData.append('est_file', file);
		}

		$.ajax({
			url : 'http://localhost:8080/toti/estimate',
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