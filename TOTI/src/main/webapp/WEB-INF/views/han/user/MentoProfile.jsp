<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/frame/contents/header.jsp"%>
<!-- title -->
<title>TOTI :: 프로필 관리</title>
<style>
	ul li {
		list-style: none;
        float: left;
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
			<div  class="container" style="margin-top: -50px">
				<input type="hidden" id="mento_idx" value="${mento_idx}">
				<div id="mentorProfile">
					<div ></div>
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


<script>
	$(document).ready(function() {
		mentorProfile($('#mento_idx').val());
	});

	function mentorProfile(mento_idx) {
		$.ajax({
			url : 'http://localhost:8080/toti/mento/' + mento_idx,
			type : 'GET',
			success : function(data) {
				var html = '';
				for (var i = 0; i < data.length; i++) {

					/*간략한 고수정보*/
					html += '<div class="info">';
					html += '<div>'+ data[i].m_photo + '</div>';
					html += '<div class="overview"> <ul> <li id="overview-li">';
					html += '<div>'+ data[i].review_avg +'.0 <br>리뷰 평점</div></li>';
					html += '<div>'+ data[i].review_cnt +'<br>리뷰수</div>';
					html += '';
					
					html +='</div>';
					html +='</div>';
							
							
					/* 이름 */
					html += '<hr><div class="info">';
					html += '<h4>이름</h4>';
					html += data[i].m_name +'<button>수정</button></div>';
					
					/* 대표서비스 */
					html += '<hr><div class="info">';
					html += '<h4>대표 서비스</h4>' + data[i].cate_name ;
					html += '</div>';
					
					/* 한 줄 소개 */
					html += '<hr><div class="info">';
					html += '<h4>한줄 소개</h4>' + data[i].p_shot ;
					html += '<button>수정</button></div>';

					/* 제공 서비스 */
					html += '<hr><div class="info">';
					html += '<h4>제공 서비스</h4>';
					if (data[i].mento_service != null) {
						html += '<div class="info">';
						html += data[i].mento_service + '</div>';
					} else {
						html += '<div class="info">';
						html += '<h4>서비스를 추가해주세요</h4></div>';
					}
					html += '<button>수정</button></div>';
					
					/* 활동 지역 */
						html += '<hr><div class="info">';
						html += '<h4>위치</h4>';
						html += data[i].tor_location + '<button>수정</button></div>';

					/* 결제 수단 */
						html += '<hr><div class="info">';
						html += '<h4>결제 수단</h4>';
						html += data[i].p_pay + '<button>수정</button></div>';
						
					/* 학력 */
						html += '<hr><div class="info">';
						html += '<h4>학력</h4>';
						html += data[i].p_edu + '<button>수정</button></div>';

					/* 경력 */
						html += '<hr><div class="info">';
						html += '<h4>경력사항</h4>';
						html += data[i].p_career + '<button>수정</button></div>';
					
					/* 고수 상세 설명 */
					html += '<hr><div class="info">';

					html += '<h4>서비스 상세 설명</h4>' + data[i].p_long;
					html += '<button>수정</button></div>';

					/* 리뷰 박스 */
					html += '<hr><div id="reviewBox" class="info">';
					html += '<h4>';
					html += '리뷰<span style="font-size: 10px; letter-spacing: 1px;">'
							+ data[i].review_cnt
							+ '개(평균 '
							+ data[i].review_avg
							+ '점)</span>';
					html += '</h4>';
					break;
					}
					for (var i = 0; i < data.length; i++) {
						var date = new Date(data[i].review_date);
						var year = date.getFullYear();
						var month = date.getMonth();
						var day = date.getDate();
						html += '<table>';
						html += '<tr>';
						html += '	<td><h5 id="review_name">';
						html += data[i].member_name;
						html += '</h5></td>';
						html += '<td>' + data[i].review_star + '점</td>';
						html += '<td>' + year + '-' + month + '-' + day
								+ '</td>';
						html += '</tr>';
						html += '<tr>';
						html += '<td colspan="3">' + data[i].cont
								+ '</td>';
						html += '</tr>';
						html += '</table>';
	
					}
					html += '</div>';
					$('#mentorProfile').html(html);
	
				}
	
			});
	
		}
</script>
</body>
</html>