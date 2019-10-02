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
                            <h1 class="title">견적서</h1>
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
					<input type="hidden" value="${ request_idx }" id="request_idx">
					<input type="hidden" value="1" id="m_idx">
					<div id="request_wrap">
					</div>
					<div id="est_wrap">
					</div>
					<hr>
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

			estimateeList($('#request_idx').val());
			request();

		});

		function estimateeList(request_idx) {

			$
					.ajax({
						url : 'http://localhost:8080/toti/user/estimateeList/'
								+ request_idx,
						type : 'GET',
						success : function(data) {

							var html1 = '';

							html1 += '<h2>' + data.cate_name + '</h2>';
							html1 += '<h3>' + data.service_name + '</h3>';
							html1 += '<h4>' + data.request_date + '</h4>';

							$('#request_wrap').html(html1);

							html = '';

							for (var i = 0; i < data.estiData.length; i++) {
								html += '<div id="est" class="card bg-light text-dark"><div class="card-body"><input type="hidden" value="'+data.estiData[i].mento_idx+'"> <div style="display: inline-block; float: left;">';
								html += '<img alt="이미지없음" height="75px" src="<c:url value="/images/user/'+data.estiData[i].m_photo+'" />"></div>';
								html += '<div>' + data.estiData[i].p_shot
										+ '<br>' + data.estiData[i].m_name
										+ ' ★ ' + data.estiData[i].str + '('
										+ data.estiData[i].cont_cnt + '개)<br>'
										+ data.estiData[i].tor_location
										+ '</div><hr>';
								html += '<div>예상금액 : '
										+ data.estiData[i].est_price + '원';
								html += '</div></div></div>';
							}

							$('#est_wrap').html(html);

						}

					});

		}

		function request() {

			$
					.ajax({
						url : 'http://localhost:8080/toti/requestData',
						type : 'GET',
						data : {
							request_idx : $('#request_idx').val(),
							m_idx : $('#m_idx').val()
						},
						success : function(data) {

							var html = '';

							html += '<img alt="이미지없음" height="100px" src="<c:url value="/img/user/'+data.userInfo.m_photo+'" />"><br>';
							html += data.userInfo.m_name + '님';
							html += '<p style="text-align: right;">'
									+ data.request_date + '</p>';
							html += '<p>분야 : ' + data.cate_name + '</p>';
							html += '<p>선택한 서비스 : ' + data.service_name
									+ '</p>';

							for (var i = 0; i < data.answer.length; i++) {

								html += '<p>' + data.answer[i].quest_name
										+ '</p>';
								html += '<p>' + data.answer[i].answer_cont
										+ '</p>';

							}

							$('#request').html(html);

						}

					});

		}
	</script>
</body>
</html>