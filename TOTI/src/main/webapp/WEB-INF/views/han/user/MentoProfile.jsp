<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/frame/header.jsp" %>
<title>TOTI :: 프로필 관리</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
	table {
		width: 100%;
	}
	
	button {
		margin: 1px;
	}
		
	#mentorProfile {
		float: left;
		width: 70%;
	}
	
	.btn-edit{
		width: 50px;
	}
	
	.date{
		width: 80px;
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
		margin: 10px;
	}
	
	.overview{
		width: 200px;
		margin: 20px 150px;
		padding-top: 55px;
		height: 180px;
	}

	.aview{
		font-weight: 500;
		text-align: center;
	    vertical-align: middle;
		color: #fff;
	    background-color: #00c7ae;
	    border-color: #00c7ae;
	    text-align: center;
	}

	#overtable{
		text-align: center;
	}
	
	#num{
		font-size: 25px;
		font-weight: bold;
	}
	
	#avgrev img{
		width: 23px;
	}
	
	#m-name{
		font-weight: bold;
	}
	
	#url_field{
		width: 280px;
		height: 25px;
		border: 2px solid #48A0DC;
		border-radius: 3px;
		font-size: 15px;
		font-weight: 400;
		margin: 5px;
		padding: 5px;
	}
	
	.subinfo {
		color: red;
		margin-top: 3px;
	}
	
	#servbtn{
		height:19px; 
		padding: 0px 4px; 
		padding-bottom: 20px;
		text-align: center;
		margin: 3px;
	}
	
