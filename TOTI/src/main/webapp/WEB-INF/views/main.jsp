<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/frame/header.jsp" %>
    <title>TOTI</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/frame/nav.jsp" %>
    <!--/#header-->
    <section id="home-slider">
        <div class="container">
            <div class="row">
                <div class="main-slider">
                     <div class="slide-text">
                        <h1>원하는 분야의 멘토를 소개해드립니다.</h1>
                        <p>어떤 분야의 전문가를 찾으시나요? 원하는 분야의 멘토를 찾아 매칭해드립니다. 분야를 선택하여 요청서를 작성해보세요!</p>
                        <a href="#cate_select" class="btn btn-common">분야찾기</a>
                    </div>
                    <img src="images/home/slider/hill.png" class="slider-hill" alt="slider image">
                    <img src="images/home/slider/house.png" class="slider-house" alt="slider image">
                    <img src="images/home/slider/sun.png" class="slider-sun" alt="slider image">
                    <img src="images/home/slider/birds1.png" class="slider-birds1" alt="slider image">
                    <img src="images/home/slider/birds2.png" class="slider-birds2" alt="slider image">
                </div>
            </div>
        </div>
        <div class="preloader"><i class="fa fa-sun-o fa-spin"></i></div>
    </section>
    <!--/#home-slider-->

    <section id="services">
        <div class="container">
            <div class="row">
                <div id="cate_select" style="padding: 20px 0 20px 30px;">
                    <h2>원하는 분야를 선택하세요.</h2>
                </div>
                <div id="cate_wrap">
                
                </div>
            </div>
        </div>
    </section>
    <!--/#services-->
    <section id="action" class="responsive">
        <div class="vertical-center">
             <div class="container">
                <div class="row">
                    <div class="action take-tour">
                        <div class="col-sm-7 wow fadeInLeft" data-wow-duration="500ms" data-wow-delay="300ms">
                            <h1 class="title">어떤 멘토를 원하세요?</h1>
                            <p>배우고싶은 분야, 원하는 분야의 멘토와 수업해보세요! </p>
                        </div>
                        <div class="col-sm-5 text-center wow fadeInRight" data-wow-duration="500ms" data-wow-delay="300ms">
                            <div class="tour-button">
                                <a href="#cate_select" class="btn btn-common">분야찾기</a>
                             </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
   </section>
    <!--/#action-->

    <section id="features">
        <div class="container">
            <div id="cate_list" class="row">

            </div>
        </div>
    </section>
     <!--/#features-->
     
	<%@ include file="/WEB-INF/views/frame/footer.jsp" %>
	
    <script>
    	
    	var idx = "${ idx }";
        	
		$(document).ready(function() {
			kategorieList();
					
		});
		
		function kategorieList() {
			
			$.ajax({
				url : 'kategorieList',
				type : 'GET',
				success : function(data) {
					
					var html = '';
					for (var i = 0; i < data.length-1; i++) {
						html += '<div class="col-sm-4 text-center wow fadeIn" data-wow-duration="1000ms" data-wow-delay="300ms">\n';
						html += '<a onclick="selectR('+data[i].cate_idx+', '+idx+')" >\n';
						html += '<div class="single-service">\n';
						html += '<div style="padding: 50px; border: 1px solid; margin: 20px;">\n';
						html += '<h2>'+data[i].cate_name+'</h2>\n';
						html += '<p style="width: 230px; padding: 0;">'+data[i].cate_con+'</p>\n';
						html += '</div></div></a></div>';
					}
					$('#cate_wrap').html(html);
					html = '';
					
					for (var j = 0; j < data.length-1; j++) {
						html += '<a onclick="selectR('+data[i].cate_idx+', '+idx+')">\n';
						html += '<div class="single-features">\n';
						if(i%j==0){
							html += '<div class="col-sm-6 col-sm-offset-1 align-right wow fadeInLeft" data-wow-duration="500ms" data-wow-delay="300ms">';
							html += '<h2>'+data[j].cate_name+'</h2>';
							html += '<p>'+data[j].cate_con+'</p></div>';
							html += ' <div class="col-sm-5 wow fadeInRight" data-wow-duration="500ms" data-wow-delay="300ms">';
							html += '<img src="<c:url value="/images/request/'+data[j].cate_img+'" />" class="img-responsive" alt=""></div>';
						}else {
							html += '<div class="col-sm-5 wow fadeInLeft" data-wow-duration="500ms" data-wow-delay="300ms">';
							html += '<img src="<c:url value="/images/request/'+data[j].cate_img+'" />" class="img-responsive" alt=""></div>';
							html += '<div class="col-sm-6 wow fadeInRight" data-wow-duration="500ms" data-wow-delay="300ms">';
							html += '<h2>'+data[j].cate_name+'</h2>';
							html += '<p>'+data[j].cate_con+'</p>';
						}
						html += '</div></div></a>';
					}
					
					$('#cate_list').html(html);
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