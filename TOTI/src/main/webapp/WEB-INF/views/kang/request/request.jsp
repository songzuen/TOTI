<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/frame/header.jsp" %>
	<title>TOTI</title>
</head><!--/head-->
<body>
	<%@ include file="/WEB-INF/views/frame/nav.jsp" %>
    <!--/#header-->
    <section id="page-breadcrumb">
        <div class="vertical-center sun">
             <div class="container">
                <div class="row">
                    <div class="action">
                        <div class="col-sm-12">
                            <h1 class="title">요청서보냄</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/#action-->
    
    <section id="blog" class="padding-top padding-bottom">
        <div class="container">
            <div class="row">
				<div class="col-md">
					<input type="hidden" value="${request_idx}" id="request_idx">
					<input type="hidden" value="1" id="m_idx"> 견적서를 기다려주세요!<br>
					<hr>
					작성한 요청서
					<div id="request">
					
					</div>
				</div>
			</div>
            </div>
    </section>
    <!--/#blog-->
    
	<%@ include file="/WEB-INF/views/frame/footer.jsp" %>

	<script>
		
	$(document).ready(function() {
		
		rquestData();
	
	});

	function rquestData() {

		$.ajax({
			url : 'http://localhost:8080/toti/requestData',
			type : 'GET',
			data : {
				request_idx : $('#request_idx').val(),
				m_idx : $('#m_idx').val()
			},
			success : function(data) {
				
				var html = '';
				
				html += '<img alt="이미지없음" height="100px" src="<c:url value="/images/user/'+data.userInfo.m_photo+'" />"><br>';
				html += data.userInfo.m_name+'님';
				html += '<p style="text-align: right;">'+data.request_date+'</p>';
				html += '<p>분야 : '+data.cate_name+'</p>';
				html += '<p>선택한 서비스 : '+data.service_name+'</p>';
				
				for (var i = 0; i < data.answer.length; i++) {
					
					html += '<p>'+data.answer[i].quest_name+'</p>';
					html += '<p>'+data.answer[i].answer_cont+'</p>';
					
				}

				$('#request').html(html);
				
			}

		});
		
	}
	
	</script>
</body>
</html>