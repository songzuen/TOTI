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
<link rel="stylesheet" href="assets/css/main.css" />
<!-- Latest compiled and minified CSS -->


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

<div class="container">
	 <button class="btn" onclick="showWrite()">작성</button>
	
	<br>
	<hr>

	<div id="cfMainList"></div>
	
	
  <div id="editArea" style="display: none" class="modal">
        <div class="modal-contents">
            <span class="close">x</span>
            <h1>수정</h1>
            <hr>
            <form id="editForm">
         <input type="hidden" name="m_num" id="m_num" readonly> <br>
         <input type="hidden" name="m_id" id="m_id" readonly> <br>
         제목<input type="text" name="m_title" id="m_title" readonly> <br>
	<input type="hidden" name="m_info" id="m_info" readonly> <br>   
	
         내용<input type="text" name="m_content" id="m_content" > <br>
         <input type="hidden" name="m_img" id="m_img" readonly> <br>
                <input type="submit" value="수정" id="editBtn">
            </form>
        </div>
    </div> 
    
    
    
    <div id="writeArea" style="display: none" class="modal">
      <div class="modal-contents">
         <span class="close" id="writeClose">x</span>
    
    
       <div class="row uniform">
      <div class="3u$ 12u$(small)">
         <button class="fit" id="showSearchBtn">공연/전시 찾기</button>
         
      </div>
   </div>

   <!-- 검색 -->
   <div id="apiSearchArea" style="display: none" class="modal">
      <div class="modal-contents">
         <span class="close" id="apiSearchClose">x</span>
         <h1>전시/공연 검색</h1>
         <hr>
         <!--          <form id="apiSearchForm" method="get"> -->
         <div class="row uniform">
            <div class="9u 12u$(small)">
               <input type="text" name="keyword" id="keyword" placeholder="공연/전시 이름을 입력하세요." />
            </div>
            <div class="3u$ 12u$(small)">
               <button class="fit" id="apiSearchBtn" onclick="apiSearch()">검색</button>
            </div>
         </div>
         <!--          </form> -->
         <hr>

         <h1>검색 결과</h1>
         <div id="searchList">

         </div>
      </div>
   </div>
   
    <!-- 작성 폼 -->
   <form method="post" id="writeForm">
      <div class="row uniform">

         <!-- 아이디는 우선 테스트용으로 넣어놓음 -->
         <input type="hidden" name="m_id" id="m_id" value="admin">

		
         <div class="12u$">
            <input type="hidden" name="m_img" id="m_img" value=""
               placeholder="사진" />
         </div>

		<div class="hidden">
            <input type="text" name="m_info" id="m_info" placeholder="1234" />
         </div>


         <div class="12u$">
            <input type="text" name="m_title" id="m_title" value=""
               placeholder="제목" />
         </div>
         <div class="12u$">
            <textarea name="m_content" id="m_content" placeholder="내용을 입력하세요."
               rows="6"></textarea>
         </div>

         <div class="12u$">
            <ul class="actions">
               <li><input type="submit" value="추천글 작성" /></li>
            </ul>
         </div>
      </div>
   </form>
   </div>
   </div>
  
    
    
    
    
    
    

	<script>
		$(document).ready(function() {
			list();

			
		});
		
		function list() {

			$.ajax({

				url : 'http://15.164.210.97:8080/cf/rest/cfMain',

				type : 'GET',
				success : function(data) { 

					var html = '';

					for (var i = 0; i < data.length; i++) {
						html += '<div class="card">\n';
						html += '<img src="'+ data[i].m_img +'" id=\"m_img\"> <br>\n';
						html += '글번호 : ' + data[i].m_num + ' <br>\n';
						html += '제목 : ' + data[i].m_title + ' <br>\n';	
						html += '내용 : ' + data[i].m_content + ' <br>\n';
							
						
						html += '<button onclick="del(' + data[i].m_num
								+ ')">삭제하기</button><br>\n';
						html += '<button onclick="showEdit(' + data[i].m_num
								+ ')">수정하기</button><br>\n';
						html += '</div>\n';
					}

					$('#cfMainList').html(html);
				}

			});
		}
		
		
		 function del(m_num) {
				if (confirm('삭제하시겠습니까?')) {
					$.ajax({
						//url : 'http://localhost:8080/mm/rest-api/members/'+idx,
						url : 'http://15.164.210.97:8080/cf/rest/cfMain/' + m_num,
						type : 'DELETE',
						success : function(data) {
							//alert(JSON.stringify(data));
							if (data == 'SUCCESS') {
								alert('삭제되었습니다');
								list();
							}
						 
					 },
					 error: function(e) {
					 alert('삭제되었습니다.');
					 list();
					 
					 }

					 });

				}
			}
		
		 function showEdit(m_num) {
		      $('#editArea').css('display', 'block');
		      
		      $.ajax({
		          url: 'http://15.164.210.97:8080/cf/rest/cfMain/' + m_num,
		          type: 'GET',
		          success: function(data) {
		              $('#m_num').val(m_num);
		              $('#m_id').val(data.m_id);
		              $('#m_content').val(data.m_content);
		              $('#m_title').val(data.m_title);
		              $('#m_img').val(data.m_img);
		              $('#m_info').val(data.m_info);
					  
		          
		          }

		      });

		  }
		 
		 
		 
		$('#editForm').submit(function() {

			 //alert($('#editForm').serialize());

			 $.ajax({
			 url: 'http://15.164.210.97:8080/cf/rest/cfMain/' + $('#m_num').val(),
			 type: 'PUT', 
			 //get이나 post는 톰캣이 파싱을 잘 하는데 그 외에 풋이나 딜리트같은 애들은 잘 못함. 서버를 직접 만져도 좋지만 못 만지는 경우도 있을테니 서버로부터 자유롭도록 제이슨. 스트링파이~ 하고 컨텐트타입을 application/json해주고~
			 data: JSON.stringify({
			 m_num: $('#m_num').val(),
			 m_id: $('#m_id').val(),
			 m_title: $('#m_title').val(),
			 m_info: $('#m_info').val(),
			 m_content: $('#m_content').val(),
			 m_img: $('#m_img').val()
			 }),
			 //문자열로 받을 땐 데이터타입을 json으로 명시하지 않음
			 //~경우 에러가 날 수 있는데 그걸표현해준거
			 contentType: 'application/json; charset=utf-8',
			 success: function(data) {
			 alert(data);
			 if (data == 'SUCCESS') {
			 alert('수정되었습니다.');
			 $('#editArea').css('display', 'none');
			 list();
			 }
			 },
			 error: function(e) {
			 alert('수정되었습니다.');
			 $('#editArea').css('display', 'none');
			 list();
			 }

			 });

			 return false;
			 }); 

		
		 $('#editClose').click(function() {
	         $('#editArea').css('display', 'none');
	      });
		   
		  
		
		  /* 
		  
		  var close = document.getElementsByClassName("close")[0];   
		  close.onclick = function() {
		      $('#editArea').css('display', 'none');
		  }
		   */

		   function showWrite() {
		         $('#writeArea').css('display', 'block');
		      }
			 
			 $('#writeClose').click(function() {
		         $('#writeArea').css('display', 'none');
		      });
		 
		

		        $('#writeForm').submit(function(){
		                 
		       
		            $.ajax({
		                url : 'http://15.164.210.97:8080/cf/rest/cfMain',
		                type : 'POST',
		                data : { 
		                	 m_title : $('#writeArea #m_title').val(),
		                     m_content : $('#writeArea #m_content').val(),
		                     m_id : $('#writeArea #m_id').val(),
		                     m_info : $('#writeArea #m_info').val(),
		                     m_img : $('#writeArea #m_img').val(),
		                     m_num : $('#writeArea #m_num').val()
		                  
    
		                },
		              
		                success : function(data){
		                	
		                	if (data == 'SUCCESS') {
		                	
		                	alert('작성 완료');
		       			 $('#writeArea').css('display', 'none');
		       			 list();
		       			 }
		       			 },
		       			 error: function(e) {
		       			 alert('작성 완료');
		       			 $('#writeArea').css('display', 'none');
		       			 list();
		       		
		           	 }
		                
 
		            });
		          return false;
		
		        
		      
		      
		   });
		 
		   
		   // api 검색창 열기
		   $('#showSearchBtn').click(function() {
		      $('#apiSearchArea').css('display', 'block');
		   });
		   
		   // 창 닫기
		   $('#apiSearchClose').click(function() {
		      $('#apiSearchArea').css('display', 'none');
		   });

		   function apiSearch() {
		      var serviceKey ='WIOVsWEEG4jFmGe0IKAXzPKJkjCz3Xd05gwXJKVu8THf2REveXVls8SoRvh3d7cFbQMPSiFLidzJ0JU5FuNAFw%3D%3D';
		      var keyword = $('#keyword').val();
		      var from = '20170101';
		      var to = '20190828';
		      var url = 'http://www.culture.go.kr/openapi/rest/publicperformancedisplays/period?serviceKey=' + serviceKey + '&sortStdr=1&RequestTime=&from=' + from + '&to=' + to + '&cPage=1&rows=100&place=&keyword='+keyword;

		      $.ajax({
		         url : url,
		         type : 'GET',
		         dataType : 'xml', //데이터타입
		         success : function(data) {
		            //alert(data);
		            var html='<table>';
		            html+='<tr><td>분류</td><td>공연명</td><td>공연기간</td></tr>';
		            var performList = new Array();
		            $(data).find('perforList').each(
		                  function(index) {
		                             var perform = {
		                                 title : $(this).find('title').text(),
		                                 seq : $(this).find('seq').text(),
		                                 startDate : $(this).find('startDate').text(),
		                                 endDate : $(this).find('endDate').text(),
		                                 realmName : $(this).find('realmName').text(),
		                                 area : $(this).find('area').text(),
		                                 thumbnail : $(this).find('thumbnail').text()
		                             }
		                             performList.push(perform);
		                     //alert(seq + '/' + title + '/' + area + '/'+ realmName);
		                              //html+='<tr><td>'+perform.realmName+'</td><td><a onclick="select('+perform.seq+')">'+perform.title+'</a></td><td>'+perform.startDate+'~'+perform.endDate+'</td></tr>';   
		                        
		            });
		            
		            
		            
		            var sortedPerformList = performList.reverse();
		            sortedPerformList.forEach(function(val) {
		               html += '<tr><td>'+val.realmName+'</td><td><a onclick="select(\''+val.thumbnail+'\',\''+val.seq+'\',\''+val.title+'\')">'+val.title+'</a></td><td>'+val.startDate+'~'+val.endDate+'</td></tr>';   
		                
		            });
		            
		            
		            html+='</table>';
		            $('#searchList').html(html);
		         }
		      });
		   }
		   
		   function select(thumbnail,seq,title) {
		      //alert(title);
		      $('#writeArea #m_img').val(thumbnail);
		      $('#writeArea #m_info').val(seq);
		      $('#writeArea #m_title').val(title);
		      $('#writeArea #apiSearchArea').css('display', 'none');
		   }

		   
		   
		 
	
	</script>
</div>	
</body>

</html>