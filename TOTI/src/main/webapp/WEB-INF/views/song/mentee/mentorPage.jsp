<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	min-width: 700px;
	overflow: auto;
}

.wrapper {
	width: 60%;
	margin: 20px auto;
	padding-left: 10px;
}
h2,h3, h4, h5, h6 {
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
	margin: 20px;
}

.info div{
padding: 5px 0;
font-size: 12px;
}
#m_photo {
width: 100px;
border-radius : 50%;
}

#img{
float:left;
margin-right: 20px;
}
table {
	width: 100%;
}

table tr:nth-child(1) td:nth-child(1) {
	width: 50px;
}

#reviewTable{
margin-top: 20px;
margin-left: 25px;
}

.rBox {
	border: 1px solid #ddd;
	border-radius: 3px;
	text-align: center;
	padding: 15px;
	margin: 5px;
	position: absolute;
	font-size: 14px;
}

#star{
width: 15px;
}

#revBtn{
width: 70%;
font-size: 13px;
margin-top: 6px;
}
</style>
</head>
<body>
	<!-- page container -->
	<div>
		<%@include file="/WEB-INF/views/frame/nav.jsp"%>
		
		 <!--/#header-->
    <section id="page-breadcrumb">
        <div class="vertical-center sun">
             <div class="container">
                <div class="row">
                    <div class="action">
                        <div class="col-sm-12">
                            <h1 class="title">멘토 정보</h1>
                            <p>멘토가 제공하는 서비스 및 정보 </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/#action-->
		<!-- demo content -->
		<div class="wrapper">
			<!-- container -->
			<div>
				<input type="hidden" id="mento_idx" value="${mento_idx}">
				<!-- 고수 마이페이지 -->
				<div id="mentorPage"></div>


				<div class="buttonWrapper">
				
					<div id="reviewBtnBox" class="rBox"></div>
				</div>
				<!-- end home variation -->
				<!-- end component -->
			</div>
			<!-- end container -->
		</div>
		<!-- end demo content -->
		<!-- footer -->
		<%@include file="/WEB-INF/views/frame/footer.jsp"%>
	</div>
</body>

