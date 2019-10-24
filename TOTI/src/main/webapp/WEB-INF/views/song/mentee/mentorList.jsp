<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
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
	width: 100%;
	height: 100%;
	overflow: auto;
}

#blog {
	width: 75%;
	margin: 20px auto;
}

h1, h2, h3, h4, h5, h6 {
	color: black;
	letter-spacing: 1px;
}

#searchDiv {
	height: 10px;
}

#searchDiv span:first-child {
	margin: 0 40px;
	float: left;
}

#searchDiv span:last-child {
	margin: 0 40px;
	float: right;
	width: 25%;
}

#stype {
	border: 0px;
}

#keyword {
	padding-left: 5px;
	width: 40%;
	border: 0px;
	border-bottom: 1px solid #ddd;
	margin: 0 20px;
}

input[type=checkbox] {
	display: none;
}

#mentorList {
	width: 80%;
	margin: 20px auto;
}

#mentor {
	/* margin: 10px auto; */
	width: 100%;
	height: 70%;
}

#m_photo {
	width: 100px;
	height: 100px;
	border-radius: 50%;
}

table {
	width: 800px;
	text-align: left;
	margin: 20px auto;
}

table tr:nth-child(1) td:nth-child(1) {
	width: 150px;
	text-align: center;
}

table tr td {
	padding: 3px 0;
}

.comment {
	width: 16px;
	padding: 3px;
	color: #a0a0a0;
}

#star {
	width: 15px;
}

.btn {
	display: none;
}

