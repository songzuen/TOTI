<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

	<%@ include file="/WEB-INF/views/frame/header.jsp" %>
	<title>Blog Masonry | Triangle</title>
	<style type="text/css">
	#mainTable{
		width:500px;
		left: 30%;
		margin: auto;
		background-color: #E3F6CE;
	}
	
	input{
		margin: 5px;
	}

	input[type=checkbox] {
    	display: none;
	}

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
</head><!--/head-->
<body>
	<%@ include file="/WEB-INF/views/frame/nav.jsp" %>
    <!--/#header-->
    
   <section id="blog" class="padding-top padding-bottom">
        <div class="container">
            <div class="row">
                   <div class="col-md">
               
                      <!-- 예시 끝 -->
                     <!-- 동준님 이거 쓰세여 회원가입 -->
                     <!-- 너비 조절은 col-md-4 col-sm-12 클래스를 통해서 하세여 더 늘리고싶으면 col-md-5 로 올리는 식으로 -->
                     <div class="col-md-4 col-sm-12"  id="mainTable">
                         <div class="contact-form bottom">
                         <div id="formDiv">
                             <form id="form" name="contact-form" onsubmit="return false">
                                <div style="padding-left:23%;" id=myPhoto></div>
                                <div id="myInfo"></div>
                                	
                             </form>
                             </div>
                         </div>
                     </div>
                    <!-- 여기까지 -->
                    
                
                    </div>
                </div>
            </div>
    </section>
    <!--/#blog-->

    <footer id="footer">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 text-center bottom-separator">
                    <img src="images/home/under.png" class="img-responsive inline" alt="">
                </div>
                <div class="col-sm-12">
                    <div class="copyright-text text-center">
                        <p>&copy; TOTI Company 2019.</p>
                        <p>TOTI <a target="_blank" href="https://github.com/son9zuen/TOTI/tree/master">Git Hub Page</a></p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!--/#footer-->


    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/lightbox.min.js"></script>
    <script type="text/javascript" src="js/wow.min.js"></script>
    <script type="text/javascript" src="js/main.js"></script>
    
<script>
   
      $(document).ready(function(){
            	 
            		
            	  myInfo();
              }); 
              	
        function myInfo() {
        	
        	var id = '${id}';

            $.ajax({
                url: '/toti/member/mypage',
                type: 'GET',
                data: {id: id},
                success: function(data) {
                    //alert(JSON.stringify(data));

                    var html = '';
                    html += '<div style="text-align:center;"><h4>TOTI에서는 수많은 멘티와 멘토님들을 연결해드립니다.<h4>';
                    html += '<h4>멘티들을 만나 회원님의 재능을 보여주세요 <h4>';

                    html += '<table id="table"><tr style="display:none">';
                    html += '<td>아이디</td>';
                    html += '<td>' + data.id + '</td> </tr>';	                   	
                    html += '<tr style="display:none"><td>이름</td>';
                    html += '<td>' + data.name + '</td></tr>';
                    html += '<tr style="display:none"><td>성별</td>';
                    html += '<td>' + data.gender + '</td></tr>';
                    html += '<tr style="display:none"><td>회원 등급</td>';
                    html += '<td>' + data.ver + '</td></tr>';
                   	//html += '<td><button style="color=black;" onclick="mentorInsert(\'' + data.id + '\')">고수등록</button></td></tr>';
                   /*  html += '<tr><td>사진</td>';
                    html += '<td><img src="/toti/uploadfile/yu/' + data.photo_name + '"></td></tr>'; */
                    html += '<tr style="display:none"><td>가입날짜</td>';
                    //html += '<td>' + data.regDate + '</td></tr></table>';
                    html += '<td>' + data.regDate + '</td></tr>';
                    html += '<tr><td><button class="btn btn-primary" onclick="edit(\'' + data.id + '\')">멘토등록 진행</button></td>';
                    html += '<td><button style=\"background-color:silver;\" class=\"btn btn-primary\"><a href=\"/toti/mypage\">뒤로가기</a></button></td></tr></table>';
                    

                    $('#myInfo').html(html);
                }

            });
        }
		function myPhoto() {
        	
        	var id = '${id}';

            $.ajax({
                url: '/toti/member/mypage',
                type: 'GET',
                data: {id: id},
                success: function(data) {
                   // alert(JSON.stringify(data));

                    var html = '';
                    html += '<img src="/toti/uploadfile/yu/' + data.photo_name + '">';
         
                    $('#myPhoto').html(html);
                }

            });
        }
        
       

        function edit(id) {

            $.ajax({
                url: '/toti/member/mypage/id',
                type: 'GET',
                data: {
                    id: id
                },
                success: function(data) {
                    //alert(JSON.stringify(data));

                    var html = '';

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

                    html += '<button style=\"float: right; background-color:silver;\"  class=\"btn btn-primary\"  onclick="cancel()">취소</button>';

                    $('#myInfo').html(html);

                    /*사진 업로드*/
                    $('#feditbtn').click(function() {
						
                        var formData = new FormData(); // 파일 전송 -> FormData()활용

                        formData.append('id', $('#id').val());
                        if ($('#photo').val()) {
                            formData.append('photo', $('photo')[0].files[0]);
                        } else {
                            return false;
                        }
                        $.ajax({
                            url: '/toti/member/mypage',
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
                            url: '/toti/member/mypage',
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
                                alert('멘토님의 상세 정보를 등록해주세요');
                                location.href = "/toti/insertMen";
                              //alert(요청하신 정보로 변경되었습니다.);
                            }
                        });
                        return false;
                    });
                }

            });

        }
        
        function cancel(){
        	location.href = "/toti/mypage";
        }

        function checkPw() {
            // 비밀번호 재입력 시 일치하는지 확인
            $('#pw2, #pw').focusout(function() {
                if ($('#pw').val() == $('#pw2').val()) {
                    $('#pwSpan').html('비밀번호와 아이디가 일치합니다.');
                    $('#pwSpan').css('color', 'green');
                    $('#pwCheck').prop('checked', true);
                } else {
                    $('#pwSpan').html('비밀번호와 아이디가 일치하지 않습니다.');
                    $('#pwSpan').css('color', 'red');
                    $('#pwSpan').focus();
                    $('#pwCheck').prop('checked', false);
                }
            });
        }
    </script>
</body>
</html>
