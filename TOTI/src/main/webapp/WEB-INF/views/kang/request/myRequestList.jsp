<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/frame/contents/header.jsp"%>
<!-- title -->
<title>TOTI</title>
</head>
<body>
	<%@include file="/WEB-INF/views/frame/loading.jsp"%>
	<!-- page container -->
	<div class="page-container">
		<%@include file="/WEB-INF/views/frame/contents/contentsHeader.jsp"%>
		<%@include file="/WEB-INF/views/frame/contents/nav.jsp"%>
		<!-- demo content -->
		<div class="demo-content mrg-top-md">
			<!-- container -->
			<div class="container" style="margin-top: -50px">
				<div>
					<h2>내 요청서</h2>
					<input type="hidden" value="1" id="m_idx">
					<div id="list" class="card-columns">

					</div>
				</div>
				<!-- end home variation -->
				<!-- end component -->
			</div>
			<!-- end container -->
		</div>
		<!-- end demo content -->
		<!-- footer -->
		<%@include file="/WEB-INF/views/frame/contents/footer.jsp"%>
	</div>
	
	<script type="text/javascript">
	
		$(document).ready(function() {
		
			userRequest($('#m_idx').val());
		
		});
		
		
		function userRequest(m_idx) {
			
			$.ajax({
				url : 'http://localhost:8080/toti/user/requests/'+m_idx,
				type : 'GET',
				success : function(data) {
					
					var html = '';

					for (var i = 0; i < data.length; i++) {
						html += '<div class="card bg-light"><div class="card-body text-center">';
						html += '<h3>'+data[i].cate_name+'</h3>';
						html += '<h4>'+data[i].service_name+'</h4>';
						html += '<p class="card-text">'+data[i].request_date+'</p>';
						html += '<a onclick="requestDel('+data[i].request_idx+')">요청취소</a><br>';
						if(data[i].request_cnt > 0){
							html += '<a class="btn btn-dark" href="<c:url value="/user/estimatee/'+data[i].request_idx+'" />">'+ data[i].request_cnt +'개의 견적서 보기</a>';
						}else {
							html += '<a class="btn btn-dark" href="<c:url value="/user/request/'+data[i].request_idx+'" />">요청서 보기</a>';
						}
						html += '</div></div>';
					}
					
					$('#list').html(html);

				}

			});
		}
		
		function requestDel(request_idx) {
			
			if(confirm('요청을 취소하겠습니까?')){
				
				$.ajax({
					url : 'http://localhost:8080/toti/user/request/'+request_idx,
					type : 'DELETE',
					success : function(data) {
						
						if(data > 0) {
							alert('요청이 취소되었습니다.');
							location.reload();
							
						}else {
							alert('취소불가');
						}

					}

				});
				
			}
			
			
		}
		
	</script>	
	
</body>
</html>
