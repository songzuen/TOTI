<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!Doctype html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<title>mypage</title>

<style>
.formBlock {
	margin: 15px;
}

#formDiv {
	margin-top: 50px;
}
#myInfo{
	color: black;
}
h2{
	text-align: center;
}
#table{
	color: black;
	margin: 0 auto;
}
img{
	width: 250px;
}
button{
	margin: 5px;
	background-color: silver;
}
input[type=checkbox] {
    display: none;
}
input{
	margin: 5px;
}

</style>

</head>

<body>
    
<!-- service section -->
            <section class="works-section">
        	    	<!-- section background -->
        	    	<div class="bg-container-static"></div>
                	<!-- end section background -->
                	<!-- content -->
                	<div class="content col-md-8 col-md-offset-2 col-sm-12 col-sm-rlt col-xs-12 no-pad centering-y">
                	    	<div class="carousel-col">
                    	
                            	<!-- service 2 -->
                    	    	<div class="service col-md-4">
                    	
                        	    	<!-- text container -->
                        	    	<div class="text-container">
                        		    	
		<!-- context시작 -->
		<div class="container">
			
			<br>
			<div class="content">
				<div class="subscribe">

					<div id="formDiv">
						<form id="form" class="form-inline" role="form" onsubmit="return false">
							<div style="padding-left: 41%;" id=myPhoto></div>
							<div id="myInfo"></div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- context끝 -->
                        		    	
                        	    	</div>
                        	    	<!-- end text container -->
                    	    	</div>
                    	    	<!-- end service 2 -->                        
                        	</div>
                    	</div>
                	<!-- end content -->
                	
                	
            	</section>
            <!-- end service section -->
            
            
              <script>
   
              $(document).ready(function(){
            	 
            		
            	  myInfo();
              }); 
              	
        function myInfo() {
        	
        	var id = '${id}';

            $.ajax({
                url: 'http://localhost:8080/toti/member/mypage',
                type: 'GET',
                data: {id: id},
                success: function(data) {
                    //alert(JSON.stringify(data));

                    var html = '';
                    html += '<table id="table"> <tr>';
                    html += '<td style="display:none">아이디</td>';
                    html += '<td>' + data.id + '</td> </tr>';	                   	
                    html += '<tr style="display:none"><td>이름</td>';
                    html += '<td>' + data.name + '</td></tr>';
                    html += '<tr style="display:none"><td>성별</td>';
                    html += '<td>' + data.gender + '</td></tr>';
                    html += '<tr style="display:none"><td>회원 등급</td>';
                    html += '<td>' + data.ver + '</td></tr>';
                   	//html += '<td><button style="color=black;" onclick="mentorInsert(\'' + data.id + '\')">고수등록</button></td></tr>';
                   /*  html += '<tr><td>사진</td>';
                    html += '<td><img src="http://localhost:8080/toti/uploadfile/yu/' + data.photo_name + '"></td></tr>'; */
                    html += '<tr style="display:none"><td>가입날짜</td>';
                    //html += '<td>' + data.regDate + '</td></tr></table>';
                    html += '<td>' + data.regDate + '</td></tr>';
                    html += '<tr><td><button class="btn btn-primary" onclick="edit(\'' + data.id + '\')">멘토등록 진행</button></td>';
                    html += '<td><button style=\"background-color:silver;\" class=\"btn btn-primary\"><a href=\"http://localhost:8080/toti/mypage\">뒤로가기</a></button></td></tr></table>';
                    
                    

                    $('#myInfo').html(html);
                }

            });
        }
		function myPhoto() {
        	
        	var id = '${id}';

            $.ajax({
                url: 'http://localhost:8080/toti/member/mypage',
                type: 'GET',
                data: {id: id},
                success: function(data) {
                   // alert(JSON.stringify(data));

                    var html = '';
                    html += '<img  style="display:none" src="http://localhost:8080/toti/uploadfile/yu/' + data.photo_name + '">';
         
                    $('#myPhoto').html(html);
                }

            });
        }
                function edit(id) {

            $.ajax({
                url: 'http://localhost:8080/toti/member/mypage/id',
                type: 'GET',
                data: {
                    id: id
                },
                success: function(data) {
                    //alert(JSON.stringify(data));

                    var html = '';

                    html += '<h3 style="text-align:center;">회원확인을 위하여 비밀번호를 적어주세요</h3><br><hr>';
                    html += '<table id="table"><tr>';
                    html += '<td>아이디</td>';
                    html += '<td> <input class="form-control" type="text" value="' + data.id + '" id="id" name="id" readonly>' + '</td> </tr>';
                    
                    
                    html += '<td> <input class="form-control" type="hidden" value="' + data.idx + '" id="idx" name="idx" readonly>' + '</td> </tr>';
                    html += '<td> <input class="form-control" type="hidden" value="Y" id="ver" name="ver" readonly>' + '</td> </tr>';
                    
                    html += '<tr><td>비밀번호</td>';
                    html += '<td> <input class="form-control" type="password" id="pw" name="pw" onfocusout="checkPw()">' + '</td> </tr>';
                    html += '<tr><td>비밀번호 확인</td>';
                    html += '<td> <input class="form-control" type="password" id="pw2" name="pw2" ><span id="pwSpan"></span><span id="pwSpan2"></span><input type="checkbox" id="pwCheck"></td></tr>';
                    html += '<tr><td>이름</td>';
                    html += '<td> <input class="form-control" type="text" value="' + data.name + '" id="name" name="name" readonly>' + '</td></tr>';
                    html += '<tr style="display:none"><td>성별</td>';
                    html += '<td> <input class="form-control" type="text" value="' + data.gender + '" id="gender" name="gender" readonly>' + '</td></tr>';
                    //html += '<tr><td>회원 상태</td>';
                    //html += '<td> <input class="form-control" type="text" value="' + data.ver + '" id="ver"  readonly>' + '</td></tr>';
                    
                    html += '<tr><td colspan="2"><input id="Oeditbtn" type="button" value="지도 등록"></td></tr></table>';

                    html += '<button style="float: right"  onclick="cancel()">취소</button>';

                    $('#myInfo').html(html);

                    /*사진 업로드*/
                    $('#feditbtn').click(function() {
						
                    	//alert('사진업로드 ajax');
                        var formData = new FormData(); // 파일 전송 -> FormData()활용

                        formData.append('id', $('#id').val());
                        if ($('#photo').val()) {
                            formData.append('photo', $('photo')[0].files[0]);
                        } else {
                           // alert('사진을 업로드 해주세요!');
                            return false;
                        }
                        $.ajax({
                            url: 'http://localhost:8080/toti/member/mypage',
                            type: 'POST',
                            data: formData,
                            processData: false, //파일 전송 시 필수
                            contentType: false, //파일 전송 시 필수
                            dataType: 'text',
                            success: function(data) {
                                alert(data);
                            }
                        });
                        return false;
                    });
 
                    /*그 외 업로드*/
                    $('#Oeditbtn').click(function() {

                        $.ajax({
                            url: 'http://localhost:8080/toti/member/mypage',
                            type: 'PUT',

                            	//alert("수정되었습니다.");
                            
                            data: JSON.stringify({
                            	idx: $('#idx').val(),
                            	name: $('#name').val(),
                            	id: $('#id').val(),
                                pw: $('#pw').val(),
                                gender: $('#gender').val(),
                                ver: $('#ver').val()        
                               // photo: $('#photo').val()
                            }),
                            contentType: 'application/json; charset=utf-8',
                            dataType: 'text',
                            success: function(data) {
                                //alert(요청하신 정보로 변경되었습니다.);
                                location.href = "http://localhost:8080/toti/main";
                              //alert(요청하신 정보로 변경되었습니다.);
                            }
                        });
                        return false;
                    });
                }

            });

        }
        
        function cancel(){
        	location.href = "http://localhost:8080/toti/mypage";
        }

        function checkPw() {
            // 비밀번호 재입력 시 일치하는지 확인
            $('#pw2, #pw').focusout(function() {
                if ($('#pw').val() == $('#pw2').val()) {
                    $('#pwSpan').html('비밀번호 일치');
                    $('#pwSpan').css('color', 'green');
                    $('#pwCheck').prop('checked', true);
                } else {
                    $('#pwSpan').html('비밀번호 불일치');
                    $('#pwSpan').css('color', 'red');
                    $('#pwSpan').focus();
                    $('#pwCheck').prop('checked', false);
                }
            });
        }
    </script>
</body>
<script src="../js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="../js/bootstrap.min.js" type="text/javascript"></script>
</html>