<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/frame/header.jsp" %>
	<link href="<c:url value="/css/daheeCss/daheecontents.css" />" rel="stylesheet">
	<title>TOTI : 보낸 요청서</title>
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
                            <h1 class="title">보낸 요청서</h1>
                            <p>보낸 요청서를 확인하고 해당 요청서의 견적서를 확인하세요!</p>
                            <p style="font-size: 15px; padding-top: 5px;">* 해당 요청서들은 5일이 지나면 자동 삭제됩니다.</p>
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
					<input type="hidden" value="${ idx }" id="m_idx">
					<div id="feature-container">
						<div class="row">
							<div id="list_wrap">
								
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

			userRequest($('#m_idx').val());

		});

		function userRequest(m_idx) {

			$.ajax({
					url : 'requests/'+ m_idx,
					type : 'GET',
					success : function(data) {
					
						var html = '';
						
						if(data.length == 0) {
							html+= '<div id="not_request"><p>보낸 요청서가 없습니다.</p><p>요청서를 작성해주세요.</p><a href="<c:url value="/" />">요청서 작성하러가기</a></div>';
						}else {
							
							$.ajax({
								url : 'requestsDelList/'+ m_idx,
								type : 'GET',
								success : function(delNum) {
									
									var chk = true;
									
									for (var i = 0; i < data.length; i++) {
										html += '<div class="col-sm-3 wow fadeInUp">\n';
										html += '<div class="feature-inner">\n';
										html += '<div id="requsr_my_list">\n';
										html += '<h2>' + data[i].cate_name + '</h2>';
										html += '<h3>' + data[i].service_name + '</h3>';
										html += '<p>' + data[i].request_date + '</p>';

										for (var j=0; j<delNum.length; j++) {
											if(delNum[j] == data[i].request_idx) {
												html += '<p>이 요청서는 삭제될예정입니다.</p>';
												chk = false;
											}
										}
										
										if(chk) {
											html += '<a onclick="requestDel('+ data[i].request_idx + ')">요청취소</a>';
										}
										
										if (data[i].request_cnt > 0) {
											html += '<a class="btn btn-info" href="<c:url value="/estimatee/'+data[i].request_idx+'" />">'
												+ data[i].request_cnt+ '개의 견적서 보기</a>';
										} else {
											html += '<a class="btn btn-info" href="<c:url value="/'+data[i].request_idx+'" />">요청서 보기</a>';
										}
										
										html += '</div></div></div>';
									}

									$('#list_wrap').html(html);
									
								}
							});

						}
						
						$('#list_wrap').html(html);
					}

				});
		}

		function requestDel(request_idx) {

			if (confirm('요청을 취소하겠습니까?')) {

				$.ajax({
					url : 'requests/'+ request_idx,
					type : 'DELETE',
					success : function(data) {

						if (data > 0) {
							alert('요청이 취소되었습니다.');
							location.reload();

						} else {
							alert('취소불가');
						}
					}

				});

			}

		}
	</script>

</body>
</html>