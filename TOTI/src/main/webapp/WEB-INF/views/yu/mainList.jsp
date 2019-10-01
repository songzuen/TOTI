<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mainList</title>
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

body{
	background-color: #F2F2F2;
}

.container{
	background-color: white;
}

#tableApi {
	border:1px solid #bcbcbc;
	float:left;
}

#thumbnail {
	width:345px;
	height:300px;	
}

#searchList{
		
	padding-left: 300px;
	padding-right: 300px;
	

}


</style>
</head>

<body>


<div class="container">
	<div id="apiMainList" class="card" >
	
	</div>

 
         <!-- <form id="apiSearchForm" method="get"> -->
         <!-- <div class="row uniform"> -->
         	<div>
            <div>
               <input type="text" name="keyword" id="keyword" placeholder="공연/전시 이름을 입력하세요." />
                <button id="apiSearchBtn" onclick="apiSearch()">검색</button>
            </div>
          
         </div>
         <!--          </form> -->
       



	<br><br><br><br>
		<form action="detail.jsp">
         <div id="searchList"></div>
		</form> 
		
		</div>

   <script>
      $(document).ready(function() {
    	  apiList();
   
      });
      
      
      
      
      
      
      


      function apiSearch() {
         var serviceKey = 'JLSkzmHpfUzFKrIc6Rj3ctOhrcxkpJseabRpcv2orln2GXYDEjUztm4fRtQOCNn9rBWJTNhA3Os79GYiZkJEIA%3D%3D';
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
               var html='';
               //html+='<tr><td>공연명</td><td>공연 정보</td></tr>';
               var performList = new Array();
               $(data).find('perforList').each(
                     function(index) {
                                var perform = {
                                    title : $(this).find('title').text(),
                                    seq : $(this).find('seq').text(),
                                    startDate : $(this).find('startDate').text(),
                                    endDate : $(this).find('endDate').text(),
                                    area : $(this).find('area').text(),
                                    place : $(this).find('place').text(),
                                    thumbnail : $(this).find('thumbnail').text()
                                }
                                performList.push(perform);
                        //alert(seq + '/' + title + '/' + area + '/'+ realmName);
                                 //html+='<tr><td>'+perform.realmName+'</td><td><a onclick="select('+perform.seq+')">'+perform.title+'</a></td><td>'+perform.startDate+'~'+perform.endDate+'</td></tr>';   
                           
               });
               
               
      
               
               var sortedPerformList = performList.reverse();
               sortedPerformList.forEach(function(val) {
                  //alert(val.title);
                  html += '<div class="card">\n';
                  html += '<table id="searchList">';
                  html += '<tr>';
                  html += '<td>';
                  html += '<a onclick="select('+val.seq+')"><img src="'+val.thumbnail+'"id=\"thumbnail\"></a>';
                  html += '</td>';
                  html += '<td style="padding-left:150px;">';
                  html += val.title+' <br><br><br><br>\n';
                  html += '공연 기간 : '+val.startDate+'~'+val.endDate+'<br>';
                  html += '공연 장소: '+val.place+'<br>';
  				  html += '</td></tr></table>';
  				  html += '</div>\n';
  				  
               });
               
               
               
				
  
               $('#searchList').html(html);
            }
         });
      }
      
      function select(seq,title) {
         	$('#r_info').val(seq);  
			$('#m_seqNum').val(seq);
			location.href="detail.jsp?seq="+seq;
     
      }
      

	  var today = new Date();
	  var dd = today.getDate();
	  var mm = today.getMonth()+1; //January is 0!
	  var yyyy = today.getFullYear();

	  if(dd<10) {
	      dd='0'+dd
	  } 

	  if(mm<10) {
	      mm='0'+mm
	  } 

	  today =yyyy+'/'+mm+'/'+dd; 
	  document.write(today);
	  

	function apiList(){
		
		$.ajax({

			type : "get",
			url : "http://www.culture.go.kr/openapi/rest/publicperformancedisplays/period?from="+today+"&to=&cPage=1&rows=8&place=&gpsxfrom=&gpsyfrom=&gpsxto=&gpsyto=&keyword=&sortStdr=1&serviceKey=WIOVsWEEG4jFmGe0IKAXzPKJkjCz3Xd05gwXJKVu8THf2REveXVls8SoRvh3d7cFbQMPSiFLidzJ0JU5FuNAFw%3D%3D",
			dataType : "xml",
			
			success : function(data) {
				console.log(data);
			

				var apiHtml = '';
				
				$.each($(data).find("perforList"),function(idx, val){
				console.log(val);	
				
				var thumbnail= $(val).find("thumbnail").text();
				var seq1=$(val).find("seq").text();
					apiHtml += '<div style="float:left;">\n';
					apiHtml += '<div>\n';
// 				 	apiHtml += '<table id="apiListTable">';
// 					apiHtml += '<tr>';
// 					apiHtml += '<td>'; 
					apiHtml += '<a onclick="select('+seq1+')"><img src="'+thumbnail+'"id=\"thumbnail\"></a>';
//					apiHtml += '</td>';
// 					apiHtml += '<td style="padding-left:150px;">';
// 					apiHtml += $(val).find("title").text()+' <br>\n';
// 					apiHtml += 'startDate : '+$(val).find("startDate").text()+' <br>\n';
// 					apiHtml += 'endDate : '+$(val).find("endDate").text()+' <br>\n';
// 					apiHtml += 'place : '+$(val).find("place").text()+' <br>\n';
// 					apiHtml += 'area : '+$(val).find("area").text()+' <br>\n';
// 					apiHtml += 'seq : '+$(val).find("seq").text()+' <br>\n';
// 					apiHtml += '<input type="submit" value="상세페이지">';
// 					apiHtml += '</td>';
// 					apiHtml += '</tr>';
// 					apiHtml += '</table>';
					apiHtml += '</div>\n';
					apiHtml += '</div>\n';
			
				
				});

				$('#apiMainList').html(apiHtml);
				
				}
			}); 
	
	}
      
      

      // 나중에 링크 누르면 이거 들어가게 하기
   </script>
</body>
</html>