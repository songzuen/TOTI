<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/frame/header.jsp"%>
<!-- title -->
<title>[관리자] TOTI :: 요청서 질문 관리</title>
<style>

	#checkService, #editFrame{
		width: 900px;
		margin : 0 auto;
	}
	h2{
		font-weight: bold;
	}
	#addbtn{
		height:26px; 
		width:26px; 
		padding: 0px 4px; 
		margin-top:12px;
		margin-left:30px;
		text-align: center;
	}
	#tdwrite{
		width:300px;
		padding-left: 20px;
		padding-bottom: 8px;
	}
	#editbtn, #delbtn{
		 height:20px;
		 margin: 0px 4px;
		 padding: 0px 4px; 
		 text-align: center;
		 float: right;
	}
	.service{
		height: 30px;
	}
	#itemdelbtn{
		height:20px;
		margin: 0px 4px;
		padding: 0px 4px; 
		padding-bottom: 20px;
		text-align: center;
		float: left;
	}
	#item_cont{
		width:180px;
	}
	#additembtn{
		margin-left: 10px;
		
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
							<td><h2>질문 관리</h2></td>
							<td><button class="btn btn-s econdary" id="addbtn" data-toggle="modal" data-target="#myModal" >+</button></td>
						</tr>
					</table>
					<br>
					<div id="cateBox" style="border:1px solid #ddd; padding:10px; width:700px; border-radius: 10px;" >
						<div id="boxIn">분야 선택에서 질문을 확인할 분야의 버튼을 클릭해주세요.</div>
						<div id="questionlistBycate" style="display: none">
							
						</div>
					</div>
				</div>
				
				<!-- The Modal -->
				<div class="modal" id="myModal">
					<div class="modal-dialog">
						<div class="modal-content">

							<!-- Modal Header -->
							<div class="modal-header">
								<h2 class="modal-title">요청서 질문 추가</h2>
								<button type="button" class="close" style="margin-top:-50px;" data-dismiss="modal">×</button>
							</div>

							<!-- Modal body -->
							<div class="modal-body">
								<form id="questionForm" method="post" enctype="multipart/form-data" onsubmit="return false" style="margin:auto;">
									<div id="addQuestion">
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
												<td><label for="cate_idx">답변방식을 선택하세요.</label></td>
												<td id="tdwrite">
													<select name="quest_type" id="quest_type" style="width:100%; height:26px;">
														<option selected>답변</option>
														<option id="radio" value="radio">단일 선택</option>
														<option id="checkbox" value="checkbox">중복 선택</option>
														<option id="text" value="text">직접 입력</option>
													</select>
												</td>
											</tr>
											<tr>
												<td>
													<label for="service_name">요청서에 추가할 질문을 입력하세요.</label>
												</td>
												<td id="tdwrite">
													<input type="text" name="quest_name" id="quest_name" style="width:100%; height:26px;"> 
												</td>
											</tr>
											</table>
									</div>
								</form>
							</div>

							<!-- Modal footer -->
							<div class="modal-footer">
								<button type="button" class="btn btn-primary" onclick="addQuestion()">완료</button>
								<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 모달 끝 -->
				
				
				<div id="editFrame" style="display: none">
			        <form id="editForm">
				        <hr>
				        <div>
					        <h2>질문 수정</h2><br>
						    <label for="question"> 질문 내용을 수정하세요. </label>
						    <input type="text" name="quest_name" id="equest_name" style="width:50%; height:26px;" required><br>
				            <input type="hidden" name="quest_idx" id="quest_idx">
						      <label for="cate_idx">답변 방식을 수정하세요.</label>
						      <select name="quest_type" id="equest_type" style="width:50%; height:26px;">
								<option selected>답변</option>
								<option id="radio" value="radio">단일 선택</option>
								<option id="checkbox" value="checkbox">중복 선택</option>
								<option id="select" value="select">목록 선택</option>
							</select><br>
				            <div style="width: 700px;">
				            	<input type="submit" value="수정" style="float:right;"><br>
				            </div>
			            </div>
			        </form>
			        <hr>
					<div id="itemByQuest" style="display: none">
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
					for (var i = 0; i < data.length; i++) {
					html += '<button type="button" class="btn btn-secondary" onclick="listByCate('+data[i].cate_idx+')">'+ data[i].cate_name +'</button>';
					}
						html += '</div>\n';
						html += '</div>\n';
					
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
					for (var i = 0; i < data.length; i++) {
						html += '<option value="'+ data[i].cate_idx +'">'+ data[i].cate_name + '</option>';
					}
					$('#cate_idx').html(html);
				}
			});
		}
		
		function listByCate(cate_idx){
			$.ajax({
				url : '/toti/admin/question/list/'+cate_idx,
				type : 'GET',
				success : function(data){
					var html = '';
					html += '<div style="overflow:auto; height:200px;" >';
					for (var i = 0; i < data.length; i++) {
						html += '<h4 style="font-weight: bolder; padding: 5px 0;">'+data[i].cate_name+' 질문</h4>\n';
						break;
					}
					for (var i = 0; i < data.length; i++) {
						var num = i+1;
						html += '<div class="service">';
						html += num + '.&nbsp;&nbsp;&nbsp;&nbsp;' + data[i].quest_name + '\n';
						html += '<button class="btn btn-secondary" id="delbtn" onclick="del(' 
								+ data[i].quest_idx + ')">삭제</button>\n';
						html += '<button class="btn btn-secondary" id="editbtn"  data-toggle="modal2" data-target="#myModal" onclick="edit('
							+ data[i].quest_idx +'); itemByQuest('+data[i].quest_idx+')">수정</button><br>\n';
						html += '</div>\n';
					}
					html += '</div>';
					$('#questionlistBycate').html(html);
					$('#boxIn').css('display', 'none');
					$('#questionlistBycate').css('display', 'block');
				}
			});
	    }
		 
		function addQuestion() {
			$.ajax({
				url : '/toti/admin/question/insert',
				type : 'POST',
				data : $('#questionForm').serialize(),
				success : function(data) {
					if(data == 'success'){
						alert('등록되었습니다. 수정버튼을 클릭하여 답변항목을 지정해주세요.');
						location.reload();
					}else{
						alert('실패');
					}
				}
			});
			
		}
		
		function del(quest_idx){
	        if(confirm('서비스를 삭제할까요?')){
	           $.ajax({
	                url : '/toti/admin/question/delete/'+quest_idx,
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
		
		function edit(quest_idx){
	        $('#editFrame').css('display', 'block');
	        
			$.ajax({
				url : '/toti/admin/question/edit/'+quest_idx,
				type : 'GET',
				success : function(data){
	                $('#quest_idx').val(quest_idx);
	                $('#equest_name').val(data.quest_name);
	                $('#equest_type').val(data.quest_type);
				}
			});
	    }
		
		$('#editForm').submit(function(){            
            $.ajax({
                url : '/toti/admin/question/edit/'+$('#quest_idx').val(),
                type : 'PUT',
                data : JSON.stringify({quest_name : $('#equest_name').val(), quest_type : $('#equest_type').val()}),
                contentType : 'application/json; charset=utf-8',                
                success : function(data){
                    if(data == 'success') {
                        alert('수정되었습니다.');
                        $('#editFrame').css('display', 'none');
                        location.reload();
                    }
                },
                error : function(e){
                    alert('수정 실패');
                    location.reload();
                }
            });
            
            return false;
        });
		
		function itemByQuest(quest_idx){
			$.ajax({
				url : '/toti/admin/question/itemlist/'+quest_idx,
				type : 'GET',
				success : function(data){
					var html = '';
					html += '<form id="addItemForm"><h2>답변 관리</h2>';
					html += '<input type="hidden" name="quest_idx" id="quest_idx" value="'+quest_idx+'">';
					html += '<label>질문에 관한 답변 항목을 직접 지정해주세요.</label><br>';
					html += '<input type="text" name="item_cont" id="item_cont"><button id="additembtn" onclick="additem()">항목 추가</button><br><br>';
					for (var i = 0; i < data.length; i++) {
						html += '<label><input type="'+data[i].quest_type+'">'+data[i].item_cont;
						html += '<button class="btn btn-secondary" id="itemdelbtn" onclick="delitem('+data[i].item_idx+')">-</button></label><br>';						
					}
					html += '</form><br>';
					$('#itemByQuest').html(html);
					$('#boxIn').css('display', 'none');
					$('#itemByQuest').css('display', 'block');
				}
			});
	    }
		
		function delitem(item_idx){
			if(confirm('답변 항목을 삭제할까요?')){
				$.ajax({
					url : '/toti/admin/question/deleteItem/'+item_idx,
					type : 'DELETE',
					success : function(data){
						if(data=='success'){
	                        alert('답변 항목이 삭제되었습니다');
	                        location.reload();
	                    }else {
	                    	alert('삭제실패');
	                    }
					}
				});
			}
		}
		
		function additem() {
			$.ajax({
				url : '/toti/admin/question/insertItem',
				type : 'POST',
				data : $('#addItemForm').serialize(),
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
	</script>
</body>
</html>
