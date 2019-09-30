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
letter-spacing: 1px;
}
.wrapper {
	width: 55%;
	margin: 20px auto;
}

#chatList{
margin: 70px 0;
}
#chat {
	margin: 5px auto;
	height: 70%;
}

img{
width: 100px;
border-radius: 50%;
}

table {
	width: 800px;
	height: 100%;
	float: left;
	text-align: left;
}
table tr:nth-child(1) td:nth-child(1){
width: 150px;
text-align: center;
}
.btn {
	display: none;
}
.text {
font-weight: 400;
font-size: 11px;
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
			<input type="hidden" name="mento_idx" id="mento_idx" value="3">
				<!-- 채팅리스트 -->
				<!-- <h3 style="margin-bottom: 30px;">채팅 목록</h3> -->
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
							html += '<label for="chatBtn" style="cursor:pointer"><div id="chat">';
							html += '<input type="hidden" name="mento_idx" value="'+data[i].est_idx+'">';
							html += '<table>';

							html += '<tr>';
							html += '<td rowspan="6" style="text-aline:center">';
							html += '<span id="photo">';
							html += '<img src = "<c:url value="/img/user/'+data[i].m_photo+'"/>"';
							html += '</span>';
							html += '</td>';
							html += '</tr>';

							html += '<tr>';
							html += '<td>';
							html += '<h3>'+data[i].m_name + '<span style="font-weight:400; font-size:11px; margin-left:7px;">' + data[i].service_name+'</span>';
							html += '<span style="font-weight:400; font-size:11px; margin-left:7px;">('+data[i].cate_name+')</span></h3></td>';
							html += '</tr>';
							
							/* html += '<tr>';
							html += '<td>';
							html += data[i].service_name+ '</td>';
							html += '</tr>'; */
							
							
							
							html += '<tr>';
							html += '<td>';
							html += '<h5 style="font-size:14px;">'+data[i].last_msg+'<h5></td>';
							html += '</tr>';
							
							html += '<tr>';
							html += '<td><span style="color:#a0a0a0; padding:3px; width:16px; "> 요청 사항 </span><span class="text">' + data[i].answer_cont+'</span>';
							html += '</td>';
							html += '</tr>';
							
							html += '<tr>';
							html += '<td><span style="color:#a0a0a0; padding:3px; width:16px; ">예상 수업 비용 </span><span class="text"> ' + data[i].est_price + '원</span>';
							html += '<button id="chatBtn' + data[i].est_idx
									+ '" class="btn" onclick="selectChat('
									+ data[i].est_idx
									+ ')">채팅하러 가기</button>';
							html += '</td>';
							html += '</tr>';
							html += '</table>';

							//html += '<a href="http://localhost:8080/toti/mentorpage/'+data[i].mento_idx+'">고수 페이지</a>';
							html += '</div></label>';
							html += '<hr>';
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