<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/frame/header.jsp"%>
<!-- title -->
<title>[관리자] TOTI :: 요청서 질문 관리</title>
<style>

#addQuestion, #checkService, #editFrame{
	width: 900px;
	margin : 0 auto;
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
				<div id="addQuestion">
				<hr>
				<h3 style="color: black">질문 추가</h3>
				<form id="questionForm">
					<div>
						<label for="cate_idx">분야를 선택하세요.</label>
				        <select id="cate_idx" name="cate_idx">
						</select>
						<br>
						<label for="cate_idx">답변방식을 선택하세요.</label>
						<select name="quest_type" id="quest_type">
							<option selected>답변</option>
							<option id="checkbox" value="checkbox">단일 선택</option>
							<option id="radio" value="radio">중복 선택</option>
							<option id="select" value="select">목록 선택</option>
						</select>
					</div>
					 <input type="text" name="quest_name" id="quest_name" style="width: 300px; height: 30px; ">
					<input type="submit" class="btn btn-secondary" value="추가하기" style="margin-bottom: 3px;">
				</form>
				</div>
				<div id="checkService">
					<hr>
					<h3 style="color: black">질문 리스트</h3>
					<div id="catelist"></div><br>
					<div style="border:1px solid; padding:10px; width:45%;" id="cateBox">
						<div id="boxIn">질문을 확인할 분야의 버튼을 클릭해주세요.</div>
						<div id="questionlistBycate" style="display: none">
						</div>
					</div>
				</div>
				<div id="editFrame" style="display: none">
			        <form id="editForm">
				        <hr>
				        <div>
					        <h3>질문 수정</h3>
				            <input type="hidden" name="quest_idx" id="quest_idx">
						      <label for="cate_idx">답변 방식을 선택하세요.</label>
						      <select name="quest_type" id="equest_type">
								<option selected>답변</option>
								<option id="checkbox" value="checkbox">단일 선택</option>
								<option id="radio" value="radio">중복 선택</option>
								<option id="select" value="select">목록 선택</option>
							</select> <br>
						    <label for="question"> 질문 내용 </label>
						    <input type="text" name="quest_name" id="equest_name" style="width: 300px; height: 40px;" required><br>
				            <input type="submit" value="수정">
			            </div>
			        </form>
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
				url : 'http://13.209.47.16:8080/toti/admin/service/categoryList',
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
				url : 'http://13.209.47.16:8080/toti/admin/service/categoryList',
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
				url : 'http://13.209.47.16:8080/toti/admin/question/list/'+cate_idx,
				type : 'GET',
				success : function(data){
					var html = '';
					
					for (var i = 0; i < data.length; i++) {
						html += '<h4><'+data[i].cate_name+' 질문></h4><div class="service">\n';
						break;
					}
					for (var i = 0; i < data.length; i++) {
						html += data[i].quest_name + '\n';
						html += '<button class="btn btn-secondary" style="height:20px; padding: 0px 4px; text-align: center; " onclick="edit('
								+ data[i].quest_idx +')">···</button>\n';
						html += '<button class="btn btn-secondary" style="height:20px; padding: 0px 4px; text-align: center; " onclick="del(' 
								+ data[i].quest_idx + ')">x</button><br>\n';
						html += '</div>\n';
					}
					$('#questionlistBycate').html(html);
					$('#boxIn').css('display', 'none');
					$('#questionlistBycate').css('display', 'block');
				}
			});
	    }
		 
		$('#questionForm').submit(function() {
			alert($('#questionForm').serialize());
			$.ajax({
				url : 'http://13.209.47.16:8080/toti/admin/question/insert',
				type : 'POST',
				data : $('#questionForm').serialize(),
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
		
		function del(quest_idx){
	        if(confirm('서비스를 삭제할까요?')){
	           $.ajax({
	                url : 'http://13.209.47.16:8080/toti/admin/question/delete/'+quest_idx,
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
				url : 'http://13.209.47.16:8080/toti/admin/question/edit/'+quest_idx,
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
                url : 'http://13.209.47.16:8080/toti/admin/question/edit/'+$('#quest_idx').val(),
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
	</script>
</body>
</html>
