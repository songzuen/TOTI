<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/frame/contents/header.jsp"%>
<!-- title -->
<title>[관리자] TOTI :: 제공 서비스 관리</title>
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
				<div id="countdown"></div>
				<div id="servicelistBycate" style="display: none"></div>
				<hr>
				<h1 style="color: black">서비스 추가</h1>
				<hr>
				<form id="serviceForm">
					<div>
						<label for="cate_idx">분야를 선택하세요.</label>
				        <select id="cate_idx" name="cate_idx">
							
						</select>
					</div>
					 <input type="text" name="service_name" id="service_name"
						style="border-color: black"> 
					<input type="submit" value="+">
				</form>
			
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
			categoryList();
			categoryOption();
		});
		
		function categoryList() {
			$.ajax({
				url : 'http://localhost:8080/toti/admin/service/categoryList',
				type : 'GET',
				success : function(data) {
					var html = '';
					for (var i = 0; i < data.length-1; i++) {
						html += '<div>\n';
						html += '<button onclick="listByCate('+data[i].cate_idx+')">'+ data[i].cate_name +'</button>\n';
						html += '</div>\n';
						html += '</div>\n';
					}
					$('#countdown').html(html);
				}
			});
		}
		
		function categoryOption() {
			$.ajax({
				url : 'http://localhost:8080/toti/admin/service/categoryList',
				type : 'GET',
				contentType : 'application/json; charset=utf-8',
				dataType : 'json',
				success : function(data) {
					var html = '';
					html += '<option selected>분야를 선택하세요.</option>';
					for (var i = 0; i < data.length-1; i++) {
						html += '<option value="'+ data[i].cate_idx +'">'+ data[i].cate_name + '</option>';
					}
					$('#cate_idx').html(html);
				}
			});
		}
		
		function listByCate(cate_idx){
			$.ajax({
				url : 'http://localhost:8080/toti/admin/service/list/'+cate_idx,
				type : 'GET',
				success : function(data){
					var html = '';

					for (var i = 0; i < data.length; i++) {
						html += '<div class="service">\n';
						html += data[i].service_name
								+ '\n';
						html += '<button style="height : 20px; border-radius : 15px; margine : 10px 0;" onclick="del(' + data[i].service_idx
								+ ')">X</button><br>\n';
						html += '</div>\n';
					}
					$('#servicelistBycate').html(html);
					$('#servicelistBycate').css('display', 'block');
				}
			});
	    }
		
		$('#serviceForm').submit(function() {
			alert($('#serviceForm').serialize());
			$.ajax({
				url : 'http://localhost:8080/toti/admin/service/insert',
				type : 'POST',
				data : $('#serviceForm').serialize(),
				success : function(data) {
					if(data == 'success'){
						alert('등록되었습니다.');
						location.reload();
					}else{
						alert('실패');
					}
				}
			});
			return false;
		});
		
		function del(service_idx){
	        if(confirm('서비스를 삭제할까요?')){
	           $.ajax({
	                url : 'http://localhost:8080/toti/admin/service/delete/'+service_idx,
	                type : 'DELETE',
	                success : function(data){
	                    if(data=='success'){
	                        alert('삭제되었습니다');
	                        location.reload();
	                    }else {
	                    	alert('삭제실패');
	                    }
	                }
	            });
	        }
	    }
		
		
	</script>
</body>
</html>
