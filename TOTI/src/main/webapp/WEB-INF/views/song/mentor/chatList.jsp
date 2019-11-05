<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- <% int idx = (int)session.getAttribute("idx"); %> --%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/frame/header.jsp"%>

<!-- title -->
<title>SamplePage</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
* {
	margin: 0;
	padding: 0
}

body {
	
	overflow: auto;
}

h1,h2,h3,h4,h5,h6{
color:black;
letter-spacing: 1px;
}

#chatList{
width: 70%;
margin: 0 auto;
}
#chat {
	margin: 5px auto;
	height: 70%;
}

#m_photo{
width: 100px;
height: 100px;
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
#searchBtn {
border: 0px;
}
</style>
</head>
<body>
		<%@include file="/WEB-INF/views/frame/nav.jsp"%>
<!--/#header-->
		<section id="page-breadcrumb">
			<div class="vertical-center sun">
				<div class="container">
					<div class="row">
						<div class="action">
							<div class="col-sm-12">
								<h1 class="title">채팅</h1>
								<p>견적서를 보낸 고객과 채팅을 시작해보세요!</p>
								<hr>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!--/#home-slider-->		
		<!-- demo content -->
		<section id="blog" class="padding-bottom">
			<div class="container">
				<div class="row">
					<div class="col-md">
					
					<input type="hidden" name="mento_idx" id="mento_idx" value="${idx}">
					<div id="chatList"></div>
					<!-- end home variation -->
					<!-- end component -->
				</div>
				<!-- end container -->

			</div>
			</div>
			</section>
			<!-- end demo content -->
			<!-- footer -->
		<%@include file="/WEB-INF/views/frame/footer.jsp"%>
</body>

<script>
	$(document).ready(function() {
	list($('#mento_idx').val());
	});
	
	function list(mento_idx) {
		$.ajax({
					url : '/toti/mentor/chattingList/'+mento_idx,
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
							html += '<img id="m_photo" src = "<c:url value="/uploadfile/'+data[i].m_photo+'"/>"';
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

							//html += '<a href="/toti/mentorpage/'+data[i].mento_idx+'">고수 페이지</a>';
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