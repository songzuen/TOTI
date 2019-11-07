<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<meta
   content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
   name='viewport' />
<meta name="viewport" content="width=device-width" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

   <%@ include file="/WEB-INF/views/frame/header.jsp" %>
   <title>Blog Masonry | Triangle</title>
   <style type="text/css">
   #mainTable{
      
      left: 30%;
      margin: auto;
      background-color: #A9F5F2;
   }
   
   input{
      margin: 5px;
   }

   input[type=checkbox] {
       display: none;
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
                             <h2 style="text-align: center;">회원가입</h2>
                             <form id="form" name="contact-form" role="form" enctype="multipart/form-data">
                                 <div class="form-group">
                                     <input type="email" name="id" id="id" class="form-control" placeholder="id" required>
                                     <input class="btn btn-primary" type="button" onclick="checkId()" value="아이디 중복체크">
                              <input type="checkbox" id="idCheck"><br>
                              <span id="checkIdSpan"></span>
                                 </div>
                                 <div class="form-group">
                                     <input type="password" name="pw" id="pw" class="form-control"  placeholder="password" required>
                                 </div>
                                 
                                 <div class="form-group">
                                     <input type="password" name="pw2" id="pw2" class="form-control"  placeholder="password check" required>
                                     <br><span id="pwSpan"></span> <span id="pwSpan2"></span> <input type="checkbox" id="pwCheck">
                                 </div>
                                 
                                 <div class="form-group">
                                     <input type="text" name="name" id="name" class="form-control"  placeholder="name" required>
                                     <span id="nameSpan"></span>
                                 </div>
                                 
                                 <div class="form-group">
                        
                              <input type="radio" name="radio" id="radio" value="F" /> 여자
                           <input type="radio" name="radio" id="radio" value="M" /> 남자
                     
                                 </div>
                                 
                                 <div class="form-group">
                                     <input style="display:none;" type="text" name="ver" id="ver" value="N" class="form-control"  placeholder="ver" required>
                                 </div>
                                 
                                 <div class="form-group">
                                     <input type="submit" name="submit" class="btn btn-submit" value="회원가입">
                                 </div>
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
    $(document).ready(function() {

      $('#pw2, #pw').focusout(function() {
         if ($('#pw').val() == $('#pw2').val()) {
            $('#pwSpan').html('비밀번호가 일치합니다.');
            $('#pwSpan').css('color', 'green');
            $('#pwCheck').prop('checked', true);
         } else { 
            $('#pwSpan').html('비밀번호가 서로 일치하지 않습니다.');
            $('#pwSpan').css('color', 'red');
            $('#pwSpan').focus();
            $('#pwCheck').prop('checked', false);
         }
      });

      $('#form').submit(function() {

         if (!$('#idCheck').prop('checked')) {
            alert('아이디가 중복체크를 해주세요');
            return false;
         }
         if (!$('#pwCheck').prop('checked')) {
            alert('비밀번호를 다시 확인하세요');
            return false;
         }

         var checkPw = RegExp(/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{4,16}$/);
         var checkName = RegExp(/^[가-힣a-zA-Z]+$/); // 이름: 한글,영문만 가능
         if (!checkPw.test($('#pw').val())) {
            $('#pwSpan2').html('영문과 최소 숫자한개이상 섞어주세요');
            $('#pwSpan2').css('color', 'red');
            $('#pw2').focus();
            return false;
         }
         if (!checkName.test($('#name').val())) {
            $('#nameSpan').html('한글.영문가능');
            $('#nameSpan').css('color', 'red');
            $('#name').focus();
            return false;
         }
         
         
         
         
         var formData = new FormData(); 
         formData.append('id', $('#id').val());
         formData.append('pw', $('#pw').val());
         formData.append('name', $('#name').val());
         formData.append('gender', $('input[name="radio"]:checked').val());
         formData.append('ver', $('#ver').val());
         
         $.ajax({
            url : '/toti/member/reg',
            type : 'POST',
            data : formData,
            processData : false,
            contentType : false, 
            dataType: 'text',
            success : function(data) {
               //alert(data);
               alert('이메일로 인증키를 발송했습니다. 메일에서 인증후에 다시 사용해주시기바랍니다.');
               location.href = "/toti/main";
            }
         });
         
         return false;
         
      });
   });

   function checkId() {

      var id = $('#id').val();
      if (id.length < 1) {
         alert('아이디를 입력해주시기 바랍니다.   ');
      } else {
         $.ajax({
            url : '/toti/member/reg?id='+id,
            type : 'GET',
            success : function(data) {
               if (data == 'Y') {
                  $('#checkIdSpan').html("이 아이디를 사용하실 수 있습니다.");
                  $('#checkIdSpan').css('color', 'green');
                  $('#idCheck').prop('checked', true);
               } else {
                  $('#checkIdSpan').html("이미 사용중인 아이디입니다.");
                  $('#checkIdSpan').css('color', 'red');
                  $('#idCheck').prop('checked', false);
               }
            }
         });
      }

   }
   </script>
    
    
</body>
</html>