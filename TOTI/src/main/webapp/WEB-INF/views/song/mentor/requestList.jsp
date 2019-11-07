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
text-align: center;
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
overflow: hidden;
}

#m_photo{
width: 100px;
height: 100px;
border-radius: 50%;
text-align: center;
margin:30px 0;
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
margin-left: 10%;
margin-right : 0;
width :200px;

white-space: nowrap; 
overflow: hidden;
text-overflow: ellipsis;

}

</style>
</head>
<body>
	
	<!-- page container -->
	<div>
		
		<%@include file="/WEB-INF/views/frame/nav.jsp"%>
		
		 <section id="page-breadcrumb">
        <div class="vertical-center sun">
             <div class="container">
                <div class="row">
                    <div class="action">
                        <div class="col-sm-12">
                            <h1 class="title">요청서 리스트</h1>
                            <p>고객으로 받은 요청서</p>
                            <hr>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
        
    <section id="blog" class="padding-bottom">
        <div class="container">
            <div class="row">
                   <div class="col-md">
                       <input type="hidden" name="mento_idx" id="mento_idx" value="${idx}">
				
				
				<div id="noList"></div>
				<div id="requestList"></div>
                
                    </div>
                </div>
            </div>
    </section>
    <!--/#blog-->
		
		<!-- footer -->
		<%@include file="/WEB-INF/views/frame/footer.jsp"%>
	</div>
</body>
<script>
	$(document).ready(function() {	
		list($('#mento_idx').val());
		
	
	});

	function list(mento_idx) {
		$.ajax({
					url : '/toti/mentor/requestList/'+mento_idx,
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
							var month = (date.getMonth()+1);
							var day = (date.getDate()-1);
							
							html += '<div id="list"><label for="estimateBtn('+data[i].request_idx+')" style="cursor:pointer">';
							html += '<div><img id="m_photo" src = "<c:url value="/uploadfile/'+data[i].m_photo+'"/>"</div><br>';
							html += '<div id="listInfo"><h3>'
							html += data[i].m_name+'(' + data[i].service_name
									+ ')</h3>';
							html += '<h5><span class="comment" id="cont">요청 사항 </span>';
							html += '<span id="cont">'+data[i].answer_cont+'</span></h5>';
							html += '<span style="font-size:11px; color:#000; font-weight:400; margin-right:20px;">'+year+'.'+month+'.'+day+'</span>';
							html += '</div>'
							html += '<button id= "estimateBtn('+data[i].request_idx+')" class="btn" onclick="selectRequest('
							+ data[i].request_idx + ')">이동</button><br>';
							html += '</label></div>';
							html += '</div>';
						}
						}
						$('#requestList').html(html);
						$('#noList').html(noList);
					}
				});
	}

	function selectRequest(request_idx) {
		location.href = "/toti/requestList/" + request_idx;
	}

</script>
</html>