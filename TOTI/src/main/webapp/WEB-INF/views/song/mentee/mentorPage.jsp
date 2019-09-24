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
				<input type="hidden" id="mento_idx" value="${mento_idx}">
				<!-- 고수 마이페이지 -->
				<div id="mentorPage">
					
				</div>


				<div class="buttonWrapper">
					<div id="requestBtnBox" class="rBox">
						<%-- <c:forEach items="${viewData}" begin="0" end="0" var="mentorInfo"
							varStatus="stat">
							${mentorInfo.m_name} 멘토님에게 <br> 원하는 서비스의 견적을 받아보세요
						</c:forEach> 
						<br>
						<button type="button" id="subBtn" class="btn btn-primary">견적
							요청하기</button> --%>
					</div>

					<div id="reviewBtnBox" class="rBox">
						<%-- <c:forEach items="${viewData}" begin="0" end="0" var="mentorInfo"
							varStatus="stat">
						${mentorInfo.m_name} 멘토님의 수업이 어떠셨나요?<br>
						${mentorInfo.m_name} 멘토님에 관한 후기를 남겨주세요
						</c:forEach>
						<br>
						<button type="button" id="subBtn" class="btn btn-primary">리뷰
							작성하기</button> --%>
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
	mentorPage($('#mento_idx').val());
	});
	
	function mentorPage(mento_idx){
		$.ajax({
			url : 'http://localhost:8080/toti/mentorpage/'+mento_idx,
			type : 'GET',
			success : function(data){
				var html = '';
				var reqBtn ='';
				var revBtn = '';
				for(var i = 0; i<data.length; i++){
						
						/*고수 프로필 사진*/
						html+='<div class="info">'+data[0].m_photo+'</div>';

						/* 고수 이름 */
						html+='<div class="info">';
						html+='<b><h4>'+data[0].m_name+'</h4></b>';
						html+='</div>';

						/* 고수 한 줄 소개 */
						html+='<div class="info">';
						html+='<h4>한줄 소개</h4>'+data[0].p_shot+'<br>';
						html+='</div>';
						
						/* 활동 지역 */
						if(data[0].tor_location != null){
							html+= '<div class="info">';
							html+= '<h4>위치</h4>';
							html+= data[0].tor_location+'</div>';
						}
						
						/* 고수 학력 */
						if(data[0].p_edu != null){
							html+= '<div class="info">';
							html+= '<h4>학력</h4>';
							html+= data[0].p_edu+'</div>';
						}
						
						/* 고수 경력 */
						if(data[0].p_career != null){
							html+= '<div class="info">';
							html+= '<h4>경력사항</h4>';
							html+= data[0].p_career+'</div>';
						}

						/* 제공 분야 */
						html+='<div class="info">';
						html+='<h4>분야</h4>'+data[0].cate_name;
						html+='</div>';


						/* 제공 서비스 */
						html+='<div class="info">';
						html+='<h4>제공 서비스</h4>';
						html+='</div>';
						if(data[0].tor_sname != null){
							html+= '<div class="info">';
							html+= '<h4>제공 서비스</h4>';
							html+= data[0].tor_sname+'</div>';
						}
						else {
							html+= '<div class="info">';
							html+= '<h4>제공 서비스 없음</h4></div>';
						}
						
					/* 고수 상세 설명 */
					html+='<div class="info">';
						
						html+='<h4>서비스 상세 설명</h4>'+data[0].p_long+'<br>';
						html+='</div>';
					
					/* 리뷰 박스 */
					html+='<div id="reviewBox" class="info">';
						html+='<h4>';
						html+='리뷰<span style="font-size: 10px; letter-spacing: 1px;">'+data[0].cont_cnt+'개('+data[0].str+'점)</span>';
						html+='</h4>';
						break;
				}
				for(var i = 0; i<data.length;i++){
					var date = new Date(data[i].review_date);
					var year = date.getFullYear();
					var month = date.getMonth();
					var day = date.getDate();
						html+='<table>';
						html+='<tr>';
						html+='	<td><h5 id="review_name">';
						html+=data[i].member_name;

						html+='</h5></td>';
						html+='<td>'+data[i].review_star+'</td>';
							html+='<td>'+year+'-'+month+'-'+day+'</td>';

							html+='</tr>';
							html+='<tr>';
							html+='<td colspan="3">'+data[i].review_cont+'</td>';
							html+='</tr>';
							html+='</table>';
							
				}
				html+='</div>';
				$('#mentorPage').html(html);
				
				for(var i=0; i<data.length; i++){
				reqBtn += data[0].m_name+' 멘토님에게 <br> 원하는 서비스의 견적을 받아보세요<br>';
				reqBtn +='<button type="button" id="subBtn" class="btn btn-primary">견적 요청하기</button>';
				break;
				}
				$('#requestBtnBox').html(reqBtn);
				
				for(var i = 0; i<data.length;i++){
				revBtn += data[0].m_name+' 멘토님의 수업이 어떠셨나요?<br>';
				revBtn += data[0].m_name+' 멘토님에 관한 후기를 남겨주세요<br>';
				revBtn +='<button type="button" id="subBtn" class="btn btn-primary">리뷰 작성하기</button>';
				break;
				}
				$('#reviewBtnBox').html(revBtn);
			}
			
		});
		
	}
</script>
</html>