<script>
	$(document).ready(function() {
	mentorPage($('#mento_idx').val());
	});
	
	function mentorPage(mento_idx){

		var fullStar = '<span><img id=\"star\" src=\"https://d1hhkexwnh74v.cloudfront.net/icons/icon-common-review-star-small-full.svg\"></span>';
		var halfStar = '<span><img id=\"star\" src=\"https://d1hhkexwnh74v.cloudfront.net/icons/icon-common-review-star-small-half.svg\"></span>';
		
		$.ajax({
			url : 'http://localhost:8080/toti/mentorpage/'+mento_idx,
			type : 'GET',
			success : function(data){
				var html = '';
				var reqBtn ='';
				var revBtn = '';
				for(var i = 0; i<data.length; i++){
						
						/*고수 프로필*/
						html+='<div class="info"><span id="img"><img id="m_photo" src = "<c:url value="/images/user/'+data[i].m_photo+'"/>"><span></div>';
						
						html+='<div class="info" style="height:100px; padding:30px 10px;"><b><h2>'+data[i].m_name+'</h2></b><span style="color:black; font-size:9px;">';
						
						if (data[i].str != 0) {
							if(data[i].str == 5){
								for(var j=0; j< 5; j++){
									$('#starBox2').append(html+=fullStar);
									
								}
							}
							else if(data[i].str > 4 && data[i].str < 5){
								for(var j=0;j<4;j++){
									$('#starBox2').append(html+=fullStar);
								}
								$('#starBox2').append(html+=halfStar);
								
							}else if(data[i].str == 4){
								for(var j=0;j<4;j++){
									$('#starBox2').append(html+=fullStar);
								}
							}
							else if(data[i].str > 3 && data[i].str <4){
								for(var j=0;j<3;j++){
									$('#starBox2').append(html+=fullStar);
								}
								$('#starBox2').append(html+=halfStar);
							}
							else if(data[i].str == 3){
								for(var j=0;j<3;j++){
									$('#starBox2').append(html+=fullStar);
								}
							}
							else if(data[i].str > 2 && data[i].str < 3){
								for(var j=0;j<2;j++){
									$('#starBox2').append(html+=fullStar);
								}
								$('#starBox2').append(html+=halfStar);
							}
							else if(data[i].str == 2){
								for(var j=0;j<2;j++){
									$('#starBox2').append(html+=fullStar);
								}
							}
							else if(data[i].str > 1&& data[i].str <2){
								for(var j=0;j<2;j++){
									$('#starBox2').append(html+=fullStar);
								}
								$('#starBox2').append(html+=halfStar);
							}
							else if(data[i].str ==1){
								$('#starBox2').append(html+=fullStar);
							}
							else {
								$('#starBox2').append(html+=halfStar);
							}
							html += '<span style="margin-left:15px; font-size:14px;"><b>'+data[i].str +'</b></span>';
							html += '<span style="margin-left:15px; font-size:14px;">('+data[i].cont_cnt +'개)</span>';
							}
						html += '</div>';
						html+= '<hr>';
						/* 대표 서비스 */
						html+='<div class="info">';
						html+='<h3>대표 서비스</h3><div>';
						html+= data[i].cate_name;
						html+='</div></div>';

						/* 고수 한 줄 소개 */
						html+='<div class="info">';
						html+='<h3>한줄 소개</h3><div>'+data[i].p_shot+'<br>';
						html+='</div></div>';
						
						/* 제공 서비스 */
						
						if(data[i].tor_sname != null){
							html+= '<div class="info">';
							html+= '<h3>제공 서비스</h3><div>';
							html+= data[i].tor_sname+'</div></div>';
						}
						
						/* 활동 지역 */
						if(data[i].tor_location != null){
							html+= '<div class="info">';
							html+= '<h3>위치</h3><div>';
							html+= data[i].tor_location+'</div></div>';
						}
						
						/* 고수 학력 */
						if(data[i].p_edu != null){
							html+= '<div class="info">';
							html+= '<h3>학력</h3><div>';
							html+= data[i].p_edu+'</div></div>';
						}
						
						/* 고수 경력 */
						if(data[i].p_career != null){
							html+= '<div class="info">';
							html+= '<h3>경력사항</h3><div>';
							html+= data[i].p_career+'</div></div>';
						}

						
					/* 고수 상세 설명 */
					
						if(data[i].p_long != null){
							html+= '<div class="info">';
							html+= '<h3>상세 설명</h3><div>';
							html+= data[i].p_long+'</div></div>';
						}
					/* 리뷰 박스 */
					html+='<div id="reviewBox" class="info">';
						html+='<h3>';
						html+='리뷰';
						if(data[i].str == 0){
							html+='</h3>리뷰 없음';
						}
						
						else{
					 	html+='<span id="starBox3" style="width:20px;font-size:12px; padding-left: 10px;">';
						if(data[i].str == 5){
							for(var j=0; j< 5; j++){
								$('#starBox3').append(html+=fullStar);
								
							}
						}
						else if(data[i].str > 4 && data[i].str < 5){
							for(var j=0;j<4;j++){
								$('#starBox3').append(html+=fullStar);
							}
							$('#starBox3').append(html+=halfStar);
							
						}else if(data[i].str == 4){
							for(var j=0;j<4;j++){
								$('#starBox3').append(html+=fullStar);
							}
						}
						else if(data[i].str > 3 && data[i].str <4){
							for(var j=0;j<3;j++){
								$('#starBox3').append(html+=fullStar);
							}
							$('#starBox3').append(html+=halfStar);
						}
						else if(data[i].str == 3){
							for(var j=0;j<3;j++){
								$('#starBox3').append(html+=fullStar);
							}
						}
						else if(data[i].str > 2 && data[i].str < 3){
							for(var j=0;j<2;j++){
								$('#starBox3').append(html+=fullStar);
							}
							$('#starBox3').append(html+=halfStar);
						}
						else if(data[i].str == 2){
							for(var j=0;j<2;j++){
								$('#starBox3').append(html+=fullStar);
							}
						}
						else if(data[i].str > 1&& data[i].str <2){
							for(var j=0;j<2;j++){
								$('#starBox3').append(html+=fullStar);
							}
							$('#starBox3').append(html+=halfStar);
						}
						else if(data[i].str ==1){
							$('#starBox3').append(html+=fullStar);
						}
						else {
							$('#starBox3').append(html+=halfStar);
						}
						html += '<span style="margin-left:15px; font-size:13px;"><b>'+data[i].str +'</b></span>';
						html += '<span style="margin-left:15px; font-size:13px;">('+data[i].cont_cnt +'개)</span>';
						}
						html+='</h3>';
						break;
				}
				for(var i = 0; i<data.length;i++){
					var date = new Date(data[i].review_date);
					var year = date.getFullYear();
					var month = date.getMonth();
					var day = date.getDate();
					if(data[i].str != 0){
						html+='<div id="reviewTable">';
						html+='<table>';
						html+='<tr>';
						html+='	<td id="review_name" style="font-weight:600;">';
						html+=data[i].member_name;

						html+='</td>';
						html+='<td style="width:100px;"><div id=rev_star>';

						if (data[i].review_star != 0) {
							if(data[i].review_star == 5){
								for(var j=0; j< 5; j++){
									$('#rev_star').append(html+=fullStar);
									
								}
							}
							else if(data[i].review_star > 4 && data[i].review_star < 5){
								for(var j=0;j<4;j++){
									$('#rev_star').append(html+=fullStar);
								}
								$('#rev_star').append(html+=halfStar);
								
							}else if(data[i].review_star == 4){
								for(var j=0;j<4;j++){
									$('#rev_star').append(html+=fullStar);
								}
							}
							else if(data[i].review_star > 3 && data[i].review_star <4){
								for(var j=0;j<3;j++){
									$('#rev_star').append(html+=fullStar);
								}
								$('#rev_star').append(html+=halfStar);
							}
							else if(data[i].review_star == 3){
								for(var j=0;j<3;j++){
									$('#rev_star').append(html+=fullStar);
								}
							}
							else if(data[i].review_star > 2 && data[i].review_star < 3){
								for(var j=0;j<2;j++){
									$('#rev_star').append(html+=fullStar);
								}
								$('#rev_star').append(html+=halfStar);
							}
							else if(data[i].review_star == 2){
								for(var j=0;j<2;j++){
									$('#rev_star').append(html+=fullStar);
								}
							}
							else if(data[i].review_star > 1&& data[i].review_star <2){
								for(var j=0;j<2;j++){
									$('#rev_star').append(html+=fullStar);
								}
								$('#rev_star').append(html+=halfStar);
							}
							else if(data[i].review_star ==1){
								$('#rev_star').append(html+=fullStar);
							}
							else {
								$('#rev_star').append(html+=halfStar);
							}
							}
						html += '<span style="margin-left:15px; font-size:12px; font-weight:600;">'+data[i].review_star+'</span></div></td>';
							html+='<td style="color:#acacac; padding-left:15px;">'+year+'.'+month+'.'+day+'</td>';

							html+='</tr>';
							html+='<tr>';
							html+='<td colspan="3">'+data[i].review_cont+'</td>';
							html+='</tr>';
							html+='</table>';
							html+='</div>';
					}
							
				}
				html+='</div>';
				$('#mentorPage').html(html);
				
				/* for(var i=0; i<data.length; i++){
				reqBtn += data[i].m_name+' 멘토님에게 <br> 원하는 서비스의 견적을 받아보세요<br>';
				reqBtn +='<button type="button" id="subBtn" class="btn btn-primary">견적 요청하기</button>';
				break;
				}
				$('#requestBtnBox').html(reqBtn); */
				
				for(var i = 0; i<data.length;i++){
				revBtn += data[i].m_name+' 멘토님의 수업이 어떠셨나요?<br>';
				revBtn += data[i].m_name+' 멘토님에 관한 후기를 남겨주세요<br>';
				revBtn +='<button type="button" id="revBtn" class="btn btn-primary">리뷰 작성하기</button>';
				break;
				}
				$('#reviewBtnBox').html(revBtn);
			}
			
		});
		
	}
</script>
</html>