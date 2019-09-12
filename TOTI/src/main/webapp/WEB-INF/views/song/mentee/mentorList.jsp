<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	width: 80%;
	margin: 20px auto;
}

#searchDiv {
	float: right;
	height: 30px;
}

#keyword {
	width: 50%;
	border-bottom: 1px solid #bbb;
	height: 30px;
	line-height: 30px;
}

#mentor {
	border-bottom: 1px solid #ddd;
}

#photo {
	width: 150px;
	height: 150px;
	border-radius: 50%;
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
			<div id="mentorPage"></div>
			<div id="mainwrapper">
				<div id="searchDiv">
					<form id="searchForm" method="post" onsubmit="return false">
						<select name="stype" id="stype">
							<option value="both">분야+멘토명</option>
							<option value="cate">분야</option>
							<option value="name">멘토명</option>
						</select> <input type="text" name="keyword" id="keyword"> <input
							type="submit" value="검색" onclick="search()">
					</form>
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
		$.ajax({
			url : 'http://localhost:8080/toti/mentee/mentorList',
			type : 'GET',
			dataType : 'json',
			success : function(data) {
				var html = '';
				for (var i = 0; i < data.length; i++) {
					html += '<div id="mentor">';
					html += '<input type="hidden" name="mento_idx">'
							+ data[i].mento_idx;
					html += '<span id="photo">';
					html += data[i].m_photo + '<br>';
					html += '</span>'
					html += '<span>' + data[i].m_name + '(' + data[i].cate_name
							+ ')<br>';
					html += '활동가능 지역 : ' + data[i].tor_location + '<br>';
					html += data[i].p_shot + '<br>';
					html += '최근 평점 : ' + data[i].review_star + '<br>';
					html += '최신 리뷰 : ' + data[i].review_cont + '</span>';
					html += '<button id="pageBtn" onclick="mentorPage('
							+ data[i].mento_idx + ')">고수 페이지로 이동<button>';
					html += '</div>';
				}
				$('#mentorList').html(html);
			}
		});
		return false;
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
					html += '<span id="photo">';
					html += data[i].m_photo + '<br>';
					html += '</span>'
					html += '<span>' + data[i].m_name + '(' + data[i].cate_name
							+ ')<br>';
					html += '활동가능 지역 : ' + data[i].tor_location + '<br>';
					html += data[i].p_shot
					html += '평점 : ' + data[i].review_star;
					html += '최신 리뷰 : ' + data[i].review_cont + '</span>';
					html += '</div>';
				}
				$('#mentorList').html(html);
			}
		});
		return false;
	}

	function mentorPage(mento_idx) {
		$('#pageBtn').click(function() {
			$('#mainwrapper').css('display', 'none');
			$.ajax({
				url : 'http://localhost:8080/toti/mentorpage/' + mento_idx,
				type : 'GET',
				dataType : 'json',
				success : function(data) {
					var html = '';
					for (var i = 0; i < data.length; i++) {
						/* html += data[0].m_photo+'<br>'; */
						html += data[0].mento_idx+'<br>';
						html += data[0].m_name+'<br>';
						/* html += data[0].cate_idx+'<br>'; */
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
		});
	}
</script>
</html>