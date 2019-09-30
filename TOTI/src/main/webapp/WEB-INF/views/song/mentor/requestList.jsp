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
letter-spacing: 1px;
}
body{
overflow: auto
}

.wrapper {
	width: 60%;
	margin: 20px auto;
}
#requestList{
width: 100%;
height:100%;
}
#nList{
width: 500px;
margin: 70px auto;
border: 1px solid #ddd;
border-radius: 5px;
padding: 20px 10px;
text-align: center;
}

#list{
margin : 10px 10px;
padding-bottom : 10px;
float: left;
text-align: center;
width: 200px;
height:  300px;

border: 1px solid #ddd;
border-radius: 7px;

}
/* #requestList :hover{
background-color: #F2F3CA;
} */

img{
width: 100px;
border-radius: 50%;
text-align: center;
margin: 30px 0;
}

#photo{
margin-bottom: 20px;
}

.btn{
display:none;
} 
.comment{
width:16px;
padding-right : 3px; 
color: #a0a0a0;
}
#listInfo{
text-align: left;
margin-left: 30px;
margin-right : 10px;
width :150px;

white-space: nowrap; 
overflow: hidden;
text-overflow: ellipsis;

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
				<!-- <h3 style="margin-bottom: 30px;">요청서</h3> -->
				<!-- 세션 값으로 바꿔야함 -->
				<input type="hidden" name="mento_idx" id="mento_idx" value="3">
				
				
				<div id="noList"></div>
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
						var noList='';

						if (data.length ==0){
							noList += '<div id="nList">';
							noList += '<h2> 아직 받은 요청서가 없어요</h2>'
							noList += '</div>';
						} 
						else{
						for (var i = 0; i < data.length; i++) {
							
							var date = new Date(data[i].request_date);
							var year = date.getFullYear();
							var month = date.getMonth();
							var day = date.getDate();
							
							html += '<label for="estimateBtn('+data[i].request_idx+')" style="cursor:pointer"><div id="list">';
							html += '<div><img src = "<c:url value="/img/user/'+data[i].m_photo+'"/>"</div><br>';
							html += '<div id="listInfo"><h3>'
							html += data[i].m_name+'(' + data[i].service_name
									+ ')</h3>';
							html += '<br><h5><span class="comment" id="cont">요청 사항 </span><br>';
							html += '<span id="cont">'+data[i].answer_cont+'</span></h5>';
							html += '<br><span style="font-size:11px; color:#000; font-weight:400; margin-right:20px;">'+year+'.'+month+'.'+day+'</span>';
							html += '</div>'
							html += '<button id= "estimateBtn('+data[i].request_idx+')" class="btn" onclick="selectRequest('
							+ data[i].request_idx + ')">이동</button><br>';
							html += '</div></label>';
							html += '</div>';
						}
						}
						$('#requestList').html(html);
						$('#noList').html(noList);
					}
				});
	}

	function selectRequest(request_idx) {
		location.href = "http://localhost:8080/toti/requestList/" + request_idx;
	}

</script>
</html>