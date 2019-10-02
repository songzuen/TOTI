<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/frame/header.jsp"%>
<!-- title -->
<title>[관리자] TOTI :: 제공 서비스 관리</title>
<style>
	#addService, #checkService {
		width: 900px;
		margin : 0 auto;
	}
	
	#cateN{
		font-size: 18px;
		font-weight: bolder;
		
	}
	span{
		margin: 10px 0;
	}
</style>
</head>
<body>
	<!-- page container -->
	<div class="page-container">
		<%@include file="/WEB-INF/views/frame/nav.jsp"%>
		<!-- demo content -->
		<div class="demo-content mrg-top-md">
			<!-- container -->
			<div class="container" style="margin-top: -50px; margin-bottom: 50px;">
				<div id="addService">
					<hr><h3 style="color: black">상세 서비스 추가</h3>
					<form id="serviceForm">
						<div>
							<label for="cate_idx">분야를 선택하세요.</label>
					        <select id="cate_idx" name="cate_idx">
								
							</select>
						</div>
						 <input type="text" name="service_name" id="service_name"
							style="width:174px;"> 
						<input type="submit" value="+">
					</form>
				</div><hr>
				<div id="checkService">
					<h3 style="color: black" >서비스 관리</h3>
					<div id="catelist"></div><br>
					<div id="cateBox" style="border:1px solid #ddd; padding:10px; width:400px; border-radius: 10px;" >
						<div id="boxIn">서비스를 확인할 분야의 버튼을 클릭해주세요.</div>
						<div id="servicelistBycate" style="display: none">
							
						</div>
					</div>
				</div>
				
				<!-- end home variation -->
				<!-- end component -->
			</div>
			<!-- end container -->
		</div>
		<!-- end demo content -->
		<!-- footer -->
		<%@include file="/WEB-INF/views/frame/footer.jsp"%>
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
					
						html += '<div class="container">';
						html += '<div class="btn-group" role="group" aria-label="Basic example">';
						for (var i = 0; i < data.length-1; i++) {
						html += '<button type="button" class="btn btn-secondary" onclick="listByCate('+data[i].cate_idx+')">'+ data[i].cate_name +'</button>';
						}
						html += '</div>';
						html += '</div>';
						
					$('#catelist').html(html);
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
					html += '<option selected>분야</option>';
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
						html += '<table style="width:100%;"><tr>';
						html += '<td><h4 style="font-weight: bolder;">'+data[i].cate_name+'서비스</h4></td>';
						html += '<td style="width: 50px;">';
						html += '<button class="btn btn-secondary" id="addService" style="height:20px; width:45px; padding: 0px 4px; text-align: center; ">추가</button>';
						html += '</td></tr></table>';
						
						break;
					}
					for (var i = 0; i < data.length; i++) {
						html += '<div class="service">';
						html += data[i].service_name
								+ '\n';
						html += '<button class="btn btn-secondary" style="height:20px; padding: 0px 4px; text-align: center; " onclick="del(' + data[i].service_idx
								+ ')">x</button>\n';
						html += '</div>\n';
					}
					$('#servicelistBycate').html(html);
					$('#boxIn').css('display', 'none');
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
