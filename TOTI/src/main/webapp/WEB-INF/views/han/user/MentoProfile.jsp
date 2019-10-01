<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<%@include file="/WEB-INF/views/frame/contents/header.jsp"%>
<!-- title -->
<title>TOTI :: 프로필 관리</title>
<style>
	ul li {
		list-style: none;
        float: left;
	}
	
	table {
		width: 100%;
	}
	
		
	#mentorProfile {
		width: 900px;
		margin: auto;
	}
	
	.btn-edit{
		width: 50px;
	}
	
	h4{
		font-weight: bold;
	}
	
	input[type=text]{
		width: 80%;
	}
	
	.img{
		width: 130px;
		float: left;
		border-radius: 10%;
	}
	
	.overview{
		height: 180px;
		margin-bottom: 0;
	}
	
	.overview span {
		margin:50px 0 0 0;
	}
</style>
</head>
<body>
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
					html += '<div class="info" id="overview">';
					html += '<img class="img" src="<c:url value="/img/'+data[i].m_photo+'" />">';
					html += '<div class="overview"> <ul> ';
					html += '<span><li class="overview-li">'+ data[i].review_avg +'.0 <br>리뷰 평점</span></li>';
					html += '<span><li class="overview-li">'+ data[i].review_cnt +'<br>리뷰수</span></li>';
					html +='</ul></div>';
					html +='</div>';
					
					/* 이름 */
					html += '<div class="info" id="pname">';
					html += '<hr>';
					html += '<table>';
					html += '<tr>';
					html += '<td><h4>이름</h4></td>';
					html += '<td class="btn-edit"><button class="btn btn-outline-danger" onclick="nameInfo('+mento_idx+')">수정</button></td>';
					html += '</tr>';
					html += '<tr>';
					html += '<td colspan="2">'+data[i].m_name+'</td>'
					html += '</tr>';
					html += '</table></div>'; 
					
					/* 이름 변경 */
   					html += '<div id="editName" style="display : none">';
					html += '<hr><input type="hidden" name="mento_idx" id="mento_idx">';
					html += '<table>';
					html += '<tr>';
					html += '<td><h4>이름</h4></td>';
					html += '<td class="btn-edit"><button class="btn btn-outline-primary" onclick="editName('+mento_idx+')">저장</button></td>';
					html += '</tr>';
					html += '<tr>';
					html += '<td colspan="2"><input type="text" name="m_name" id="m_name" value="'+data[i].m_name+'"required></td>'
					html += '</tr>';
					html += '</table></div>'; 
					
					/* 대표서비스 */
					html += '<div class="info">';
					html += '<hr>';
					html += '<table>';
					html += '<tr>';
					html += '<h4>대표 서비스</h4>';
					html += '</tr>';
					html += '<tr>';
					html += data[i].cate_name ;
					html += '</tr>';
					html += '</table></div>'; 
					
					/* 한 줄 소개 */					
					html += '<div class="info" id="pshot">';
					html += '<hr>';
					html += '<table>';
					html += '<tr>';
					html += '<td><h4>한줄 소개</h4></td>';
					html += '<td class="btn-edit"><button class="btn btn-outline-danger" onclick="shotInfo('+mento_idx+')">수정</button></td>';
					html += '</tr>';
					html += '<tr>';
					html += '<td colspan="2">';
					if (data[i].p_shot !=null){
						html += data[i].p_shot + '<br>';	
					} else {
						html += '';
					}
					html += '</td>'
					html += '</tr>';
					html += '</table></div>'; 
					
					/* 한줄소개 변경  */
					html += '<div id="editShot" style="display : none">';
					html += '<hr><input type="hidden" name="mento_idx" id="mento_idx">';
					html += '<table>';
					html += '<tr>';
					html += '<td><h4>한 줄 소개</h4></td>';
					html += '<td class="btn-edit"><button class="btn btn-outline-primary" onclick="editShot('+mento_idx+')">저장</button></td>';
					html += '</tr>';
					html += '<tr>';
					html += '<td colspan="2"><textarea rows=3 cols=80 name="p_shot" id="p_shot">';
					if (data[i].p_shot !=null){
						html += data[i].p_shot ;	
					} else {
						html += '';
					}
					html += '</textarea></td>'
					html += '</tr>';
					html += '</table></div>';
					
					/* 제공 서비스 */
					html += '<div class="info" id="pservice">';
					html += '<hr>';
					html += '<table>';
					html += '<tr>';
					html += '<td><h4>제공 서비스</h4></td>';
					html += '<td class="btn-edit"><button class="btn btn-outline-danger" onclick="getService2('+mento_idx+')">삭제</button></td>';
					html += '<td class="btn-edit"><button class="btn btn-outline-danger" onclick="getService('+mento_idx+')">추가</button></td>';
					html += '</tr>';
					html += '<tr>';
					html += '<td colspan="2">';
					if (data[i].mento_service != null) {
						html += '<div class="info">';
						html += data[i].mento_service + '</div>';
					} else {
						html += '<div class="info">';
						html += '서비스를 추가해주세요</div>';
					}
					html += '</td>'
					html += '</tr>';
					html += '</table></div>';
					html += '<div id="addServiceBox"></div>';
					html += '<div id="delServiceBox"></div>';
					
					/* 위치 */
					html += '<div class="info" id="plocation">';
					html += '<hr>';
					html += '<table>';
					html += '<tr>';
					html += '<td><h4>위치</h4></td>';
					html += '<td class="btn-edit"><button class="btn btn-outline-danger">수정</button></td>';
					html += '</tr>';
					html += '<tr>';
					html += '<td colspan="2">'+ data[i].tor_location + '<br>';
					html += '</td>'
					html += '</tr>';
					html += '</table></div>';

					/* 결제 수단 */
					html += '<div class="info" id="ppay">';
					html += '<hr>';
					html += '<table>';
					html += '<tr>';
					html += '<td><h4>결제 수단</h4></td>';
					html += '<td class="btn-edit"><button class="btn btn-outline-danger" onclick="payInfo('+mento_idx+')">수정</button></td>';
					html += '</tr>';
					html += '<tr>';
					html += '<td colspan="2">';
					if (data[i].p_shot !=null){
						html += data[i].p_pay + '<br>';	
					} else {
						html += '';
					}
					html += '</td>'
					html += '</tr>';
					html += '</table></div>'; 
					
					/* 결제수단 변경  */
    				html += '<div id="editPay" style="display : none">';
					html += '<hr><input type="hidden" name="mento_idx" id="mento_idx">';
					html += '<table>';
					html += '<tr>';
					html += '<td><h4>결제수단</h4></td>';
					html += '<td class="btn-edit"><button class="btn btn-outline-primary" onclick="editPay('+mento_idx+')">저장</button></td>';
					html += '</tr>';
					html += '<tr>';
					html += '<td colspan="2">';
					html += '<input type="radio" id="p_pay" name="p_pay" value="계좌이체">계좌이체<br>';
					html += '<input type="radio" id="p_pay" name="p_pay" value="무통장입금">무통장입금<br>';
					html += '<input type="radio" id="p_pay" name="p_pay" value="만나서 카드결제">만나서 카드결제<br>';
					html += '<input type="radio" id="p_pay" name="p_pay" value="만나서 현금결제">만나서 현금결제<br>';
					html += '</td>';
					html += '</tr>';
					html += '</table></div>';
    				
					/* 학력 */
					html += '<div class="info" id="pedu">';
					html += '<hr>';
					html += '<table>';
					html += '<tr>';
					html += '<td><h4>학력</h4></td>';
					html += '<td class="btn-edit"><button class="btn btn-outline-danger" onclick="eduInfo('+mento_idx+')">수정</button></td>';
					html += '</tr>';
					html += '<tr>';
					html += '<td colspan="2">';
					if (data[i].p_edu !=null){
						html += data[i].p_edu + '<br>';	
					} else {
						html += '';
					}
					html += '</td>'
					html += '</tr>';
					html += '</table></div>';
					
					/* 학력 변경  */
    				html += '<div id="editEdu" style="display : none">';
					html += '<hr><input type="hidden" name="mento_idx" id="mento_idx">';
					html += '<table>';
					html += '<tr>';
					html += '<td><h4>학력</h4></td>';
					html += '<td class="btn-edit"><button class="btn btn-outline-primary" onclick="editEdu('+mento_idx+')">저장</button></td>';
					html += '</tr>';
					html += '<tr>';
					html += '<td colspan="2"><textarea rows=3 cols=80 name="p_edu" id="p_edu">';
					if (data[i].p_edu !=null){
						html += data[i].p_edu ;	
					} else {
						html += '';
					}
					html += '</textarea></td>'
					html += '</tr>';
					html += '</table></div>';
    				
					/* 경력 */
					html += '<div class="info" id="pcareer">';
					html += '<hr>';
					html += '<table>';
					html += '<tr>';
					html += '<td><h4>경력</h4></td>';
					html += '<td class="btn-edit"><button class="btn btn-outline-danger" onclick="careerInfo('+mento_idx+')">수정</button></td>';
					html += '</tr>';
					html += '<tr>';
					html += '<td colspan="2">';
					if (data[i].p_career !=null){
						html += data[i].p_career + '<br>';	
					} else {
						html += '';
					}
					html += '</td>'
					html += '</tr>';
					html += '</table></div>';
					
					/* 경력 변경  */
    				html += '<div id="editCareer" style="display : none">';
					html += '<hr><input type="hidden" name="mento_idx" id="mento_idx">';
					html += '<table>';
					html += '<tr>';
					html += '<td><h4>경력사항</h4></td>';
					html += '<td class="btn-edit"><button class="btn btn-outline-primary" onclick="editEdu('+mento_idx+')">저장</button></td>';
					html += '</tr>';
					html += '<tr>';
					html += '<td colspan="2"><textarea rows=3 cols=80 name="p_career" id="p_career">';
					if (data[i].p_career !=null){
						html += data[i].p_career ;	
					} else {
						html += '';
					}
					html += '</textarea></td>'
					html += '</tr>';
					html += '</table></div>';
    				
					/* 고수 상세 설명 */					
					html += '<div class="info" id="plong">';
					html += '<hr>';
					html += '<table>';
					html += '<tr>';
					html += '<td><h4>상세 설명</h4></td>';
					html += '<td class="btn-edit"><button class="btn btn-outline-danger" onclick="longInfo('+mento_idx+')">수정</button></td>';
					html += '</tr>';
					html += '<tr>';
					html += '<td colspan="2">';
					if (data[i].p_long !=null){
						html += data[i].p_long + '<br>';	
					} else {
						html += '';
					}
					html += '</td>'
					html += '</tr>';
					html += '</table></div>';
					
					/* 상세소개 변경  */
    				html += '<div id="editLong" style="display : none">';
					html += '<hr><input type="hidden" name="mento_idx" id="mento_idx">';
					html += '<table>';
					html += '<tr>';
					html += '<td><h4>상세 설명</h4></td>';
					html += '<td class="btn-edit"><button class="btn btn-outline-primary" onclick="editLong('+mento_idx+')">저장</button></td>';
					html += '</tr>';
					html += '<tr>';
					html += '<td colspan="2"><textarea rows=7 cols=120 name="p_long" id="p_long">';
					if (data[i].p_long !=null){
						html += data[i].p_long ;	
					} else {
						html += '';
					}
					html += '</textarea></td>'
					html += '</tr>';
					html += '</table></div>';
    				
					/* 리뷰  */
					html += '<hr><div id="reviewBox" class="info">';
					html += '<h4>';
					html += '리뷰<span>'
							+ data[i].review_cnt
							+ '개 (평균 '
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
					html += '<td>'+data[i].review_star+'점</td>';
					html += '</tr>';
					html += '<tr>';
					html += '<td colspan="2">' + data[i].cont
							+ '</td>';
					html += '</tr>';
					html += '<tr>';
					html += '<td colspan="2">' + year + '.' + month + '.' + day 
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
	
	/* 서비스 등록 가능한 리스트 */
	function getService(mento_idx){
		$('#pservice').css('display', 'none');
		$.ajax({
			url : 'http://localhost:8080/toti/mento/getservice/' + mento_idx,
			type: 'GET',
			success : function(data){
				
				var html = '';
               
		    	html += '<hr><h4>제공 서비스</h4> ';
		    	html += '<h5>레슨 가능한 서비스들을 선택해주세요.</h5>';
		    	for(var i=0; i<data.length;i++){
		    		html += '<form id="addServiceForm" >';	
	    			html += '<input type="hidden" name="mento_idx" id="mento_idx" value="'+mento_idx+'">';
	    			html += '<input type="hidden" name="service_idx" id="service_idx" value="'+data[i].service_idx+'">'; 
	    			html += '<input type="button" class="btn btn-outline-primary btn-sm" value="+" onclick="addService('+mento_idx+','+ data[i].service_idx+')">';
	    			html += data[i].service_name;
	    			html += '</form> ';	
		    	}
                $('#addServiceBox').html(html);
			}
		});
	}

	
	/* 서비스 삭제 가능한 리스트 */
	function getService2(mento_idx){
		$('#pservice').css('display', 'none');
		$.ajax({
			url : 'http://localhost:8080/toti/mento/getservice2/' + mento_idx,
			type: 'GET',
			success : function(data){
				var html = '';
                
		    	html += '<hr><h4>제공 서비스</h4> ';
		    	html += '<h5>삭제할 서비스를 골라주세요.</h5>';
		    	for(var i=0; i<data.length;i++){
	    			html += '<form id="delServiceForm" >';
	    			html += '<input type="hidden" name="mento_idx" id="mento_idx" value="'+mento_idx+'">';
	    			html += '<input type="hidden" name="service_idx" id="service_idx" value="'+data[i].service_idx+'">'; 
	    			html += '<input type="button" class="btn btn-outline-danger btn-sm" value="-" onclick="delService('+mento_idx+','+ data[i].service_idx+')">';
	    			html += data[i].service_name;
	    			html += '</form> ';
		    	}
                $('#delServiceBox').html(html);
			}
		});
	}
	
	/* 서비스 추가하기 */
	function addService(mento_idx, service_idx){
		alert(service_idx);
		$.ajax({
			url : 'http://localhost:8080/toti/mento/addservice',
			type : 'POST',
			data : {
				mento_idx : mento_idx,
				service_idx : service_idx
			},
			success : function(data){
				if(data=='success'){
					alert('서비스가 추가되었습니다.');
					location.reload();
				}else {
					alert('등록 실패');
				}
			}
		});
	}
	
    /* 서비스 삭제하기 */
    function delService(mento_idx, service_idx){
    	alert(service_idx);
    	alert(mento_idx);
		$.ajax({
			url : 'http://localhost:8080/toti/mento/delservice',
			type : 'GET',
			data : {
				mento_idx : mento_idx,
				service_idx : service_idx
			},
			success : function(data){
				if(data=='success'){
					alert('서비스가 삭제되었습니다.');
					location.reload();
				}else {
					alert('삭제 실패');
				}
			}
		});
	}
		
	/* 위치 */
	
	/* 결제 수단 */
	function payInfo(mento_idx){
		$('#ppay').css('display', 'none');
		$('#editPay').css('display', 'block');		
		$.ajax({
			url : 'http://localhost:8080/toti/mento/' + mento_idx,
			type : 'GET',
			success : function(data) {
				$('#mento_idx').val(mento_idx);
                $('#p_pay').val(data[i].p_pay);
			}

		});
	}
	
	function editPay(mento_idx){
		
		$.ajax({
			url :'http://localhost:8080/toti/mento/editpay/' + mento_idx,
		    dataType: 'text',
	        type: 'PUT',	
	        contentType:'application/json;chartset=utf-8',
	        data: JSON.stringify({
	        	mento_idx:$('#mento_idx').val(),
	        	p_pay:$('#p_pay').val()
			}),
			success : function(data){
				location.reload();
			}
		});
		
    }
	
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