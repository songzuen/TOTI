<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/frame/contents/header.jsp"%>

<script type="text/javascript" src="<c:url value="/js/jquery.ajax-cross-origin.min.js" />"></script>
<!-- title -->
<title>TOTI</title>
<style type="text/css">
.map_wrap {
	position: relative;
	width: 100%;
	height: 350px;
}

.title {
	font-weight: bold;
	display: block;
}

.hAddr {
	position: absolute;
	left: 10px;
	top: 10px;
	border-radius: 2px;
	background: #fff;
	background: rgba(255, 255, 255, 0.8);
	z-index: 1;
	padding: 5px;
}

#centerAddr {
	display: block;
	margin-top: 2px;
	font-weight: normal;
}

.bAddr {
	padding: 5px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
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
			<div class="container" style="margin-top: -50px">
				<div>				
					<h2>${data.cate_name}</h2>
				</div>
				<div class="col-md-8 col-md-offset-2">
					<div class="progress">
						<div
							class="progress-bar progress-bar-info progress-bar-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100">
							<div id="dd">
							</div>
						</div>
					</div>
					<form role="form" method="post">
					<div>
						<!-- 분야번호 -->
						<input type="hidden" value="${data.cate_idx}" id="cate_idx" name="cate_idx">
						<!-- 회원번호 -->
						<input type="hidden" placeholder="회원ID" name="m_idx" value="1">
					</div>
					<div class="step well">
							<div>
								 ${data.cate_name}분야에서 원하는 서비스는 ?
								<div>
									<c:forEach items="${data.service}" var="service" varStatus="stat">
										<input id="${ service.service_idx }_service" type="radio" value="${ service.service_idx }" name="service_idx">
										<label for="${ service.service_idx }_service">${ service.service_name }</label><br>
									</c:forEach>
								</div>
							</div>
					</div>
					<c:forEach items="${data.quest}" var="quest" varStatus="stat">
						<div class="step well">
							<div>
								<input type="hidden" value="${ quest.quest_idx }" class="quest_idx" name="answerDatas[${stat.index}].qurest_idx">
								<input type="hidden" value="${ quest.quest_type }" class="${ quest.quest_idx }_type">
								${ quest.quest_name }
								<div id="${ quest.quest_idx }_item_wrap">
									
								</div>
							</div>
						</div>
					</c:forEach>				
					<input type="submit" class="action submit btn btn-success" value="보내기">
					</form>
					<button class="action back btn btn-info">Back</button>
					<button class="action next btn btn-info">Next</button>
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
	
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4668590a134c8473c3e3cea848555388&libraries=services"></script>
<script type="text/javascript">

	$(document).ready(function() {
				
		var cnt = 0;
		
		$(".quest_idx").each(function(){
			itemList($(this).val(), cnt);
			cnt++;
		});

		var current = 1;

		widget = $(".step");
		btnnext = $(".next");
		btnback = $(".back");
		btnsubmit = $(".submit");

		// Init buttons and UI
		widget.not(':eq(0)').hide();
		hideButtons(current);
		setProgress(current);

		// Next button click action
		btnnext.click(function() {
			if (current < widget.length) {
				widget.show();
				widget.not(':eq(' + (current++) + ')').hide();
				setProgress(current);
			}
			hideButtons(current);
			
			quest_idx = $('#'+current+'_quest_idx').val();

		})

		// Back button click action
		btnback.click(function() {
			
			if (current > 1) {
				current = current - 2;
				btnnext.trigger('click');
			}
			hideButtons(current);
			
		})
		
		
	});

	// Change progress bar action
	setProgress = function(currstep) {
		var percent = parseFloat(100 / widget.length) * currstep;
		percent = percent.toFixed();
		$(".progress-bar").css("width", percent + "%").html(percent + "%");
	}

	// Hide buttons according to the current step
	hideButtons = function(current) {
		var limit = parseInt(widget.length);

		$(".action").hide();

		if (current < limit)
			btnnext.show();
		if (current > 1)
			btnback.show();
		if (current == limit) {
			btnnext.hide();
			btnsubmit.show();
		}
	}
		
		function itemList(quest_idx, cnt) {
			
			$.ajax({
				url : 'http://localhost:8080/toti/itemList/'+quest_idx,
				type : 'GET',
				success : function(data) {
					
					var html = '';
					
					if(quest_idx == 999) {
						for (var i = 0; i < data.length; i++) {
							html += '<input id="'+data[i].item_idx+'_item" type="'+$('.'+quest_idx+'_type').val()+'"'
							if($('#cate_idx').val() == 1){
								html +=	'placeholder="ex) 음치탈출하고싶어요"';
							}else if($('#cate_idx').val() == 2){
								html +=	'placeholder="ex) 몸치탈출하고싶어요"';
							}else if($('#cate_idx').val() == 3){
								html +=	'placeholder="ex) 악보읽기 힘들어요"';
							}
							html += 'name="answerDatas['+cnt+'].answer_cont" >';
						}
					}else if(quest_idx == 6){
						
						html += '<input type="button" value="주소가져오기" onclick="map()">';
						html += '주소 : <input type="text" id="city_idx">';
						
						
					}else {
						for (var i = 0; i < data.length; i++) {
							html += '<input id="'+data[i].item_idx+'_item" type="'+$('.'+quest_idx+'_type').val()+'" value="'+data[i].item_cont+'"';
							html += 'name="answerDatas['+cnt+'].answer_cont" >';
							html += '<label for="'+data[i].item_idx+'_item">'+ data[i].item_cont + '</label><br>';
						}
					}
					
					$('#'+quest_idx+'_item_wrap').html(html);
				
				}

			});
			
		}
		
		
		function map() {
			
			var url = '<c:url value="/request/map" />';
            var name = 'map';
            var option = 'width = 800, height = 520, top = 100, left = 100, location = no'
            window.open(url, name, option);
			
		}
		
		/*
		
		var html = '';

		html += '<div class="map_wrap"> <div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>';
		html += '<div class="hAddr"><span class="title">지도중심기준 행정동 주소정보</span> <span id="centerAddr"></span>';
		html += '</div></div>';

		$('#6_item_wrap').html(html);

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		
		mapOption = {
			center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level : 1
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
		infowindow = new kakao.maps.InfoWindow({
			zindex : 1
		}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

		// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
		searchAddrFromCoords(map.getCenter(), displayCenterInfo);

		// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
			searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
				if (status === kakao.maps.services.Status.OK) {
					var detailAddr = !!result[0].road_address ? '<div>도로명주소 : '
							+ result[0].road_address.address_name + '</div>' : '';
					detailAddr += '<div>지번 주소 : ' + result[0].address.address_name
							+ '</div>';

					var content = '<div class="bAddr">'
							+ '<span class="title">법정동 주소정보</span>' + detailAddr
							+ '</div>';

					// 마커를 클릭한 위치에 표시합니다 
					marker.setPosition(mouseEvent.latLng);
					marker.setMap(map);

					// 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
					infowindow.setContent(content);
					infowindow.open(map, marker);
				}
			});
		});

		// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'idle', function() {
			searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		});
	
	function searchAddrFromCoords(coords, callback) {
		// 좌표로 행정동 주소 정보를 요청합니다
		geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);
	}

	function searchDetailAddrFromCoords(coords, callback) {
		// 좌표로 법정동 상세 주소 정보를 요청합니다
		geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
	}

	// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
	function displayCenterInfo(result, status) {
		if (status === kakao.maps.services.Status.OK) {
			var infoDiv = document.getElementById('centerAddr');

			for (var i = 0; i < result.length; i++) {
				// 행정동의 region_type 값은 'H' 이므로
				if (result[i].region_type === 'H') {
					infoDiv.innerHTML = result[i].address_name;
					break;
				}
			}
		}
	}
	
	*/
</script>
</body>
</html>
