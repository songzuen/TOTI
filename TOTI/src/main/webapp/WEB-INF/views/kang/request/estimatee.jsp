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
                            <h1 class="title">견적서</h1>
                            <h3 id="re_date"></h3>
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
					<input type="hidden" value="${ request_idx }" id="request_idx">
					<input type="hidden" value="${ idx }" id="m_idx">
					<div id="cate_select_wrap">
                         <a onclick="history.back()"><i class="fa fa-chevron-left"></i><span>이전으로</span></a>
                    </div>
                    <div>
                    	
                    </div>
					<div id="estimatee_wrap">
						<ul id="tab1" class="nav nav-tabs">
							<li class="active"><a id="est_list_title" href="#tab1-item1" data-toggle="tab">견적서 목록</a></li>
							<li><a href="#tab1-item2" data-toggle="tab">보낸 요청서</a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane fade active in" id="tab1-item1">
								<div id="est_wrap">
								
								</div>
							</div>
							<div class="tab-pane fade" id="tab1-item2">
							<div id="est_request">
								<div id="myRequest">
									
								</div>
							</div>
							</div>
						</div>
					</div>
				</div>
			</div>
            </div>
    </section>
    <!--/#blog-->
    
	<%@ include file="/WEB-INF/views/frame/footer.jsp" %>

	<script>
		$(document).ready(function() {

			estimateeList($('#request_idx').val());
			request();

		});

		function estimateeList(request_idx) {

			$.ajax({
						url : 'estimateeList/'+request_idx,
						type : 'GET',
						success : function(data) {

							var html1 = '';
							html1 += data.request_date;
							$('#re_date').text(html1);

							html1 ='';
							html1 += data.cate_name+'('+data.service_name+') 견적서 목록';
							$('#est_list_title').text(html1);
							
							var html = '';

							for (var i = 0; i < data.estiData.length; i++) {
								
								html += '<div class="est_wrap"><input type="hidden" value="'+data.estiData[i].mento_idx+'">';
								html += '<div class="est_user"><div class="est_user_img">';
								html += '<img src="<c:url value="/images/user/'+data.estiData[i].m_photo+'"/>"></div>';
								html += '<div class="est_user_info" onclick="goChatPage(' + data.estiData[i].est_idx +', ' + data.estiData[i].mento_idx + ')">';
								html += '<p class="info_con">'+data.estiData[i].p_shot+'</p><p class="info_date">'+data.estiData[i].est_date+'</p>';
								html += '<p class="info_name">'+data.estiData[i].m_name+' <i class="fa fa-star"></i>'+data.estiData[i].str+' ('+data.estiData[i].cont_cnt+'개)</p>';
								html += '<p class="info_map">'+data.estiData[i].tor_location+'</p></div></div>';
								html += '<div class="est_pay"><hr><div><span>예상금액</span> '+data.estiData[i].est_price+'원';
								html += '</div></div></div>';
							}

							$('#est_wrap').html(html);

						}

					});

		}

		function request() {

			$.ajax({
				url : '../request/requestData',
				type : 'GET',
				data : {
					request_idx : $('#request_idx').val(),
					m_idx : $('#m_idx').val()
				},
				success : function(data) {
					
					var html = '';
					
					html += '<img src="<c:url value="/uploadfile/'+data.userInfo.m_photo+'" />">';
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
		
		function goChatPage(est_idx, m_idx) {
			location.href ='/toti/chat/chatPage/' + est_idx + '/' + m_idx;
		}
	</script>
</body>
</html>