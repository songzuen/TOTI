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
                            <h1 class="title"><a href="<c:url value="/requests" />">분야찾기</a></h1>
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
					<div class="sidebar-item popular">
						<ul class="gallery" id="kate_ul">
							
						</ul>
					</div>
				</div>
			</div>
            </div>
    </section>
    <!--/#blog-->
    
	<%@ include file="/WEB-INF/views/frame/footer.jsp" %>

	<script>
		
	var idx = "${ idx }";
	
	$(document).ready(function() {
		
		kateList();
	
	});

	function kateList() {
		
		$.ajax({
			url : '../kategorieList',
			type : 'GET',
			success : function(data) {
				
				var html = '';
				for (var i = 0; i < data.length-1; i++) {
					
					html += '<li><a onclick="selectR('+data[i].cate_idx+', '+idx+')">';
					html += '<img src="<c:url value="/images/request/'+data[i].cate_img+'" ></a></li>';
					
					
					html += '<div class="col-sm-4 text-center wow fadeIn" data-wow-duration="1000ms" data-wow-delay="300ms">\n';
					html += '<a onclick="selectR('+data[i].cate_idx+', '+idx+')" >\n';
					html += '<div class="single-service">\n';
					html += '<div style="padding: 50px; border: 1px solid; margin: 20px;">\n';
					html += '<h2>'+data[i].cate_name+'</h2>\n';
					html += '<p style="width: 230px; padding: 0;">'+data[i].cate_con+'</p>\n';
					html += '</div></div></a></div>';
				}
				
				$('#kate_ul').html(html);

			}
		});
	}
	
	function selectR(cate_idx){			
		
		if(idx != '' && idx != null){
			
			$.ajax({
				url : 'getkateidx/'+idx,
				type : 'GET',
				success : function(data) {
					
					if(cate_idx == data) {
						alert('자신의 분야에는 요청하실 수 없습니다.');
					}else {
						location.href = '<c:url value="/request?cate_idx='+cate_idx+'" />';
					}
					
				}
			});
			
		}else {
			alert('로그인 후 이용해주세요.');
			location.href = '<c:url value="/login" />';
		}
		
	}
	
	</script>
</body>
</html>