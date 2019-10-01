<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detail</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

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


div.card {
	border:2px solid #bcbcbc;
	background-color: white;
}

#imgUrl {
	width:300px;
	height:300px;	
}
#apiMainList{
		padding-left: 300px;
		padding-right:300px;
	}


</style>
</head>

<body>
	
	<h1 style="text-align: center;">상세보기</h1>
	<hr>
	<div class="container">
	<div id="apiMainList" class="card">
	
	</div>

    </div>    
	<script>
		$(document).ready(function() {
			
			//apiList();
	

		
				



			var seq1=<%=request.getParameter("seq")%>;

			$.ajax({
				
 		  	 				
				type : "get",
				url : 'http://www.culture.go.kr/openapi/rest/publicperformancedisplays/d/?serviceKey=WIOVsWEEG4jFmGe0IKAXzPKJkjCz3Xd05gwXJKVu8THf2REveXVls8SoRvh3d7cFbQMPSiFLidzJ0JU5FuNAFw%3D%3D&RequestTime=20100810%3A23003422&seq='+seq1,
				dataType : "xml",
				success : function(data) {
					console.log(data);
				
					var apiHtml = '';			
					
					$.each($(data).find("perforInfo"),function(idx, val){
					console.log(val);	
					
					var imgUrl= $(val).find("imgUrl").text();

						apiHtml += '<div class="card">\n';
						apiHtml += '<table id="apiListTable">';
						apiHtml += '<tr>';
						apiHtml += '<td>';
						apiHtml += '<img style=\"width:300px; height:300px;\" src="'+imgUrl+'"id=\"imgUrl\">';
						apiHtml += '</td>';
						apiHtml += '<td style="padding-left:150px;">';
						apiHtml += $(val).find("title").text()+' <br><br><br><br>\n';
						apiHtml += '기간 : '+$(val).find("startDate").text()+'~';
						apiHtml += +$(val).find("endDate").text()+' <br>\n';
						
						apiHtml += '장소 : '+$(val).find("placeAddr").text();
						apiHtml += '  ['+$(val).find("place").text()+'] <br>\n';
			
						
						apiHtml += '전화 : '+$(val).find("phone").text()+' <br>\n';
						apiHtml += '<a href="'+$(val).find("url").text()+'">예매하기</a> <br>\n';
						
						apiHtml += '가격 : '+$(val).find("price").text()+' <br>\n';
						apiHtml += '</td>';
						apiHtml += '</tr>';
						apiHtml += '</table>';
						apiHtml += '</div>\n';
						apiHtml += '<div>내용 : '+$(val).find("contents1").text()+'</div>\n';
					});

					$('#apiMainList').html(apiHtml);
					
					}
				}); 
		
		});
	
	</script>

</body>

</html>