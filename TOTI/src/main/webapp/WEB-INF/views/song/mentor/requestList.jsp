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
	width: 70%;
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

.btn{
display:none;
} 

.labelfor{
color: #aaa; 
font-size:13px;
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
				
				<div id="requestList"></div>
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
					url : 'http://localhost:8080/toti/mentor/requestList',
					type : 'GET',
					success : function(data) {
						var html = '';
						for (var i = 0; i < data.length; i++) {
							
							var date = new Date(data[i].request_date);
							var year = date.getFullYear();
							var month = date.getMonth();
							var day = date.getDate();
							
							html += '<div id="list">';
							html += '<table>';
							
							html += '<tr>';
							html += '<td rowspan="2" style=\"width: 120px; height: 120px;padding-left:15%; text-aline:center">';
							html += '<span id="photo">';
							html += data[i].m_photo + '<br>';
							html += '</span>';
							html += '</td>';
							html += '</tr>';

							html += '<tr colspan=2>';
							html += '<td>';
							html += data[i].m_name + '(' +data[i].cate_name+'-'+ data[i].service_name
									+ ')<br>';
							html += '요청 사항: ';
							html += '<span class="comment">';
							html += data[i].answer_cont;
							html += '</span><br>'+year+'-'+month+'-'+day+'</td>';
							
							html += '</tr>';
							
							
							html += '</table>';
							html += '<td rowspan="2" style=\"width: 120px; height: 120px;padding-left:15%; text-aline:center">';
							html += '<button id="delBtn" onclick="del("'+data[i].request_idx+'")" style="color:black;" value="삭제">';
							html += '</td>';
							//html += '<a href="http://localhost:8080/toti/mentorpage/'+data[i].mento_idx+'">고수 페이지</a>';
							html += '</div>';
						}
						$('#requestList').html(html);
					}
				});
	}

	/* function del(request_idx){
		$.ajax(function(){
			url : 'http://localhost:8080/toti/mentor/requestList/'+request_idx,
			type:'DELETE',
			success : function(data){
				if (data =='success'){
					alert('삭제 되었습니다.');
					list();
				}
			}
		});
	} */
	
</script>
</html>