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
					html += '<div class="info" >';
					html += '<div>'+ data[i].m_photo + '</div>';
					html += '<div class="overview"> <ul> <li id="overview-li">';
					html += '<div>'+ data[i].review_avg +'.0 <br>리뷰 평점</div></li>';
					html += '<div>'+ data[i].review_cnt +'<br>리뷰수</div>';
					html +='</div>';
					html +='</div>';
							
					/* 이름 */
					html += '<div class="info" id="pname">';
					html += '<hr><h4>이름</h4>'+data[i].m_name +'<br>' 
							+ '<button onclick="nameInfo('+mento_idx+')">수정</button></div>';
					
					/* 이름 변경 */
					html += '<div id="editName" style="display : none">';
				    html += '<hr><input type="hidden" name="mento_idx" id="mento_idx">';
			    	html += '<h4>이름</h4> ';
		    		html += '<input type="text" name="m_name" id="m_name" value="'+data[i].m_name+'"required><br>';
	    			html += '<button onclick="editName('+mento_idx+')">수정완료</button>';
   					html += '</div>';
					
					/* 대표서비스 */
					html += '<hr><div class="info">';
					html += '<h4>대표 서비스</h4>' + data[i].cate_name ;
					html += '</div>';
					
					/* 한 줄 소개 */
					html += '<div class="info" id="pshot">';
					html += '<hr><h4>한줄 소개</h4>'; 
					if (data[i].p_shot !=null){
						html += data[i].p_shot + '<br>';	
					} else {
						html += '';
					}
					html += '<button onclick="shotInfo('+mento_idx+')">수정</button></div>';
							
					/* 한줄소개 변경  */
					html += '<div id="editShot" style="display : none">';
				    html += '<hr><input type="hidden" name="mento_idx" id="mento_idx">';
			    	html += '<h4>한 줄 소개</h4> ';
		    		html += '<input type="text" name="p_shot" id="p_shot" value="';
		    		if (data[i].p_shot !=null){
						html += data[i].p_shot ;	
					} else {
						html += '';
					}
		    		html += '"required><br>';
	    			html += '<button onclick="editShot('+mento_idx+')">수정완료</button>';
    				html += '</div>';
					
					/* 제공 서비스 */
					html += '<hr><div class="info" id="pservice">';
					html += '<h4>제공 서비스</h4>';
					if (data[i].mento_service != null) {
						html += '<div class="info">';
						html += data[i].mento_service + '</div>';
					} else {
						html += '<div class="info">';
						html += '서비스를 추가해주세요</div>';
					}
					html += '<button>수정</button></div>';
					
					/* 활동 지역 */
						html += '<hr><div class="info" id="plocation">';
						html += '<h4>위치</h4>';
						html += data[i].tor_location + '<br><button>수정</button></div>';

					/* 결제 수단 */
						html += '<hr><div class="info" id="ppay">';
						html += '<h4>결제 수단</h4>';
						if (data[i].p_pay !=null){
							html += data[i].p_pay + '<br>';	
						} else {
							html += '';
						}
						html += '<button onclick="payInfo('+mento_idx+')">수정</button></div>';
						
					/* 학력 */
						html += '<div class="info" id="pedu">';
						html += '<hr><h4>학력</h4>';
						if (data[i].p_edu !=null){
							html += data[i].p_edu + '<br>';	
						} else {
							html += '';
						}
						html += '<button onclick="eduInfo('+mento_idx+')">수정</button></div>';
						
					/* 학력 변경  */
					html += '<div id="editEdu" style="display : none">';
				    html += '<hr><input type="hidden" name="mento_idx" id="mento_idx">';
			    	html += '<h4>학력</h4> ';
		    		html += '<input type="text" name="p_edu" id="p_edu" value="';
		    		if (data[i].p_edu !=null){
						html += data[i].p_edu;	
					} else {
						html += '';
					}
		    		html += '"required><br>';
	    			html += '<button onclick="editEdu('+mento_idx+')">수정완료</button>';
    				html += '</div>';

					/* 경력 */
						html += '<div class="info" id="pcareer">';
						html += '<hr><h4>경력사항</h4>';
						if (data[i].p_career !=null){
							html += data[i].p_career + '<br>';	
						} else {
							html += '' ;
						}
						html += '<button onclick="careerInfo('+mento_idx+')">수정</button></div>';
					
					/* 경력 변경  */
					html += '<div id="editCareer" style="display : none">';
				    html += '<input type="hidden" name="mento_idx" id="mento_idx">';
			    	html += '<hr><h4>경력사항</h4> ';
		    		html += '<input type="text" name="p_career" id="p_career" value="';
		    		if (data[i].p_career !=null){
						html += data[i].p_career;	
					} else {
						html += '';
					}
		    		html += '"required><br>';
	    			html += '<button onclick="editCareer('+mento_idx+')">수정완료</button>';
    				html += '</div>';
						
					/* 고수 상세 설명 */
					html += '<div class="info" id="plong">';
					html += '<hr><h4>서비스 상세 설명</h4>';
					if (data[i].p_long !=null){
						html += data[i].p_long + '<br>';	
					} else {
						html += '';
					}
					html += '<button onclick="longInfo('+mento_idx+')">수정</button></div>';
					
					/* 상세소개 변경  */
					html += '<div id="editLong" style="display : none">';
				    html += '<input type="hidden" name="mento_idx" id="mento_idx">';
			    	html += '<hr><h4>상세 설명</h4> ';
		    		html += '<input type="text" name="p_long" id="p_long" value="';
		    		if (data[i].p_long !=null){
						html += data[i].p_long;	
					} else {
						html += '';
					}
		    		html += '"required><br>';
	    			html += '<button onclick="editLong('+mento_idx+')">수정완료</button>';
    				html += '</div>';
   					
   					
					/* 리뷰  */
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
	
	/* 고수 이름 */
	function nameInfo(mento_idx){
		$('#pname').css('display', 'none');
		$('#editName').css('display', 'block');
		$.ajax({
			url : 'http://localhost:8080/toti/mento/' + mento_idx,
			type : 'GET',
			success : function(data) {
				$('#mento_idx').val(mento_idx);
                $('#m_name').val(data[i].m_name);
			}

		});
	}
	
	function editName(mento_idx){

		$.ajax({
			url :'http://localhost:8080/toti/mento/editname/' + mento_idx,
		    dataType: 'text',
	        type: 'PUT',	
	        contentType:'application/json;chartset=utf-8',
	        data: JSON.stringify({
	        	mento_idx:$('#mento_idx').val(),
				m_name:$('#m_name').val()
			}),
			success : function(data){
				location.reload();
			}
		});
		
    }
	
	/* 고수 한줄 소개 */
	function shotInfo(mento_idx){
		$('#pshot').css('display', 'none');
		$('#editShot').css('display', 'block');
		$.ajax({
			url : 'http://localhost:8080/toti/mento/' + mento_idx,
			type : 'GET',
			success : function(data) {
				$('#mento_idx').val(mento_idx);
                $('#p_shot').val(data[i].p_shot);
			}

		});
	}
	
	function editShot(mento_idx){
		
		$.ajax({
			url :'http://localhost:8080/toti/mento/editshot/' + mento_idx,
		    dataType: 'text',
	        type: 'PUT',	
	        contentType:'application/json;chartset=utf-8',
	        data: JSON.stringify({
	        	mento_idx:$('#mento_idx').val(),
	        	p_shot:$('#p_shot').val()
			}),
			success : function(data){
				location.reload();
			}
		});
		
    }
	
	/* 제공 서비스 */
	
	/* 위치 */
	
	/* 결제 수단 */
	
	/* 학력 */
	function eduInfo(mento_idx){
		$('#pedu').css('display', 'none');
		$('#editEdu').css('display', 'block');		
		$.ajax({
			url : 'http://localhost:8080/toti/mento/' + mento_idx,
			type : 'GET',
			success : function(data) {
				$('#mento_idx').val(mento_idx);
                $('#p_edu').val(data[i].p_edu);
			}

		});
	}
	
	function editEdu(mento_idx){
		
		$.ajax({
			url :'http://localhost:8080/toti/mento/editedu/' + mento_idx,
		    dataType: 'text',
	        type: 'PUT',	
	        contentType:'application/json;chartset=utf-8',
	        data: JSON.stringify({
	        	mento_idx:$('#mento_idx').val(),
	        	p_edu:$('#p_edu').val()
			}),
			success : function(data){
				location.reload();
			}
		});
		
    }
	
	/* 경력 */
	function careerInfo(mento_idx){
		$('#pcareer').css('display', 'none');
		$('#editCareer').css('display', 'block');
		$.ajax({
			url : 'http://localhost:8080/toti/mento/' + mento_idx,
			type : 'GET',
			success : function(data) {
				$('#mento_idx').val(mento_idx);
                $('#p_career').val(data[i].p_career);
			}

		});
	}
	
	function editCareer(mento_idx){
		
		$.ajax({
			url :'http://localhost:8080/toti/mento/editcareer/' + mento_idx,
		    dataType: 'text',
	        type: 'PUT',	
	        contentType:'application/json;chartset=utf-8',
	        data: JSON.stringify({
	        	mento_idx:$('#mento_idx').val(),
	        	p_career:$('#p_career').val()
			}),
			success : function(data){
				location.reload();
			}
		});
		
    }
	
	/* 상세 소개 */
	function longInfo(mento_idx){
		$('#plong').css('display', 'none');
		$('#editLong').css('display', 'block');
		$.ajax({
			url : 'http://localhost:8080/toti/mento/' + mento_idx,
			type : 'GET',
			success : function(data) {
				$('#mento_idx').val(mento_idx);
                $('#p_long').val(data[i].p_long);
			}

		});
	}
	
	function editLong(mento_idx){
		
		$.ajax({
			url :'http://localhost:8080/toti/mento/editlong/' + mento_idx,
		    dataType: 'text',
	        type: 'PUT',	
	        contentType:'application/json;chartset=utf-8',
	        data: JSON.stringify({
	        	mento_idx:$('#mento_idx').val(),
	        	p_long:$('#p_long').val()
			}),
			success : function(data){
				location.reload();
			}
		});
		
    }
</script>
</body>
</html>