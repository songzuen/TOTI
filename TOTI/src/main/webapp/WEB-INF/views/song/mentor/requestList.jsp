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
h1,h2,h3,h4,h5,h6{
color:black;
}
body{
overflow: auto
}

.wrapper {
	width: 60%;
	margin: 20px auto;
}
#requestList{
width: 100%
}
#list{
margin : 10px 20px;
padding : 5px;
float: left;
text-align: center;
width: 200px;
height: 200px;
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
				
				<!-- 세션 값으로 바꿔야함 -->
				<input type="hidden" name="mento_idx" id="mento_idx" value="3">
				
				
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
		list($('#mento_idx').val());
	});

	function list(mento_idx) {
		$.ajax({
					url : 'http://localhost:8080/toti/mentor/requestList/'+mento_idx,
					type : 'GET',
					success : function(data) {
						var html = '';
						html += '<h3>요청서</h3><hr>';
						for (var i = 0; i < data.length; i++) {
							
							var date = new Date(data[i].request_date);
							var year = date.getFullYear();
							var month = date.getMonth();
							var day = date.getDate();
							
							/* if (data.length=0){
								html += '<div id="list">';
								html += '<h2>요청받은 데이터 없습니다.</h2>'
								html += '</div>';
							} */
							
							html += '<label for="estimateBtn('+data[i].request_idx+')" style="cursor:pointer"><div id="list">';
							html += '<span id="photo">';
							html += data[i].m_photo;
							html += '</span><br>';	
							
							html += data[i].m_name+'(' + data[i].service_name
									+ ')<br>';
							html += '요청 사항: ';
							html += '<span class="comment">';
							html += data[i].answer_cont;
							html += '</span><br>'+year+'-'+month+'-'+day;
							
							html += '<button id= "estimateBtn('+data[i].request_idx+')" class="btn" onclick="selectRequest('
							+ data[i].request_idx + ')">이동</button>';
							//html += '<a href="http://localhost:8080/toti/mentorpage/'+data[i].mento_idx+'">고수 페이지</a>';
							html += '</div></label>';
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
	
	function selectRequest(request_idx) {
		//location.href = "http://localhost:8080/toti/estimate/" + request_idx;
		location.href = "http://localhost:8080/toti/requestList/" + request_idx;
	}

</script>
</html>