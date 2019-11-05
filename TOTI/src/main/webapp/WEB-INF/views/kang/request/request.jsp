<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/frame/header.jsp" %>
	<link href="<c:url value="/css/daheeCss/daheecontents.css" />" rel="stylesheet">
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
                            <h1 class="title"><a href="<c:url value="/requests" />">보낸 요청서</a></h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/#action-->
    
    <section id="blog" class="padding-bottom">
        <div class="container">
            <div class="row">
				<div class="col-md">
					<input type="hidden" value="${request_idx}" id="request_idx">
					<input type="hidden" value="${ idx }" id="m_idx">
					<div id="cate_select_wrap">
                         <a onclick="history.back()"><i class="fa fa-chevron-left"></i><span>이전으로</span></a>
                    </div>
					<div id="request">
						<div id="myRequest"></div>
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
			url : 'request/requestData',
			type : 'GET',
			data : {
				request_idx : $('#request_idx').val(),
				m_idx : $('#m_idx').val()
			},
			success : function(data) {
				
				var html = '';
				
				html += '<img src="<c:url value="/uploadfile/'+data.userInfo.m_photo+'"/>">';
				html += '<div id="requesr_user"><p>'+data.request_date+'</p>';
				html += '<h2>'+data.cate_name+'('+data.service_name+')</h2><h3>'+data.userInfo.m_name+'님</h3></div>';
				html += '<div id="request_con">'
				
				for (var i = 0; i < data.answer.length; i++) {
					html += '<p class="con_p1">'+data.answer[i].quest_name+'</p>';
					html += '<p class="con_p2">'+data.answer[i].answer_cont+'</p>';			
				}
				
				html += '</div>';

				$('#myRequest').html(html);
			}

		});
		
	}
	
	</script>
</body>
</html>