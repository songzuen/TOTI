<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginPage</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script>
        var patternId = /^[a-zA-Z0-9]{5,12}$/g;
        var patternPw = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/
    </script>
<style>
        .id_pw_check {
            display: none;
        }
        .display_none {
            display: none;
        }
        .color_red {
            color: red;
        }
        .back_img_red {
            border-bottom: 1px solid red;
        }
        table tr {
            text-align: center;
        }
        #myPageTable tr td:first-child {
            width: 25%;
        }
        table tr td input {
            width: 90%;
            border: 0;
            text-align: center;
        }
        .update {
            text-align: left;
            width: 95%;
        }
        .profileImage {
            width: 250px;
            height: 250px;
        }
       
    </style>
    </head>
    <body>
    
<!-- contact section -->
<section class="contact-section">
	<!-- section background -->
	<div class="bg-container-static"></div>
	<!-- end section background -->

	<!-- half overlay -->
	<div class="half-overlay right"></div>
	<!-- end half overlay -->

	<!-- content -->
	<div
		class="content col-md-10 col-md-offset-1 col-sm-12 col-xs-12 no-pad centering-y col-sm-rlt">
	


                <div  class="col-lg-4 col-md-6 ml-auto mr-auto" id="userPage">
					<!--<div class="card card-login"> -->
                        <form class="form" method="post" id="loginForm" >
                            
                                <h4>로그인</h4>

                            <div >
                            	<table>
                            		<tr>
                            			<td>아이디</td>
                            			<td><input type="text" class="form-control" placeholder="ID" id="login_id" name="login_id"></td>
                            		</tr>
                            		<tr>
                            			<td>비밀번호</td>
                            			<td><input type="password" class="form-control" placeholder="Password" id="login_pw" name="login_pw"></td>
                            		</tr>
                            		<tr>
                            			<td><a href="#" id="getRegistForm" onclick="getRegistForm()">회원가입</a></td>
                            			<td><span id="forgotAccount"> <a href="#"  onclick="forgotAccount()">아이디/비밀번호 찾기</a> </span></td>
                            		</tr>
                            		<tr>
                            			<td colspan="1"><input type="submit" value="로그인"></td>
                            		</tr>
                            	</table>
                            
                            </div>
                            </form>
                            
       
                            
                         
