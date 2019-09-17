<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
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
}

.wrapper {
	width: 70%;
	margin: 20px auto;
}

#searchDiv {
	height: 10px;
}

#searchDiv span:first-child {
	margin : 20px 40px;
	float: left;
}

#searchDiv span:last-child{
	float: right;
	width: 25%;
}

#stype {
	border: 0px;
}

#keyword {
	padding-left: 5px;
	width: 50%;
}

input[type=checkbox] {
	display: none; 
}

#mentor {
	margin: 5px auto;
	height: 70%;
	
}

table {
	width: 100%;
	height: 80%;
	float: left;
	text-align: left;
	margin: 10px 0;
}

table td:nth-child(1) {
	width: 30%;
}
table td:nth-child(2) {
	width: 40%;
}
table td:nth-child(3) {
	width: 30%;
}

.comment{
padding-top: 10px;
}
#photo {
	width: 120px;
	height: 120px;
	border-radius: 50%;
}

#pageBtn{
display:none;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/frame/loading.jsp"%>
	<!-- page container -->
	<div>
		<%@include file="/WEB-INF/views/frame/contents/contentsHeader.jsp"%>
		<%@include file="/WEB-INF/views/frame/contents/nav.jsp"%>
		<!-- demo content -->
		<div class="wrapper">
			<!-- container -->
			<div id="mainwrapper">
				<div id="searchDiv">
					<span> <input type="checkbox" id="rCnt" name="rCnt"
						value=true onclick="listByReviewCnt()"><label for="rCnt"
						style="cursor: pointer"><strong id="label_rcnt" style="color: #aaa; font-size:13px;">리뷰순</strong></label>
					</span> <span>
						<form id="searchForm" method="post" onsubmit="return false">
							<select name="stype" id="stype">
								<option value="both">분야+멘토명</option>
								<option value="cate">분야</option>
								<option value="name">멘토명</option>
							</select> <input type="text" name="keyword" id="keyword"> <input
								type="submit" class="btn" id="searchBtn" value="검색"
								onclick="search()">
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
		<!-- end demo content -->
		<!-- footer -->
		<%@include file="/WEB-INF/views/frame/contents/footer.jsp"%>
	</div>
