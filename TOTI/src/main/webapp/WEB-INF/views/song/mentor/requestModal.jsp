<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/frame/header.jsp"%>

<%-- <% int idx = (int)session.getAttribute("idx"); %> --%>
<!-- title -->
<title>SamplePage</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://chat.yal-toti.tk/socket.io/socket.io.js"></script>
<style>
* {
	margin: 0;
	padding: 0;
}

body {
	margin: 0;
	padding: 0;
	overflow: auto;
}

h1, h2, h3, h4, h5, h6 {
	color: black;
}

#request {
	width: 100%;
}

#req {
	width: 60%;
	float: left;
	margin: 0 auto;
	padding-left: 100px;
}

#m_photo {
	width: 100px;
	height: 100px;
	border-radius: 50%;
	margin-bottom: 20px;
	margin-right: 30px;
}

#request h3 {
	text-align: left;
}

#mInfo {
	margin-bottom: 20px;
}

#est {
	float: left;
	text-align: center;
	border: 1px solid #ddd;
	border-radius: 3px;
	padding: 15px;
	margin: 20%;
	font-size: 14px;
}

#estBtn {
	font-size: 13px;
	margin-top: 6px;
	width: 140px;
	margin-top: 20px;
}

.modal-body table {
	width: 90%;
	margin: 0 auto;
}

.modal-body form {
	margin-top: 15px;
}

.modal-body table tr td:first-child {
	width: 20%;
	text-align: right;
}

.modal-body table tr td:last-child {
	width: 300px;
}

.modal-body table tr:last-child td {
	text-align: center;
}

.modal-body  .divbox {
	width: 90%;
	margin: 0 auto;
	border-radius: 5px 5px;
}

.modal-body #price {
	border: 1px solid #ddd;
	font-size: 9px;
}

input[type=text] {
	border: 0px;
}

textarea {
	border: 0px;
	width: 100%;
}

.modal-body #est_price {
	height: 40px;
	line-height: 40px;
	border: 0px;
}

.modal-body #textarea {
	border: 1px solid #ddd;
}

p {
	font-size: 14px;
	color: #212529;
}

.chk {
	float: right;
	margin-right: 15px;
}

.modal-body #subBtn {
	margin: 3% 0;
	width: 30%;
	font-size: 13px;
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
							<h1 class="title">요청서</h1>
							<input type="hidden" id="request_idx" value="${request_idx}">
							<p>고객으로 받은 요청서</p>
							<hr>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!--/#action-->

	<section id="blog" class="padding-bottom">
		<div class="container wrapper">
			<div class="row">
				<div class="col-md">
					<div id="req"></div>
					<!-- 제공하는 컨텐츠 이렇게 넣으세여 예시↓ -->
					<div class="single-blog two-column">
						<div class="post-content overflow">
							<div id="est"></div>
						</div>
					</div>
					<!-- The Modal -->
					<div class="modal" id="myModal">
						<div class="modal-dialog">
							<div class="modal-content">

								<!-- Modal Header -->
								<div class="modal-header">
									<h1 class="modal-title">견적서</h1>
									<button type="button" class="close" style="margin-top: -50px;"
										data-dismiss="modal">×</button>
								</div>

								<!-- Modal body -->
								<div class="modal-body">
									<form method="post" enctype="multipart/form-data"
										onsubmit="return false">
										<div id="req_idx"></div>

										<!-- 세션 값 받기 -->
										<input type="hidden" id="mento_idx" name="mento_idx"
											value="${idx}">


										<table>
											<tr>
												<td><p>예상 총 비용</p></td>
												<td>
													<div id="price" class="divbox">
														<input type="text" name="est_price" id="est_price"
															style="width: 90%"><span style="font-size: 13px;"
															id="won">원</span>
													</div>

												</td>
											</tr>

											<tr>
												<td colspan="2">
													<p id="p_chk"></p>
												</td>
											</tr>

											<tr>
												<td><p>수업 상세 내용</p></td>
												<td>
													<div id="textarea" class="divbox">
														<textarea rows="7" cols="40" name="est_cont" id="est_cont"></textarea>
													</div>

												</td>
											</tr>

											<tr>
												<td colspan="2">
													<p id="c_chk"></p>
												</td>
											</tr>

											<tr>
												<td><p>파일 추가</p></td>
												<td>
													<div id="file" class="divbox">

														<input type="file" name="est_file" id="est_file">

													</div>
												</td>
											</tr>
											<tr>
												<td colspan="2">
													<p id="coinCheck"></p>
													<button type="button" id="subBtn" class="btn btn-primary"
														onclick="estimate()">전송</button>
												</td>
											</tr>
										</table>

									</form>
								</div>

								<!-- Modal footer -->
								<div class="modal-footer">
									<button type="button" class="btn btn-danger"
										data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>
					<!-- 모달 끝 -->
				</div>
			</div>
		</div>
	</section>
	<!-- footer -->
	<%@include file="/WEB-INF/views/frame/footer.jsp"%>