.labelfor {
	color: #aaa;
	font-size: 13px;
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
							<h1 class="title">고수 찾기</h1>
							<input type="hidden" id="request_idx" value="${request_idx}">
							<p>레슨 받고 싶은 분야의 고수를 찾아보세요!</p>
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
					<div id="searchDiv">
						<span> <input type="checkbox" id="rCnt" name="rCnt"
							value=true onclick="listByReviewCnt()"><label for="rCnt"
							style="cursor: pointer"><strong class="labelfor"
								id="label_rcnt">리뷰순</strong></label> | <input type="checkbox" id="str"
							name="str" value=true onclick="listByStr()"><label
							for="str" style="cursor: pointer"><strong
								class="labelfor" id="label_str">별점순</strong></label>
						</span> <span>
							<form id="searchForm" method="post" onsubmit="return false">
								<select name="stype" id="stype">
									<option value="both">분야+멘토명</option>
									<option value="cate">분야</option>
									<option value="name">멘토명</option>
								</select> <input type="text" name="keyword" id="keyword"> <input
									type="submit" id="searchBtn" value="검색" onclick="search()">
							</form>
						</span>
					</div>

					<!-- <div id="selectDiv">
				<form>
					<select name="location" id="location">
						<option value="total">전체</option>
						</select>
					<select name="category" id="category">
						<option value="total">전체</option>
						</select>
				</form>
			</div> -->

					<div id="mentorList"></div>
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
		list();
	});

	function list() {
		if ($('#str').is(':checked') || $('#rCnt').is(':checked')) {

			$("#str").prop("checked", false);
			$('#label_str').css('color', '#aaa');

			$("#rCnt").prop("checked", false);
			$('#label_rcnt').css('color', '#aaa');
		}
		;
		$
				.ajax({
					url : '/toti/mentee/mentorList',
					type : 'GET',
					success : function(data) {
						var html = '';
						for (var i = 0; i < data.length; i++) {
							html += '<label for="pageBtn'+data[i].mento_idx+'" style="cursor:pointer"><div id="mentor">';
							html += '<input type="hidden" name="mento_idx" value="'+data[i].mento_idx+'">';
							html += '<table>';

							html += '<tr>';
							html += '<td rowspan="6" style=\"text-aline:center">';
							html += '<span id="photo">';
							html += '<img id="m_photo" src = "<c:url value="/uploadfile/'+data[i].m_photo+'"/>"';
							html += '</span></label>';
							html += '</td>';
							html += '</tr>';

							html += '<tr>';
							html += '<td>';
							/* html += '<h2>'+data[i].m_name + '</h2>' + data[i].cate_name + '</td>'; */
							html += '<h2>' + data[i].m_name + '</h2></td>';
							html += '</tr>';
							/* html += '제공 서비스 : ' + data[i].tor_sname+ '<br>'; */
							/* html += '활동가능 지역 : ' + data[i].tor_location+ '<br>'; */
							html += '<tr>';
							html += '<td><h5 style="color:black;">';
							if(data[i].p_shot == null){
								html += '';
							}else {
							html += data[i].p_shot;
							}
							html += '<h5></td>';
							html += '</tr>';
							html += '<tr>';
							html += '<td>';
							html += '<div id="starBox2">';

							var fullStar = '<span><img id=\"star\" src=\"https://d1hhkexwnh74v.cloudfront.net/icons/icon-common-review-star-small-full.svg\"></span>';
							var halfStar = '<span><img id=\"star\" src=\"https://d1hhkexwnh74v.cloudfront.net/icons/icon-common-review-star-small-half.svg\"></span>';

							if (data[i].str != 0) {
								if (data[i].str == 5) {
									for (var j = 0; j < 5; j++) {
										$('#starBox2').append(html += fullStar);

									}
									/* $('#starBox2').append(html+=fullStar);
									$('#starBox2').append(html+=fullStar);
									$('#starBox2').append(html+=fullStar);
									$('#starBox2').append(html+=fullStar);
									$('#starBox2').append(html+=fullStar); */

								} else if (data[i].str > 4 && data[i].str < 5) {
									for (var j = 0; j < 4; j++) {
										$('#starBox2').append(html += fullStar);
									}
									$('#starBox2').append(html += halfStar);

								} else if (data[i].str == 4) {
									for (var j = 0; j < 4; j++) {
										$('#starBox2').append(html += fullStar);
									}
								} else if (data[i].str > 3 && data[i].str < 4) {
									for (var j = 0; j < 3; j++) {
										$('#starBox2').append(html += fullStar);
									}
									$('#starBox2').append(html += halfStar);
								} else if (data[i].str == 3) {
									for (var j = 0; j < 3; j++) {
										$('#starBox2').append(html += fullStar);
									}
								} else if (data[i].str > 2 && data[i].str < 3) {
									for (var j = 0; j < 2; j++) {
										$('#starBox2').append(html += fullStar);
									}
									$('#starBox2').append(html += halfStar);
								} else if (data[i].str == 2) {
									for (var j = 0; j < 2; j++) {
										$('#starBox2').append(html += fullStar);
									}
								} else if (data[i].str > 1 && data[i].str < 2) {
									for (var j = 0; j < 2; j++) {
										$('#starBox2').append(html += fullStar);
									}
									$('#starBox2').append(html += halfStar);
								} else if (data[i].str == 1) {
									$('#starBox2').append(html += fullStar);
								} else {
									$('#starBox2').append(html += halfStar);
								}
								html += '<span style="margin-left:15px; font-size:12px;">'
										+ data[i].str + '</span>';
								html += '<span style="margin-left:15px; font-size:12px; font-weight:300; color:#aaa;">('
										+ data[i].cont_cnt + '개)</span>';
							}
							html += '</div>';
							html += '</td>';
							html += '</tr>';
							html += '<tr>';
							html += '<td>';
							if (data[i].str != 0) {
								html += '<span class="comment">최신 리뷰 </span>'
										+ data[i].review_cont;
							}/* else{
																						html+='<div>';
																						html+='리뷰없음';
																						html+='</div>';
																					} */

							html += '<button id="pageBtn' + data[i].mento_idx
									+ '" class="btn" onclick="selectMentor('
									+ data[i].mento_idx
									+ ')">고수 페이지로 이동</button>';
							html += '</td>';
							html += '</tr>';
							html += '</table>';

							//html += '<a href="/toti/mentorpage/'+data[i].mento_idx+'">고수 페이지</a>';
							html += '</div><label for="pageBtn'+data[i].mento_idx+'" style="cursor:pointer">';
							html += '<hr>'
						}
						$('#mentorList').html(html);
					}
				});
	}

	function search() {
		var stype = $('#stype option:selected').val();
		var keyword = $('#keyword').val();
		$('#mentorList').html('');
		if ($('#str').is(':checked') || $('#rCnt').is(':checked')) {

			$("#str").prop("checked", false);
			$('#label_str').css('color', '#aaa');

			$("#rCnt").prop("checked", false);
			$('#label_rcnt').css('color', '#aaa');
		}
		;
		$
				.ajax({
					url : '/toti/mentee/mentorList',
					type : 'GET',
					dataType : 'json',
					data : {
						stype : stype,
						keyword : keyword
					},
					contentType : 'application/json; charset=utf-8',
					success : function(data) {
						var html = '';
						for (var i = 0; i < data.length; i++) {
							html += '<label for="pageBtn'+data[i].mento_idx+'" style="cursor:pointer"><div id="mentor">';
							html += '<input type="hidden" name="mento_idx" value="'+data[i].mento_idx+'">';
							html += '<table>';

							html += '<tr>';
							html += '<td rowspan="6" style=\"text-aline:center">';
							html += '<span id="photo">';
							html += '<img id="m_photo" src = "<c:url value="/images/user/'+data[i].m_photo+'"/>"';
							html += '</span></label>';
							html += '</td>';
							html += '</tr>';

							html += '<tr>';
							html += '<td>';
							/* html += '<h2>'+data[i].m_name + '</h2>' + data[i].cate_name + '</td>'; */
							html += '<h2>' + data[i].m_name + '</h2></td>';
							html += '</tr>';
							/* html += '제공 서비스 : ' + data[i].tor_sname+ '<br>'; */
							/* html += '활동가능 지역 : ' + data[i].tor_location+ '<br>'; */
							html += '<tr>';
							html += '<td><h5 style="color:black;">';
							if(data[i].p_shot == null){
								html += '';
							}else {
							html += data[i].p_shot;
							}
							html += '<h5></td>';
							html += '</tr>';
							html += '<tr>';
							html += '<td>';
							html += '<div id="starBox2">';

							var fullStar = '<span><img id=\"star\" src=\"https://d1hhkexwnh74v.cloudfront.net/icons/icon-common-review-star-small-full.svg\"></span>';
							var halfStar = '<span><img id=\"star\" src=\"https://d1hhkexwnh74v.cloudfront.net/icons/icon-common-review-star-small-half.svg\"></span>';

							if (data[i].str != 0) {
								if (data[i].str == 5) {
									for (var j = 0; j < 5; j++) {
										$('#starBox2').append(html += fullStar);

									}
									/* $('#starBox2').append(html+=fullStar);
									$('#starBox2').append(html+=fullStar);
									$('#starBox2').append(html+=fullStar);
									$('#starBox2').append(html+=fullStar);
									$('#starBox2').append(html+=fullStar); */

								} else if (data[i].str > 4 && data[i].str < 5) {
									for (var j = 0; j < 4; j++) {
										$('#starBox2').append(html += fullStar);
									}
									$('#starBox2').append(html += halfStar);

								} else if (data[i].str == 4) {
									for (var j = 0; j < 4; j++) {
										$('#starBox2').append(html += fullStar);
									}
								} else if (data[i].str > 3 && data[i].str < 4) {
									for (var j = 0; j < 3; j++) {
										$('#starBox2').append(html += fullStar);
									}
									$('#starBox2').append(html += halfStar);
								} else if (data[i].str == 3) {
									for (var j = 0; j < 3; j++) {
										$('#starBox2').append(html += fullStar);
									}
								} else if (data[i].str > 2 && data[i].str < 3) {
									for (var j = 0; j < 2; j++) {
										$('#starBox2').append(html += fullStar);
									}
									$('#starBox2').append(html += halfStar);
								} else if (data[i].str == 2) {
									for (var j = 0; j < 2; j++) {
										$('#starBox2').append(html += fullStar);
									}
								} else if (data[i].str > 1 && data[i].str < 2) {
									for (var j = 0; j < 2; j++) {
										$('#starBox2').append(html += fullStar);
									}
									$('#starBox2').append(html += halfStar);
								} else if (data[i].str == 1) {
									$('#starBox2').append(html += fullStar);
								} else {
									$('#starBox2').append(html += halfStar);
								}
								html += '<span style="margin-left:15px; font-size:12px;">'
										+ data[i].str + '</span>';
								html += '<span style="margin-left:15px; font-size:12px; font-weight:300; color:#aaa;">('
										+ data[i].cont_cnt + '개)</span>';
							}
							html += '</div>';
							html += '</td>';
							html += '</tr>';
							html += '<tr>';
							html += '<td>';
							if (data[i].str != 0) {
								html += '<span class="comment">최신 리뷰 </span>'
										+ data[i].review_cont;
							}/* else{
																						html+='<div>';
																						html+='리뷰없음';
																						html+='</div>';
																					} */

							html += '<button id="pageBtn' + data[i].mento_idx
									+ '" class="btn" onclick="selectMentor('
									+ data[i].mento_idx
									+ ')">고수 페이지로 이동</button>';
							html += '</td>';
							html += '</tr>';
							html += '</table>';

							//html += '<a href="/toti/mentorpage/'+data[i].mento_idx+'">고수 페이지</a>';
							html += '</div><label for="pageBtn'+data[i].mento_idx+'" style="cursor:pointer">';
							html += '<hr>'
						}
						$('#mentorList').html(html);
					}
				});
		return false;
	}

	function listByReviewCnt() {
		$('#rCnt')
				.change(
						function() {
							if ($('#str').is(':checked')) {

								$("#str").prop("checked", false);
								$('#label_str').css('color', '#aaa');
							}
							;
							$
									.ajax({
										url : '/toti/mentee/mentorListByRCnt',
										type : 'GET',
										success : function(data) {
											if ($('#rCnt').is(':checked')) {
												$('#label_rcnt').css('color',
														'black');
												var html = '';
												for (var i = 0; i < data.length; i++) {
													html += '<label for="pageBtn'+data[i].mento_idx+'" style="cursor:pointer"><div id="mentor">';
													html += '<input type="hidden" name="mento_idx" value="'+data[i].mento_idx+'">';
													html += '<table>';

													html += '<tr>';
													html += '<td rowspan="6" style=\"text-aline:center">';
													html += '<span id="photo">';
													html += '<img id="m_photo" src = "<c:url value="/images/user/'+data[i].m_photo+'"/>"';
													html += '</span></label>';
													html += '</td>';
													html += '</tr>';

													html += '<tr>';
													html += '<td>';
													/* html += '<h2>'+data[i].m_name + '</h2>' + data[i].cate_name + '</td>'; */
													html += '<h2>' + data[i].m_name + '</h2></td>';
													html += '</tr>';
													/* html += '제공 서비스 : ' + data[i].tor_sname+ '<br>'; */
													/* html += '활동가능 지역 : ' + data[i].tor_location+ '<br>'; */
													html += '<tr>';
													html += '<td><h5 style="color:black;">';
													if(data[i].p_shot == null){
														html += '';
													}else {
													html += data[i].p_shot;
													}
													html += '<h5></td>';
													html += '</tr>';
													html += '<tr>';
													html += '<td>';
													html += '<div id="starBox2">';

													var fullStar = '<span><img id=\"star\" src=\"https://d1hhkexwnh74v.cloudfront.net/icons/icon-common-review-star-small-full.svg\"></span>';
													var halfStar = '<span><img id=\"star\" src=\"https://d1hhkexwnh74v.cloudfront.net/icons/icon-common-review-star-small-half.svg\"></span>';

													if (data[i].str != 0) {
														if (data[i].str == 5) {
															for (var j = 0; j < 5; j++) {
																$('#starBox2').append(html += fullStar);

															}
															/* $('#starBox2').append(html+=fullStar);
															$('#starBox2').append(html+=fullStar);
															$('#starBox2').append(html+=fullStar);
															$('#starBox2').append(html+=fullStar);
															$('#starBox2').append(html+=fullStar); */

														} else if (data[i].str > 4 && data[i].str < 5) {
															for (var j = 0; j < 4; j++) {
																$('#starBox2').append(html += fullStar);
															}
															$('#starBox2').append(html += halfStar);

														} else if (data[i].str == 4) {
															for (var j = 0; j < 4; j++) {
																$('#starBox2').append(html += fullStar);
															}
														} else if (data[i].str > 3 && data[i].str < 4) {
															for (var j = 0; j < 3; j++) {
																$('#starBox2').append(html += fullStar);
															}
															$('#starBox2').append(html += halfStar);
														} else if (data[i].str == 3) {
															for (var j = 0; j < 3; j++) {
																$('#starBox2').append(html += fullStar);
															}
														} else if (data[i].str > 2 && data[i].str < 3) {
															for (var j = 0; j < 2; j++) {
																$('#starBox2').append(html += fullStar);
															}
															$('#starBox2').append(html += halfStar);
														} else if (data[i].str == 2) {
															for (var j = 0; j < 2; j++) {
																$('#starBox2').append(html += fullStar);
															}
														} else if (data[i].str > 1 && data[i].str < 2) {
															for (var j = 0; j < 2; j++) {
																$('#starBox2').append(html += fullStar);
															}
															$('#starBox2').append(html += halfStar);
														} else if (data[i].str == 1) {
															$('#starBox2').append(html += fullStar);
														} else {
															$('#starBox2').append(html += halfStar);
														}
														html += '<span style="margin-left:15px; font-size:12px;">'
																+ data[i].str + '</span>';
														html += '<span style="margin-left:15px; font-size:12px; font-weight:300; color:#aaa;">('
																+ data[i].cont_cnt + '개)</span>';
													}
													html += '</div>';
													html += '</td>';
													html += '</tr>';
													html += '<tr>';
													html += '<td>';
													if (data[i].str != 0) {
														html += '<span class="comment">최신 리뷰 </span>'
																+ data[i].review_cont;
													}/* else{
																												html+='<div>';
																												html+='리뷰없음';
																												html+='</div>';
																											} */

													html += '<button id="pageBtn' + data[i].mento_idx
															+ '" class="btn" onclick="selectMentor('
															+ data[i].mento_idx
															+ ')">고수 페이지로 이동</button>';
													html += '</td>';
													html += '</tr>';
													html += '</table>';

													//html += '<a href="/toti/mentorpage/'+data[i].mento_idx+'">고수 페이지</a>';
													html += '</div><label for="pageBtn'+data[i].mento_idx+'" style="cursor:pointer">';
													html += '<hr>'
												}
												$('#mentorList').html(html);
											}
										}
									});
							return false;

						});
	}

	function listByStr() {
		$('#str')
				.change(
						function() {
							if ($('#rCnt').is(':checked')) {

								$("#rCnt").prop("checked", false);
								$('#label_rcnt').css('color', '#aaa');
							}
							;

							$
									.ajax({
										url : '/toti/mentee/mentorListByStr',
										type : 'GET',
										success : function(data) {
											if ($('#str').is(':checked')) {

												$('#label_str').css('color',
														'black');
												var html = '';
												for (var i = 0; i < data.length; i++) {
													html += '<label for="pageBtn'+data[i].mento_idx+'" style="cursor:pointer"><div id="mentor">';
													html += '<input type="hidden" name="mento_idx" value="'+data[i].mento_idx+'">';
													html += '<table>';

													html += '<tr>';
													html += '<td rowspan="6" style=\"text-aline:center">';
													html += '<span id="photo">';
													html += '<img id="m_photo" src = "<c:url value="/images/user/'+data[i].m_photo+'"/>"';
													html += '</span></label>';
													html += '</td>';
													html += '</tr>';

													html += '<tr>';
													html += '<td>';
													/* html += '<h2>'+data[i].m_name + '</h2>' + data[i].cate_name + '</td>'; */
													html += '<h2>' + data[i].m_name + '</h2></td>';
													html += '</tr>';
													/* html += '제공 서비스 : ' + data[i].tor_sname+ '<br>'; */
													/* html += '활동가능 지역 : ' + data[i].tor_location+ '<br>'; */
													html += '<tr>';
													html += '<td><h5 style="color:black;">';
													if(data[i].p_shot == null){
														html += '';
													}else {
													html += data[i].p_shot;
													}
													html += '<h5></td>';
													html += '</tr>';
													html += '<tr>';
													html += '<td>';
													html += '<div id="starBox2">';

													var fullStar = '<span><img id=\"star\" src=\"https://d1hhkexwnh74v.cloudfront.net/icons/icon-common-review-star-small-full.svg\"></span>';
													var halfStar = '<span><img id=\"star\" src=\"https://d1hhkexwnh74v.cloudfront.net/icons/icon-common-review-star-small-half.svg\"></span>';

													if (data[i].str != 0) {
														if (data[i].str == 5) {
															for (var j = 0; j < 5; j++) {
																$('#starBox2').append(html += fullStar);

															}
															/* $('#starBox2').append(html+=fullStar);
															$('#starBox2').append(html+=fullStar);
															$('#starBox2').append(html+=fullStar);
															$('#starBox2').append(html+=fullStar);
															$('#starBox2').append(html+=fullStar); */

														} else if (data[i].str > 4 && data[i].str < 5) {
															for (var j = 0; j < 4; j++) {
																$('#starBox2').append(html += fullStar);
															}
															$('#starBox2').append(html += halfStar);

														} else if (data[i].str == 4) {
															for (var j = 0; j < 4; j++) {
																$('#starBox2').append(html += fullStar);
															}
														} else if (data[i].str > 3 && data[i].str < 4) {
															for (var j = 0; j < 3; j++) {
																$('#starBox2').append(html += fullStar);
															}
															$('#starBox2').append(html += halfStar);
														} else if (data[i].str == 3) {
															for (var j = 0; j < 3; j++) {
																$('#starBox2').append(html += fullStar);
															}
														} else if (data[i].str > 2 && data[i].str < 3) {
															for (var j = 0; j < 2; j++) {
																$('#starBox2').append(html += fullStar);
															}
															$('#starBox2').append(html += halfStar);
														} else if (data[i].str == 2) {
															for (var j = 0; j < 2; j++) {
																$('#starBox2').append(html += fullStar);
															}
														} else if (data[i].str > 1 && data[i].str < 2) {
															for (var j = 0; j < 2; j++) {
																$('#starBox2').append(html += fullStar);
															}
															$('#starBox2').append(html += halfStar);
														} else if (data[i].str == 1) {
															$('#starBox2').append(html += fullStar);
														} else {
															$('#starBox2').append(html += halfStar);
														}
														html += '<span style="margin-left:15px; font-size:12px;">'
																+ data[i].str + '</span>';
														html += '<span style="margin-left:15px; font-size:12px; font-weight:300; color:#aaa;">('
																+ data[i].cont_cnt + '개)</span>';
													}
													html += '</div>';
													html += '</td>';
													html += '</tr>';
													html += '<tr>';
													html += '<td>';
													if (data[i].str != 0) {
														html += '<span class="comment">최신 리뷰 </span>'
																+ data[i].review_cont;
													}/* else{
																												html+='<div>';
																												html+='리뷰없음';
																												html+='</div>';
																											} */

													html += '<button id="pageBtn' + data[i].mento_idx
															+ '" class="btn" onclick="selectMentor('
															+ data[i].mento_idx
															+ ')">고수 페이지로 이동</button>';
													html += '</td>';
													html += '</tr>';
													html += '</table>';

													//html += '<a href="/toti/mentorpage/'+data[i].mento_idx+'">고수 페이지</a>';
													html += '</div><label for="pageBtn'+data[i].mento_idx+'" style="cursor:pointer">';
													html += '<hr>'
												}
												$('#mentorList').html(html);
											}
										}
									});
							return false;

						});
	}
	function selectMentor(mento_idx) {
		location.href = "/toti/mentor/" + mento_idx;
	}
</script>
</html>