</body>
<script>
	$(document).ready(function() {
		list();
	});

	function list() {
		$
				.ajax({
					url : 'http://localhost:8080/toti/mentee/mentorList',
					type : 'GET',
					success : function(data) {
						var html = '';
						for (var i = 0; i < data.length; i++) {
							html += '<div id="mentor">';
							html += '<input type="hidden" name="mento_idx" value="'+data[i].mento_idx+'">';
							html += '<table>';

							html += '<tr>';
							html += '<td rowspan="3" style=\"width: 120px; height: 120px;padding-left:15%; text-aline:center">';
							html += '<label for="pageBtn" style="cursor:pointer"><span id="photo">';
							html += data[i].m_photo + '<br>';
							html += '</span></label>';
							html += '</td>';
							html += '</tr>';

							html += '<tr colspan=3>';
							html += '<td>';
							html += data[i].m_name + '(' + data[i].cate_name
									+ ')<br>';
							html += '활동가능 지역 : ' + data[i].tor_location+'<br>';
							html += '<span class="comment"><h5 style="color:black;letter-spacing:3px;">';
							html += data[i].p_shot;
							html += '<h5></span></td>';
							

							html += '<td>';
							html += '최근 평점 :' + data[i].review_star;
							html += '<br>';
							html += '<span class="comment">최신 리뷰 : ' + data[i].review_cont;
							html += '</span></td>';
							html += '</tr>';							
							html += '</table>';
							html += '<button id="pageBtn" class="btn" onclick="selectMentor('
									+ data[i].mento_idx + ')">고수 페이지로 이동</button>';
							//html += '<a href="http://localhost:8080/toti/mentorpage/'+data[i].mento_idx+'">고수 페이지</a>';
							html += '</div>';
						}
						$('#mentorList').html(html);
					}
				});
	}

	function search() {
		var stype = $('#stype option:selected').val();
		var keyword = $('#keyword').val();
		$('#mentorList').html('');
		$.ajax({
			url : 'http://localhost:8080/toti/mentee/mentorList',
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
					html += '<div id="mentor">';
					html += '<input type="hidden" name="mento_idx" value="'+data[i].mento_idx+'">';
					html += '<table>';

					html += '<tr>';
					html += '<td rowspan="3" style=\"width: 120px; height: 120px;padding-left:15%; text-aline:center">';
					html += '<label for="pageBtn" style="cursor:pointer"><span id="photo">';
					html += data[i].m_photo + '<br>';
					html += '</span></label>';
					html += '</td>';
					html += '</tr>';

					html += '<tr colspan=3>';
					html += '<td>';
					html += data[i].m_name + '(' + data[i].cate_name
							+ ')<br>';
					html += '활동가능 지역 : ' + data[i].tor_location+'<br>';
					html += '<span class="comment"><h5 style="color:black;letter-spacing:3px;">';
					html += data[i].p_shot;
					html += '<h5></span></td>';
					

					html += '<td>';
					html += '최근 평점 :' + data[i].review_star;
					html += '<br>';
					html += '<span class="comment">최신 리뷰 : ' + data[i].review_cont;
					html += '</span></td>';
					html += '</tr>';							
					html += '</table>';
					html += '<button id="pageBtn" class="btn" onclick="selectMentor('
							+ data[i].mento_idx
							+ ')">고수 페이지로 이동</button>';
					//html += '<a href="http://localhost:8080/toti/mentorpage?mento_idx='+data[i].mento_idx+'">고수 페이지</a>';
					html += '</div>';
				}
				$('#mentorList').html(html);
			}
		});
		return false;
	}

	function listByReviewCnt() {
		$('#rCnt').change(
						function() {

							$.ajax({
										url : 'http://localhost:8080/toti/mentee/mentorListByRCnt',
										type : 'GET',
										success : function(data) {
											if ($('#rCnt').is(':checked')) {
												$('#label_rcnt').css('color','black');
												var html = '';
												for (var i = 0; i < data.length; i++) {
													html += '<div id="mentor">';
													html += '<input type="hidden" name="mento_idx" value="'+data[i].mento_idx+'">';
													html += '<table>';

													html += '<tr>';
													html += '<td rowspan="3" style=\"width: 120px; height: 120px;padding-left:15%; text-aline:center">';
													html += '<label for="pageBtn" style="cursor:pointer"><span id="photo">';
													html += data[i].m_photo + '<br>';
													html += '</span></label>';
													html += '</td>';
													html += '</tr>';

													html += '<tr colspan=3>';
													html += '<td>';
													html += data[i].m_name + '(' + data[i].cate_name
															+ ')<br>';
													html += '활동가능 지역 : ' + data[i].tor_location+'<br>';
													html += '<span class="comment"><h5 style="color:black;letter-spacing:1px;">';
													html += data[i].p_shot;
													html += '<h5></span></td>';
													

													html += '<td>';
													html += '최근 평점 :' + data[i].review_star;
													html += '<br>';
													html += '<span class="comment">최신 리뷰 : ' + data[i].review_cont;
													html += '</span></td>';
													html += '</tr>';							
													html += '</table>';
													html += '<button id="pageBtn" class="btn" onclick="selectMentor('
															+ data[i].mento_idx
															+ ')">고수 페이지로 이동</button>';
													//html += '<a href="http://localhost:8080/toti/mentorpage?mento_idx='+data[i].mento_idx+'">고수 페이지</a>';
													html += '</div>';
												}
												$('#mentorList').html(html);
											}
										}
									});
							return false;

						});
		}
		function selectMentor(mento_idx) {
			location.href = "http://localhost:8080/toti/mentorpage/" + mento_idx;
		}

		/* function mentorPage(mento_idx) {
			$('#pageBtn').click(function() {
				$('#mainwrapper').css('display', 'none');
				$.ajax({
					url : 'http://localhost:8080/toti/mentorpage/' + mento_idx,
					type : 'GET',
					dataType : 'json',
					success : function(data) {
						var html = '';
						for (var i = 0; i < data.length; i++) {
							html += data[0].m_photo+'<br>'; 
							html += data[0].mento_idx+'<br>';
							html += data[0].m_name+'<br>';
							html += data[0].cate_idx+'<br>';
							html += data[0].cate_name+'<br>';
							html += data[0].p_shot+'<br>';
							break;
						}
						for (var i = 0; i < data.length; i++) {
							html += data[i].review_cont+'<br>';
						}
						$('#mentorPage').html(html);
					}
				});
				return false;
			});
		} */

	
</script>
</html>