</body>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c69d5f862cf8316938343efcf4a7d402&libraries=services"></script>

<script>
	/* ajax 시작 */
	$(document).ready(function() {

		request($('#request_idx').val());
		menteeLocation($('#request_idx').val())

	});

	function request(request_idx) {
		$
				.ajax({
					url : '/toti/requestInfo/' + request_idx,
					type : 'GET',
					success : function(data) {
						var html = '';
						var est = '';
						var req_idx = '';

						for (var i = 0; i < data.length; i++) {
							html += '<div id="mInfo">'
							html += '<input type ="hidden" id="m_idx" name="m_idx" value="'+ data[i].m_idx+'">';
							html += '<input type ="hidden" id="cate_idx" name="cate_idx" value="'+ data[i].cate_idx+'">';
							html += '<img id="m_photo" src = "<c:url value="/uploadfile/'+data[i].m_photo+'"/>"';
							html += '<span style="float:left;"><h2 style="height:100px;line-height:60px;">'
									+ data[i].m_name;
							html += '<p>' + data[i].cate_name;
							html += ' - ';
							html += data[i].service_name + '</p>';
							html += '</h2></span>';
							html += '</div>'
							break;
						}

						for (var i = 0; i < 3; i++) {
							html += '<div id="reqInfo">'
							html += '<p style="font-weight: 700">Q' + (i + 1)
									+ '. ' + data[i].quest_name + '</p>';
							html += '<p id="'+data[i].answer_cont+'_div">'
									+ data[i].answer_cont;
							html += '</p>';
							html += '<hr>';
							html += '</div>'

						}

						for (var i = 3; i < 4; i++) {
							html += '<div id="reqInfo">'
							html += '<p style="font-weight: 700">Q' + (i + 1)
									+ '. ' + data[i].quest_name + '</p>';
							html += '<p id="'+data[i].answer_cont+'_div">'
									+ data[i].answer_cont;

							/* html += '<button style="border:0px; color:#337AB7; font-size:12px; margin-left: 30px;" onclick="menteeLocation('+request_idx+')">위치 보기</button>'; */
							html += '<p style="margin:15px 0;">';
							html += '</p>';
							html += '<div id="map" style="width:100%;height:350px;"></div>';
							html += '</p>';
							html += '<hr>';
							html += '</div>';

						}

						for (var i = 4; i < data.length; i++) {
							html += '<div id="reqInfo">'
							html += '<p style="font-weight: 700">Q' + (i + 1)
									+ '. ' + data[i].quest_name + '</p>';
							html += '<p id="'+data[i].answer_cont+'_div">'
									+ data[i].answer_cont;
							html += '</p>';
							html += '<hr>';
							html += '</div>'

						}

						$('#req').html(html);

						for (var i = 0; i < data.length; i++) {
							est += data[i].m_name + '님이 멘토를  찾고 계세요! <br>';
							est += data[i].m_name + '님에게 '
									+ data[i].service_name + '를 알려주세요!<br>';
							break;
						}
						/* Button to Open the Modal */
						est += '<button type="button" id="estBtn" class="btn btn-primary" data-toggle="modal" data-target="#myModal" style="margin: 2px auto;">견적서 보내기</button>';

						$('#est').html(est);

						req_idx += '<input type="hidden" id="request_idx" name="request_idx" value="'+request_idx+'">';
						$('#req_idx').html(req_idx);

					}
				});
	}

	function menteeLocation(request_idx) {

		$
				.ajax({
					url : '/toti/requestInfo/' + request_idx,
					type : 'GET',
					success : function(data) {

						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						mapOption = {
							center : new kakao.maps.LatLng(33.450701,
									126.570667), // 지도의 중심좌표
							level : 2
						// 지도의 확대 레벨
						};

						// 지도를 생성합니다    
						var map = new kakao.maps.Map(mapContainer, mapOption);

						// 주소-좌표 변환 객체를 생성합니다
						var geocoder = new kakao.maps.services.Geocoder();

						for (var i = 3; i < 4; i++) {
							// 주소로 좌표를 검색합니다
							geocoder
									.addressSearch(
											data[i].answer_cont,
											function(result, status) {

												// 정상적으로 검색이 완료됐으면 
												if (status === kakao.maps.services.Status.OK) {

													var coords = new kakao.maps.LatLng(
															result[0].y,
															result[0].x);

													// 결과값으로 받은 위치를 마커로 표시합니다
													var marker = new kakao.maps.Marker(
															{
																map : map,
																position : coords
															});

													// 인포윈도우로 장소에 대한 설명을 표시합니다
													var infowindow = new kakao.maps.InfoWindow(
															{
																content : '<div style="width:150px;text-align:center;padding:6px 0;">고객 희망 위치</div>'
															});
													infowindow
															.open(map, marker);

													// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
													map.setCenter(coords);
												}
											});
						}
					}
				});
	}

	/* 견적서 */
	function estimate() {
		var mento_idx = $('#mento_idx').val();

		$
				.ajax({
					url : '/toti/credit/' + mento_idx,
					type : 'GET',
					success : function(item) {

						var coinhtml = '';
						for (var i = 0; i < item.length; i++) {

							var price = $('#est_price').val();
							var cont = $('#est_cont').val();

							if (cont.length < 1 && price.length < 1
									&& price < 1) {
								$('#p_chk')
										.html(
												'<p class="chk" style="color:red;">1원 이상 입력해주세요.</p>');
								$('#c_chk')
										.html(
												'<p class="chk" style="color:red;">필수 사항입니다.</p>');
								return false;
							} else if (price.length < 1 && price < 1) {
								$('#p_chk')
										.html(
												'<p class="chk" style="color:red;">1원 이상 입력해주세요.</p>');
								$('#c_chk')
										.html(
												'<p class="chk" style="color:red;"></p>');

								return false;
							} else if (cont.length < 1) {
								$('#c_chk')
										.html(
												'<p class="chk" style="color:red;">필수 사항입니다.</p>');
								$('#p_chk')
										.html(
												'<p class="chk" style="color:red;"></p>');
								return false;
							} else {
								$('#p_chk')
										.html(
												'<p class="chk" style="color:red;"></p>');
								$('#c_chk')
										.html(
												'<p class="chk" style="color:red;"></p>');
							}

							if (item[i].tor_coin == 0) {
								alert('코인을 충전 후 사용해주세요.');
								location.href = '/toti/mypage2';
								break;
							} else {

								alert('사용 가능한 코인 : ' + item[i].tor_coin
										+ '\n견적서를 보낼 때마다 1코인씩 차감됩니다');

								var formData = new FormData();
								var file = $('#est_file')[0].files[0];

								formData.append('est_price', $('#est_price')
										.val());
								formData.append('est_cont', $('#est_cont')
										.val());
								formData.append('mento_idx', $('#mento_idx')
										.val());

								if (file != null) {
									formData.append('est_file', file);
								}

								var user = $('#mento_idx').val();
								var m_idx = $('#m_idx').val();
								var cate_idx = $('#cate_idx').val();

								var request_idx = $('#request_idx').val();

								$
										.ajax({
											url : '/toti/estimateform/'
													+ request_idx,
											type : 'POST',
											processData : false,
											contentType : false,
											data : formData,
											success : function(data) {
												var est_idx = data;
												if (data > 0) {
													alert('전송되었습니다.');

													$
															.ajax({
																url : '/toti/credit/'
																		+ mento_idx,
																type : 'PUT',
																success : function(
																		data) {

																	$
																			.ajax({
																				url : "/toti/chat/room/"
																						+ +est_idx
																						+ "/"
																						+ cate_idx
																						+ "/"
																						+ user
																						+ "/"
																						+ m_idx,
																				type : 'GET',
																				success : function() {
																					var socket = io
																							.connect('https://chat.yal-toti.tk/');

																					var room_num = est_idx;

																					// alert($('#chat_room').val());
																					// alert(room_num);

																					socket
																							.emit(
																									"join",
																									{
																										room : room_num,
																										user : user,
																										target : m_idx
																									});
																					alert('1코인이 사용 되었습니다.');

																					history.back();
																				}
																			});
																}

															});

												} else {
													alert('이미 견적서를 전송한 요청서 입니다.');
												}
											}
										});
							}
						}
					}
				});

	}
</script>
</html>