</style>
</head>
<body>
	<!-- page container -->
	<div class="page-container" >
		<%@include file="/WEB-INF/views/frame/nav.jsp"%>
		<!-- demo content -->
		<div class="demo-content mrg-top-md">
			<!-- container -->
			<div  class="container" style="margin-top: -50px; margin-bottom: 50px;">
				<input type="hidden" id="mento_idx" value="${mento_idx}">
				<input type="hidden" value="${idx}" id="m_idx" name="m_idx">
				<div id="mentorProfile"></div>
				<div style="float:right; width:25%; margin:10px;" >
					<h4>리뷰 요청하기</h4>
					링크를 공유하고 고객들에게 리뷰를 받아 보세요. 긍정적인 리뷰가 있는 고수는 고용될 확률이 2배 이상 높습니다.
					<input type="text" id="url_field" value="/toti/review/${mento_idx}" readonly><br>
					<button class="btn btn-outline-danger" id="copy_btn" style="margin-top: 5px;"> 복사하기 </button>
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
	
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=77476b461a52048f03e20b9b307d995f&libraries=services"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(document).ready(function() {
		mentorProfile($('#mento_idx').val());
	});
	
	if($('#mento_idx').val() != $('#m_idx').val() ){
		alert('접근 불가능한 페이지입니다. 메인화면으로 이동합니다.');
		location.href="/toti/main";
	}
	
	function mentorProfile(mento_idx) {
		$.ajax({
			url : '/toti/mento/' + mento_idx,
			type : 'GET',
			success : function(data) {
				var html = '';
				for (var i = 0; i < data.length; i++) {
	
					var position = data[i].tor_location;
					
					/*간략한 고수정보*/
					html += '<div class="info" id="overview">';
					html += '<img class="img" src="<c:url value="/uploadfile/'+data[i].m_photo+'" />">';
					html += '<div class="overview"> ';
					html += '<table id="overtable"><tr>';
					html += '<td id="num">'+ data[i].review_avg +'</td>';
					html += '<td id="num">'+ data[i].review_cnt +'</td>';
					html += '</tr>';
					html += '<tr><td>';
					html += '리뷰 평균</td>';
					html += '<td>리뷰 수</td></tr></table></div></div>';
					
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
					html += '<td colspan="2"><input type="text" name="m_name" id="m_name" style="width: 150px;" value="'+data[i].m_name+'"required></td>'
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
						html += '<div class="subinfo">한줄 소개를 작성해주세요.</div>';
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
					html += '<td class="btn-edit">';
					if (data[i].mento_service != null){
						html += '<button class="btn btn-outline-danger" onclick="getService2('+mento_idx+')">삭제</button></td>';
					}
					html += '<td class="btn-edit"><button class="btn btn-outline-danger" onclick="getService('+mento_idx+')">추가</button></td>';
					html += '</tr>';
					html += '<tr>';
					html += '<td colspan="2">';
					if (data[i].mento_service != null) {
						html += '<div class="info">';
						html += data[i].mento_service + '</div>';
					} else {
						html += '<div class="subinfo">';
						html += '서비스를 추가해주세요.</div>';
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
					html += '<td class="btn-edit"><button class="btn btn-outline-danger" id="sample4_roadAddress" onclick="locationInfo('+mento_idx+')">수정</button></td>';
					html += '</tr>';
					html += '<tr>';
					html += '<td colspan="2">'+ data[i].tor_location + '<br>';
					html += '</td>'
					html += '</tr>';
					html += '</table><div id="map" style="width:100%;height:350px;"></div></div>';

					
					/* 위치 변경  */
					html += '<div id="editLocation" style="display : none">';
					html += '<hr><input type="hidden" name="mento_idx" id="mento_idx">';
					html += '<table>';
					html += '<tr>';
					html += '<td><h4>위치</h4></td>';
					html += '<td class="btn-edit"><button class="btn btn-outline-primary" onclick="editLocation('+mento_idx+')">저장</button></td>';
					html += '</tr>';
					html += '<tr>';
					if (data[i].tor_location !=null){
						html += '<td colspan="2"><input type="text" name="tor_location" id="tor_location" value="'+data[i].tor_location+'" style="width:250px;" readonly>';
					} 
					html += '<button style="margin:2px;" onclick="sample4_execDaumPostcode()">주소 검색</button>';
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
					if (data[i].p_pay !=null){
						html += data[i].p_pay + '<br>';	
					} else {
						html += '<div class="subinfo">결제 수단을 등록해주세요.</div>';
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
						html += '<div class="subinfo">고수님의 최종학력을 작성해주세요.</div>';
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
						html += '<div class="subinfo">고수님의 경력사항을 작성해주세요.</div>';
					}
					html += '</td>'
					html += '</tr>';
					html += '</table></div>';
					
					/* 경력 변경  */
    				html += '<div id="editCareer" style="display : none">';
					html += '<hr><input type="hidden" name="mento_idx" id="mento_idx">';
					html += '<table>';
					html += '<tr>';
					html += '<td><h4>경력</h4></td>';
					html += '<td class="btn-edit"><button class="btn btn-outline-primary" onclick="editCareer('+mento_idx+')">저장</button></td>';
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
						html += '<div class="subinfo">레슨에 대한 상세한 정보를 작성해주세요.</div>';
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
					html += '<td colspan="2"><textarea rows=7 cols=90 name="p_long" id="p_long">';
					if (data[i].p_long !=null){
						html += data[i].p_long ;	
					} else {
						html += '';
					}
					html += '</textarea></td>'
					html += '</tr>';
					html += '</table></div>';
					
					/* 리뷰  */
					var star= '<img src="https://d1hhkexwnh74v.cloudfront.net/icons/icon-common-review-star-small-full.svg">';
					var nostar='<img src="https://d1hhkexwnh74v.cloudfront.net/icons/icon-common-review-star-small-empty.svg">';
					
					html += '<hr><div id="reviewBox" class="info">';
					html += '<h4><div id="avgrev">';
					html += '리뷰<span>'
							+ data[i].review_cnt
							+ '개 </span>('+data[i].review_avg+')';
					if(data[i].review_avg == 5){
						html += star+star+star+star+star;
					}else if(data[i].review_avg == 4){
						html += star+star+star+star+nostar;
					}else if(data[i].review_avg == 3){
						html += star+star+star+nostar+nostar;
					}else if(data[i].review_avg == 2){
						html += star+star+nostar+nostar+nostar;
					}else if(data[i].review_avg == 1){
						html += star+nostar+nostar+nostar+nostar;
					}
					html += '</h4></div><br>';
					break;
				}
				
				for (var i = 0; i < data.length; i++) {
					html += '<input type="hidden" name="review_idx" value="'+data[i].review_idx+'">';
					html += '<table style="width:95%; margin-left:20px;">';
					html += '<tr>';
					html += '<td id="m-name">';
					if (data[i].member_name !=null){
						html += data[i].member_name ;
					
						if(data[i].review_star == 5){
							html += star+star+star+star+star;
						}else if(data[i].review_star == 4){
							html += star+star+star+star+nostar;
						}else if(data[i].review_star == 3){
							html += star+star+star+nostar+nostar;
						}else if(data[i].review_star == 2){
							html += star+star+nostar+nostar+nostar;
						}else if(data[i].review_star == 1){
							html += star+nostar+nostar+nostar+nostar;
						}	
						html += '</td>';
						html += '<td class="date">';
						if (data[i].review_date !=null){
							html += data[i].review_date ;	
						} else {
							html += '</td>';
						}
						html += '</tr>';
						html += '<tr>';
						html += '<td>';
						if (data[i].cont !=null){
							html += data[i].cont ;	
						} else {
							html += '';
						}
						html += '</td>';
						html += '<td style="float:right;"><a onclick="delreview('+data[i].review_idx+')" style="color:#48A0DC; ">삭제</a></td><br>';
						html += '</tr>';
						html += '</table><br>';
					}else {
						html += '등록된 리뷰가 없습니다.';
					}
				}
				html += '</div>';
				$('#mentorProfile').html(html);
				
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  
		
				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 
			
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();
			
				// 주소로 좌표를 검색합니다
				geocoder.addressSearch(position, function(result, status) {
				
				    // 정상적으로 검색이 완료됐으면 
				     if (status === kakao.maps.services.Status.OK) {
			
				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			
				        // 결과값으로 받은 위치를 마커로 표시합니다
				        var marker = new kakao.maps.Marker({
				            map: map,
				            position: coords
				        });
			
				        // 인포윈도우로 장소에 대한 설명을 표시합니다
				        var infowindow = new kakao.maps.InfoWindow({
				            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+position+'</div>'
				        });
				        infowindow.open(map, marker);
			
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
				    } 
				}); 
				}
			});
		}
	
	/* 고수 이름 */
	function nameInfo(mento_idx){
		$('#pname').css('display', 'none');
		$('#editName').css('display', 'block');
		$.ajax({
			url : '/toti/mento/' + mento_idx,
			type : 'GET'
		});
	}
	
	function editName(mento_idx){
		$.ajax({
			url :'/toti/mento/editname/' + mento_idx,
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
			url : '/toti/mento/' + mento_idx,
			type : 'GET'
		});
	}
	
	function editShot(mento_idx){
		$.ajax({
			url :'/toti/mento/editshot/' + mento_idx,
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
			url : '/toti/mento/getservice/' + mento_idx,
			type: 'GET',
			success : function(data){
				
				var html = '';
               
		    	html += '<hr><h4>제공 서비스</h4> ';
		    	html += '<h5 style="color:#48A0DC;">레슨 가능한 서비스들을 선택해주세요.</h5>';
		    	for(var i=0; i<data.length;i++){
		    		html += '<form id="addServiceForm" >';	
	    			html += '<input type="hidden" name="mento_idx" id="mento_idx" value="'+mento_idx+'">';
	    			html += '<input type="hidden" name="service_idx" id="service_idx" value="'+data[i].service_idx+'">'; 
	    			html += '<input type="button" id="servbtn" class="btn btn-outline-primary btn-sm" value="+" onclick="addService('+mento_idx+','+ data[i].service_idx+')">';
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
			url : '/toti/mento/getservice2/' + mento_idx,
			type: 'GET',
			success : function(data){
				var html = '';
                
		    	html += '<hr><h4>제공 서비스</h4> ';
		    	html += '<h5 style="color:#48A0DC;">삭제할 서비스를 선택하세요.</h5>';
		    	for(var i=0; i<data.length;i++){
	    			html += '<form id="delServiceForm" >';
	    			html += '<input type="hidden" name="mento_idx" id="mento_idx" value="'+mento_idx+'">';
	    			html += '<input type="hidden" name="service_idx" id="service_idx" value="'+data[i].service_idx+'">'; 
	    			html += '<input type="button" id="servbtn" class="btn btn-outline-danger btn-sm" value="-" onclick="delService('+mento_idx+','+ data[i].service_idx+')">';
	    			html += data[i].service_name;
	    			html += '</form> ';
		    	}
                $('#delServiceBox').html(html);
			}
		});
	}
	
	/* 서비스 추가하기 */
	function addService(mento_idx, service_idx){

		$.ajax({
			url : '/toti/mento/addservice',
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
		$.ajax({
			url : '/toti/mento/delservice',
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
	function locationInfo(mento_idx){
		$('#plocation').css('display', 'none');
		$('#editLocation').css('display', 'block');	
		$.ajax({
			url : '/toti/mento/' + mento_idx,
			type : 'GET',
			success : function(data) {
				
				
			}
		});
	}
	
	function editLocation(mento_idx){
		$.ajax({
			url :'/toti/mento/editlocation/' + mento_idx,
		    dataType: 'text',
	        type: 'PUT',	
	        contentType:'application/json;chartset=utf-8',
	        data: JSON.stringify({
	        	mento_idx:$('#mento_idx').val(),
	        	tor_location:$('#tor_location').val()
			}),
			success : function(data){
				location.reload();
			}
		});
		
    }
	
	/* 결제 수단 */
	function payInfo(mento_idx){
		$('#ppay').css('display', 'none');
		$('#editPay').css('display', 'block');		
		$.ajax({
			url : '/toti/mento/' + mento_idx,
			type : 'GET'
		});
	}
	
	function editPay(mento_idx){
		
		$.ajax({
			url :'/toti/mento/editpay/' + mento_idx,
		    dataType: 'text',
	        type: 'PUT',	
	        contentType:'application/json;chartset=utf-8',
	        data: JSON.stringify({
	        	mento_idx:$('#mento_idx').val(),
	        	p_pay:$("input:radio[name=p_pay]:checked").val()
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
			url : '/toti/mento/' + mento_idx,
			type : 'GET'
		});
	}
	
	function editEdu(mento_idx){
		
		$.ajax({
			url :'/toti/mento/editedu/' + mento_idx,
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
			url : '/toti/mento/' + mento_idx,
			type : 'GET'
		});
	}
	
	function editCareer(mento_idx){
		
		$.ajax({
			url :'/toti/mento/editcareer/' + mento_idx,
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
			url : '/toti/mento/' + mento_idx,
			type : 'GET'
		});
	}
	
	function editLong(mento_idx){
		
		$.ajax({
			url :'/toti/mento/editlong/' + mento_idx,
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
	
	function delreview(review_idx){
		if(confirm('리뷰를 삭제할까요?')){
	           $.ajax({
	                url : '/toti/delreview/'+review_idx,
	                type : 'DELETE',
	                success : function(data){
	                    if(data=='success'){
	                        alert('삭제되었습니다');
	                        location.reload();
	                    }else {
	                    	alert('삭제실패');
	                    }
	                }
	            });
	        }
	}
	
	var copyBtn = document.querySelector('#copy_btn');
	copyBtn.addEventListener('click', function () {
	  var urlField = document.querySelector('#url_field');
	  // select the contents
	  urlField.select();
	   
	  document.execCommand('copy'); // or 'cut'
	}, false);
	
	
	function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("tor_location").value = roadAddr;
                
                

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } 
            }
        }).open();
    }
	

    

	
	
	
</script>

</body>
</html>