<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/frame/header.jsp"%>
<!-- title -->
<title>[관리자] TOTI :: 제공 서비스 관리</title>
<style>
	#checkService {
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
	#addbtn{
		height:26px; 
		width:26px; 
		padding: 0px 4px; 
		margin-top:12px;
		margin-left:30px;
		text-align: center;
	}
	h2{
		font-weight: bold;
	}
	#tdwrite{
		width:200px;
		padding-left: 20px;
		padding-bottom: 8px;
	}
	#delbtn{
		height:19px; 
		padding: 0px 4px; 
		padding-bottom: 20px;
		text-align: center;
	}
	.service{
		height: 30px;
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
			<input type="hidden" value="${idx}" id="m_idx" name="m_idx">
				<div id="checkService">
					<hr><h2>분야 선택</h2><br>
					<div id="catelist"></div><br><hr>
					<table>
						<tr>
							<td><h2>서비스 관리</h2></td>
							<td><button class="btn btn-s econdary" id="addbtn" data-toggle="modal" data-target="#myModal" >+</button></td>
						</tr>
					</table>
					<br>
					<div id="cateBox" style="border:1px solid #ddd; padding:10px; width:700px; border-radius: 10px;" >
						<div id="boxIn">분야 선택에서 서비스를 확인할 분야의 버튼을 클릭해주세요.</div>
						<div id="servicelistBycate" style="display: none">
							
						</div>
					</div>
				</div>
				
				<!-- The Modal -->
				<div class="modal" id="myModal">
					<div class="modal-dialog">
						<div class="modal-content">

							<!-- Modal Header -->
							<div class="modal-header">
								<h2 class="modal-title">상세 서비스 추가</h2>
								<button type="button" class="close" style="margin-top:-50px;" data-dismiss="modal">×</button>
							</div>

							<!-- Modal body -->
							<div class="modal-body">
								<form id="serviceForm" method="post" enctype="multipart/form-data" onsubmit="return false" style="margin:auto;">
									<div id="addService">
											<table style="margin:auto;">
											<tr>
												<td>
													<label for="cate_idx">분야를 선택하세요.</label>	
												</td>
												<td id="tdwrite">
													<select id="cate_idx" name="cate_idx" style="width:100%; height:26px;">
													
													</select>
												</td>
											</tr>
											<tr>
												<td>
													<label for="service_name">서비스명을 입력하세요.</label>
												</td>
												<td id="tdwrite">
													<input type="text" name="service_name" id="service_name" style="width:100%; height:26px;"> 
												</td>
											</tr>
											</table>
									</div>
								</form>
							</div>

							<!-- Modal footer -->
							<div class="modal-footer">
								<button type="button" class="btn btn-primary" onclick="addService()">완료</button>
								<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 모달 끝 -->
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
		
		if($('#m_idx').val() != 37 ){
			alert('관리자 권한이 없습니다.');
			location.href="/toti/main";
		}
		
		function categoryList() {
			$.ajax({
				url : '/toti/admin/service/categoryList',
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
				url : '/toti/admin/service/categoryList',
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
				url : '/toti/admin/service/list/'+cate_idx,
				type : 'GET',
				success : function(data){
					var html = '';
					html += '<div style="overflow:auto; height:200px;" >';
					for (var i = 0; i < data.length; i++) {
						html += '<h4 style="font-weight: bolder; padding: 5px 0;">'+data[i].cate_name+'서비스</h4>';
						
						break;
					}
					for (var i = 0; i < data.length; i++) {
						
						html += '<div class="service">';
						html += data[i].service_name
								+ '\n';
						html += '<button class="btn btn-secondary" id="delbtn" onclick="del(' 
								+ data[i].service_idx + ')">x</button>\n';
						html += '</div>\n';
					}
					html += '</div>';
					$('#servicelistBycate').html(html);
					$('#boxIn').css('display', 'none');
					$('#servicelistBycate').css('display', 'block');
				}
			});
	    }
		
		function addService() {
			alert($('#serviceForm').serialize());
			$.ajax({
				url : '/toti/admin/service/insert',
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
		}
		
		function del(service_idx){
	        if(confirm('서비스를 삭제할까요?')){
	           $.ajax({
	                url : '/toti/admin/service/delete/'+service_idx,
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