</div>
</div>
</section>

 <script>
        $(document).ready(function() {
            if (sessionStorage.getItem('loginId') == null) {
                displayNone();
                $('#userPage');
                $('#userPage');
                $('#loginForm').css('display', 'block');
                
            } else if (sessionStorage.getItem('loginId') == 'admin') {
                displayNone();
                getAdminInfo();
                
            } else {
                displayNone();
                $('#userPage');
                $('#userPage');
                getLoginInfo(sessionStorage.getItem('loginId'));
                
            }
            $('#loginForm').submit(function() {
                $.ajax({
                    url: 'http://localhost:8080/toti/member/login',
                    type: 'POST',
                    data: $('#loginForm').serialize(),
                    success: function(data) {
                        var str = data.split('_');
                        if (data == 'admin') {
                            var info = JSON.stringify(data);
                            sessionStorage.setItem('loginId', data);
                            displayNone();
                            getAdminInfo();
                        } else if (str[1] == 'notVerify') {
                            getNotVerifyForm();
                            $('#reSendMail').val(str[0]);
                        } else if (data != 'fail') {
                            var info = JSON.stringify(data);
                            sessionStorage.setItem('loginId', data);
                            displayNone();
                            getLoginInfo(sessionStorage.getItem('loginId'));
                        } else {
                            alert('로그인에 실패\n 아이디와 비밀번호 확인 부탁!');
                            
                        }
                    }
                });
                return false;
            });
            $('#m_id').focusin(function() {
                $('#m_id').removeClass('back_img_red')
                
            });
        });
        function getLoginInfo(m_id) {
            $.ajax({
                url: 'http://localhost:8080/toti/member/mypage/' + m_id,
                type: 'GET',
                success: function(data) {
                    if (data != null) {
                        $('#myPage').css('display', 'block');
                        $('#loginIdx').val(data.m_idx);
                        sessionStorage.setItem('m_idx', (data.m_idx));
                        $('#loginId').val(data.m_id);
                        $('#loginName').val(data.m_name);
                        $('#loginEmail').val(data.m_email);
                        if (data.photo == null) {
                            $('#loginPhoto').html('프로필 사진 없음');
                        } else {
                            var str = 'http://localhost:8080/toti/uploadfile/userphoto/'
                            $('#profileImage').attr('src', str + data.m_photo);
                        }
                    } else {
                    }
                }
            });
        }
        function getAdminInfo() {
            $('#adminPage').css('display', 'block');
            $('#userPage').removeClass('col-lg-4');
            $.ajax({
                url: 'http://localhost:8080/toti/admin/memberlist',
                type: 'GET',
                success: function(data) {
                    //alert(JSON.stringify(data))
                    var html = '';
                    for (var i = 0; i < data.length; i++) {
                        html += '<tr>\n';
                        html += '<td>' + data[i].m_idx + '</td>\n';
                        html += '<td>' + data[i].m_id + '</td>\n';
                        html += '<td>' + data[i].m_name + '</td>\n';
                        html += '<td>' + data[i].m_email + '</td>\n';
                        html += '<td>' + data[i].m_codeVer + '</td>\n';
                        html += '</tr>\n';
                    }
                    $('#memberInfoTable').append(html);
                }
            });
        }
        $('#m_id').focusout(function() {
            var idchk = $('#m_id').val();
            var flag = patternId.test(idchk);
            var test = patternId.test(idchk);
            if (flag) {
                $('#idcheckmsg').css('display', 'none');
                $.ajax({
                    url: 'http://localhost:8080/toti/member/idCheck',
                    type: 'GET',
                    data: {
                        m_id: $(this).val()
                    },
                    success: function(data) {
                        if (data == 'Y') {
                            $('#idcheck').prop('checked', true);
                            $('#idcheckmsg').removeClass('color_red');
                            $('#idcheckmsg').css('display', 'none');
                        } else if (data == 'N') {
                            $('#idcheck').prop('checked', false);
                            $('#idcheckmsg').css('display', 'block');
                            $('#idcheckmsg').html('이미 사용중인 아이디입니다.');
                            $('#idcheckmsg').addClass('color_red');
                        }
                    }
                });
            } else {
                $('#idcheck').prop('checked', false);
                $('#idcheckmsg').css('display', 'block');
                $('#idcheckmsg').html('그거 안되 ~다시다시~');
                $('#idcheckmsg').addClass('color_red');
            }
        });
        $('#m_pw').focusout(function() {
            if ($(this).val().length > 0) {
                if (patternPw.test($(this).val()) && ($(this).val().length <= 16)) {
                    $('#pwcheck').prop('checked', true);
                    $('#pwcheckmsg').css('display', 'none');
                    $('#m_pw').removeClass('back_img_red')
                } else {
                    $('#pwcheck').prop('checked', false);
                    $('#pwcheckmsg').css('display', 'block');
                    $('#pwcheckmsg').html('다시다시 해줘~ 특수문자 한개 넣어~~');
                    $('#pwcheckmsg').addClass('color_red');
                    $('#m_pw').addClass('back_img_red')
                }
            }
        });
        $('#m_email').focusout(function() {
            $.ajax({
                url: 'http://localhost:8080/toti/member/emailCheck',
                type: 'GET',
                data: {
                    m_email: $(this).val()
                },
                success: function(data) {
                    if (data == 'Y') {
                        $('#emailcheck').prop('checked', true);
                        $('#emailcheckmsg').removeClass('color_red');
                        $('#emailcheckmsg').css('display', 'none');
                    } else if (data == 'N') {
                        $('#emailcheck').prop('checked', false);
                        $('#emailcheckmsg').css('display', 'block');
                        $('#emailcheckmsg').html('이미 사용중인 메일입니다.');
                        $('#emailcheckmsg').addClass('color_red');
                    }
                }
            });
        });
        $('#registForm').submit(function() {
            var m_pw1 = $('#m_pw').val();
            var m_pw2 = $('#confirm_pw').val();
            var m_id = $('#m_id').val();
            var m_name = $('#m_name').val();
            var m_email = $('#m_email').val();
            if (m_id == '' || m_pw1 == '' || m_pw2 == '' || m_name == '' || m_email == '') {
                alert('빠짐없이 입력해주세요.');
                return false;
            } else if (!$('#idcheck').prop('checked')) {
                alert('중복된 아이디입니다.');
                return false;
            } else if (m_pw1 != m_pw2) {
                alert('비밀번호를 다시 확인해주세여 둘이달라여');
                return false;
            } else if (!$('#emailcheck').prop('checked')) {
                alert('중복된 이메일입니다.');
                return false;
            } else {
                $.ajax({
                    url: 'http://localhost:8080/toti/member/regist',
                    type: 'POST',
                    data: $('#registForm').serialize(),
                    success: function(data) {
                        if (data == 'SUCCESS') {
                            alert('가입성공\n 메일에서 본인 인증 부탁');
                            displayNone();
                            $('#loginForm').css('display', 'block');
                        } else if (data == 'FAIL') {
                            alert('가입에 실패\n다시 확인');
                        }
                    }
                });
                return false;
            }
        });
        $('#editPw1').focusout(function() {
            if ($(this).val().length > 0) {
                if (patternPw.test($(this).val()) && ($(this).val().length <= 16)) {
                    $('#pwEditcheck').prop('checked', true);
                    $('#pwEditcheckmsg').css('display', 'none');
                    $('#eidtPw1').removeClass('back_img_red')
                } else {
                    $('#pwEditcheck').prop('checked', false);
                    $('#pwEditcheckmsg').css('display', 'block');
                    $('#pwEditcheckmsg').html('요즘은 특수문자 하나정도는 넣어야함 ');
                    $('#pwEditcheckmsg').addClass('color_red');
                    $('#editPw1').addClass('back_img_red')
                }
            }
        });
        $('#pwCheckForm').submit(function() {
            var login_id = sessionStorage.getItem('loginId');
            var login_pw = $('#chkPw1').val();
            var confirm_pw = $('#chkPw2').val();
            if (login_pw != confirm_pw) {
                alert('비밀번호가 서로 일치 X')
                return false;
            } else if (login_pw == confirm_pw) {
                var list = {
                    login_id: login_id,
                    login_pw: login_pw
                }
                $.ajax({
                    url: 'http://localhost:8080/toti/member/pwcheck',
                    type: 'POST',
                    data: JSON.stringify(list),
                    contentType: 'application/json; charset=UTF-8',
                    success: function(data) {
                        if (data == 'SUCCESS') {
                            getPwEditForm();
                        } else {
                            alert('비밀번호가 올바르지 않습니다.');
                        }
                    }
                })
            }
            return false;
        });
        $('#deleteForm').submit(function() {
            var login_id = sessionStorage.getItem('loginId');
            var login_pw1 = $('#deletePw1').val();
            var confirm_pw1 = $('#deletePw2').val();
            var list = {
                login_id: login_id,
                login_pw: login_pw1
            }
            var m_idx = sessionStorage.getItem('m_idx');
            if (login_pw1 != confirm_pw1) {
                alert('입력한 두 값이 다릅니다.')
                return false;
            } else if (login_pw1 == confirm_pw1) {
                $.ajax({
                    url: 'http://localhost:8080/toti/member/pwcheck',
                    type: 'POST',
                    data: JSON.stringify(list),
                    contentType: 'application/json; charset=UTF-8',
                    success: function(data) {
                        if (data == 'SUCCESS') {
                            if (confirm('진짜 탈퇴할꺼야?ㅠ?')) {
                                $.ajax({
                                    url: 'http://localhost:8080/toti/member/delete/' + m_idx,
                                    type: 'DELETE',
                                    success: function(data) {
                                        if (data == 'SUCCESS') {
                                            alert('누구세요? 저 아세요?')
                                            logout();
                                        }
                                    }
                                });
                            } else {
                            }
                        } else {
                            alert('너 누구냐? ');
                        }
                    }
                })
            }
            return false;
        })
        $('#editForm').submit(function() {
            var formData = new FormData();
            var file = $('#editPhoto')[0].files[0];
            formData.append('editIdx', $('#editIdx').val());
            formData.append('editName', $('#editName').val());
            formData.append('editEmail', $('#editEmail').val());
            formData.append('editPhoto', file);
            $.ajax({
                url: 'http://localhost:8080/toti/member/edit',
                type: 'POST',
                data: formData,
                contentType: false,
                processData: false,
                success: function(data) {
                    if (data == 'SUCCESS') {
                        alert('수정완료');
                        displayNone();
                        $('#mypage').css('display', 'block');
                        getLoginInfo(sessionStorage.getItem('loginId'));
                    }
                }
            });
            return false;
        });
        $('#pwEditForm').submit(function() {
            var editPw1 = $('#editPw1').val();
            var editPw2 = $('#editPw2').val();
            var list = {
     			editIdx: $('#editIdx').val().editPw1
            	}
            if (editPw1 != editPw2) {
                alert('다름, 서로 다름.')
            } else {
                $.ajax({
                    url: 'http://localhost:8080/toti/member/pwEdit',
                    type: 'PUT',
                    data: JSON.stringify(list),
                    contentType: 'application/json; charset=UTF-8',
                    success: function(data) {
                        if (data == 'SUCCESS') {
                            displayNone();
                            getLoginInfo(sessionStorage.getItem('loginId'));
                            alert('비밀번호 변경');
                        } else {
                            alert('변경 실패');
                        }
                    }
                })
            }
        });
        function reSendMail() {
            var m_id = $('#reSendMail').val();
            $.ajax({
                url: 'http://localhost:8080/toti/member/remail',
                type: 'GET',
                data: {
                    m_id: m_id
                },
                success: function(data) {
                    if (data = 'SUCCESS') {
                        alert('메일을 재전송했습니다.\n확인 후 인증해주세요.');
                    }
                }
            });
        };
        $('#forgotIdForm').submit(function() {
            var m_name = $('#forgotId_name').val();
            var m_email = $('#forgotId_email').val();
            $.ajax({
                url: 'http://localhost:8080/toti/member/forgotId',
                type: 'GET',
                data: {
                	m_name: m_name,
                	m_email: m_email
                },
                success: function(data) {
                    if (data == 'FAIL' || data == '') {
                        alert('일치하는 정보없음');
                    } else if (data == 'SUCCESS') {
                        alert('메일전송 완료')
                    }
                }
            });
        });
        $('#forgotPwForm').submit(function() {
            var m_id = $('#forgotPw_id').val();
            var m_name = $('#forgotPw_name').val();
            var m_email = $('#forgotPw_email').val();
            $.ajax({
                url: 'http://localhost:8080/toti/member/forgotPw',
                type: 'GET',
                data: {
                	m_id: m_id,
                	m_name: m_name,
                	m_email: m_email
                },
                success: function(data) {
                    if (data == 'FAIL' || data == '') {
                        alert('일치하는 계정 정보가 없습니다.\n\n확인 후 다시 이용해주세요.');
                    } else if (data == 'SUCCESS') {
                        alert('이메일로 임시 비밀번호를 전송해드렸습니다.')
                    }
                }
            });
        });
        function forgotAccount() {
            var html = '<a href = "#"  onclick = "getForgotIdForm()";> 아이디 찾기</a>';
            html += '<br><a href = "#" onclick = "getForgotPwForm()";> 비밀번호 찾기</a>';
            $('#forgotAccount').html(html);
        }
        function getLoginForm() {
            displayNone();
            var html = '<a href="#" onclick="forgotAccount()">계정 까먹었으면 눌러줘영</a>'
            $('#forgotAccount').html(html);
            $('#loginForm').css('display', 'block');
        };
        function getForgotIdForm() {
            displayNone();
            $('#forgotIdForm').css('display', 'block');
        }
        function getForgotPwForm() {
            displayNone();
            $('#forgotPwForm').css('display', 'block');
        }
        function getRegistForm() {
            displayNone();
            $('#registForm').css('display', 'block');
        };
        function getEditForm() {
            displayNone();
            $('#editForm').css('display', 'block');
            $('#editIdx').val($('#loginIdx').val());
            $('#editName').val($('#loginName').val());
            $('#editEmail').val($('#loginEmail').val());
            $('#editPhone').val($('#loginPhone').val());
        }
        function getPwEditForm() {
            displayNone();
            $('#pwEditForm').css('display', 'block');
        }
        function getPwCheckForm() {
            displayNone();
            $('#pwCheckForm').css('display', 'block');
        }
        function getNotVerifyForm() {
            displayNone();
            $('#notVerifyForm').css('display', 'block');
        }
        function getDeleteForm() {
            displayNone();
            $('#deleteForm').css('display', 'block');
        }
        function displayNone() {
            $('#loginForm').css('display', 'none');
            $('#registForm').css('display', 'none');
            $('#myPage').css('display', 'none');
            $('#editForm').css('display', 'none');
            $('#pwCheckForm').css('display', 'none');
            $('#pwEditForm').css('display', 'none');
            $('#notVerifyForm').css('display', 'none');
            $('#forgotIdForm').css('display', 'none');
            $('#forgotPwForm').css('display', 'none');
            $('#deleteForm').css('display', 'none');
        }
        function logout() {
            sessionStorage.removeItem('loginId');
            sessionStorage.removeItem('m_idx');
            displayNone();
            location.reload();
        }     
        
        function displayNone() {
            $('#registForm').css('display', 'none');
            $('#pwCheckForm').css('display', 'none');
        }
    </script>

</body></html>