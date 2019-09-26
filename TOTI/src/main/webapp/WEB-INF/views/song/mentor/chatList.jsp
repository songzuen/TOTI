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
h1,h2,h3,h4,h5,h6{
color:black;
}
.wrapper {
	width: 55%;
	margin: 20px auto;
}
#chat {
	margin: 5px auto;
	height: 70%;
}

table {
	width: 70%;
	height: 100%;
	float: left;
	text-align: left;
	margin: 10px auto;
}
table tr:nth-child(1) td{
width: 150px;
}

/* table td:nth-child(1){
width: 30%;
} */

#photo {
	width: 120px;
	height: 120px;
	border-radius: 50%;
}

.btn {
	display: block;
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
			
			<!-- 로그인 세션값으로 변경 -->
			<input type="hidden" name="mento_idx" id="mento_idx" value="2">
				<!-- 채팅리스트 -->
				<h3>채팅 목록</h3>
				<hr>
				<div id="chatList">
					
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
	list($('#mento_idx').val());
	});
	
	function list(mento_idx) {
		$.ajax({
					url : 'http://localhost:8080/toti/mentor/chattingList/'+mento_idx,
					type : 'GET',
					success : function(data) {
						var html = '';
						for (var i = 0; i < data.length; i++) {
							html += '<div id="chat">';
							html += '<input type="hidden" name="mento_idx" value="'+data[i].est_idx+'">';
							html += '<table>';

							html += '<tr>';
							html += '<td rowspan="3" style="text-aline:center">';
							html += '<span id="photo">';
							html += data[i].m_photo + '<br>';
							html += '</span>';
							html += '</td>';
							html += '</tr>';

							html += '<tr>';
							html += '<td>';
							html += data[i].m_name + '(' + data[i].cate_name
									+ ')</td>';
							html += '</td>';
							html += '<td>';
							html += '신청 서비스 : ' + data[i].service_name+ ' / ';
							html += '요청사항 : ' + data[i].answer_cont+ '<br>';
							html += '</td>';
							html += '</tr>';
							
							html += '<tr>';
							html += '<td>';
							html += '<label for="chatBtn" style="cursor:pointer"><span class="comment"><h5 style="color:black;letter-spacing:3px;"> 채팅 내용 블라블라';
							html += '<h5></span></label></td>';
								html += '<td><span style="color:black;">예상 수업 금액 : ' + data[i].est_price + '원</span>';
							html += '<button id="chatBtn' + data[i].est_idx
									+ '" class="btn" onclick="selectChat('
									+ data[i].est_idx
									+ ')">채팅하러 가기</button>';
							html += '</td>';
							html += '</tr>';
							html += '</table>';

							//html += '<a href="http://localhost:8080/toti/mentorpage/'+data[i].mento_idx+'">고수 페이지</a>';
							html += '</div>';
						}
						$('#chatList').html(html);
					}
				});
	}
	
	function selectChat(est_idx){
		location.href='#';
	}
	
</script>
</html>