<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->

<style type="text/css">
div.card {
	float: left;
	width: 80%;
	border: 1px solid #ddd;
	height:500px;
}

.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

.modal-contents {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #ddd;
	width: 50%; /* Could be more or less, depending on screen size */
	box-shadow: 5px 5px #ccc;
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
#m_img{
	width:300px;
	height:300px;
	margin-left: 400px;
}

</style>
</head>

<body>
<!-- 
<div class="container">
	 <button class="btn" onclick="showWrite()">작성</button>
	
	<br>
	<hr>
    
    <div id="writeArea" style="display: none" class="modal">
      <div class="modal-contents">
         <span class="close" id="writeClose">x</span>
    
   
    작성 폼
   <form method="post" id="writeForm">
      <div class="row uniform">

         <input type="hidden" name="m_idx" id="m_idx">

         <div class="12u$">
            <input type="text" name="location" id="location" 
               placeholder="위치" />
         </div>
         <div class="12u$">
            <ul class="actions">
               <li><input type="submit" value="고수회원으로 등록" /></li>
            </ul>
         </div>
      </div>
   </form>
   </div>
   </div>
   </div> -->
   
   
	<div>
		<form>
			<div>
				<table>
				
					<tr>
						<td colspan="1"><input type="hidden" id="m_idx" name="m_idx"></td>
					</tr>
					<tr>
						<td>지역</td>
						<td><input type="text" id="location" name="location"></td>
					</tr>
					<tr>
						
						<td colspan="1"><input type="submit" value="등록하기"></td>
					</tr>
				</table>
			
			
			</div>
		
		</form>
	
	</div>




	<script>
		$(document).ready(function() {
  

// 		   function showWrite() {
// 		         $('#writeArea').css('display', 'block');
// 		      }
			 
// 			 $('#writeClose').click(function() {
// 		         $('#writeArea').css('display', 'none');
// 		      });
// 		        $('#writeForm').submit(function(){
		                 
		       
// 		            $.ajax({
// 		                url : 'http://localhost:8080/toti/member/insertMentor',
// 		                type : 'POST',
// 		                data : { 
// 		                	 m_idx : $('#writeArea #idx').val()
		                  
// 		                },
		              
// 		                success : function(data){
		                	
// 		                	if (data == 'success') {
		                	
// 		                	alert('등록 완료');
// 		       			 $('#writeArea').css('display', 'none');
// 		       			 list();
// 		       			 }
// 		       			 },
// 		       			 error: function(e) {
// 		       			 alert('등록실패');
// 		       			 $('#writeArea').css('display', 'none');
// 		           	 } 
// 		            });
// 		          return false;
   
// 		   });
		 

			$('#form').submit(function() {

								
				

				$.ajax({
					url : '/toti/member/insertMentor',
					type : 'POST',
					data :  { 
						m_idx : $('#m_idx').val()
					},
					dataType: 'text',
					success : function(data) {
						
							alert('등록 완료');
							
											
					}
			});
				return false;

			});
		
		 
	
	</script>
</body>

</html>