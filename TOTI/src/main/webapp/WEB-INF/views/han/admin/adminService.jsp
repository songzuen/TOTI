<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/frame/contents/header.jsp"%>
<!-- title -->
<title>관리자 :: 제공서비스 관리</title>
<style>

</style>
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
				<h1 style="color: black">서비스 리스트</h1>
				<hr>
				<h1 style="color: black">서비스 추가</h1>
				<hr>
				<form id="serviceForm">
					분야 선택<type="select" option=""><br> 
					서비스 <input type="text" name="service_name" id="service_name"
						style="border-color: black"><br> 
					<input type="submit" value="서비스 추가">
				</form>

				<div id="servicelist">
				
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

	<script>
		$(document).ready(function() {
			
			list();
			
		});

		/* $('#serviceForm').submit(function() {
			$.ajax({
				url : 'http://localhost:8080/toti/admin/service/insert',
				type : 'POST',
				data : $('#serviceForm').serialize(),
				success : function(data) {
					alert(data);
					alert('서비스 등록 완료');
					list();
				}
			});

			return false;
			
		}); */

		function list() {
			$.ajax({
				url : 'http://localhost:8080/toti/admin/service/list',
				type : 'GET',
				success : function(data) {

					var html = '';

					for (var i = 0; i < data.length; i++) {
						html += '<div class="service">\n';
						html += 'service name : ' + data[i].service_name
								+ ' <br>\n';
						html += 'cate idx : ' + data[i].cate_idx
								+ ' <br>\n';
						html += '<button onclick="del(' + data[i].service_idx
								+ ')">삭제</button><br>\n';
						html += '</div>\n';
					}

					$('#servicelist').html(html);
				}

			});

		}
		
	</script>
</body>
</html>
