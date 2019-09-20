<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginPage</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="<c:url value="/css/default.css"/>" rel="stylesheet" type="text/css">

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
       
    </style>
</head>

                <div  class="col-lg-4 col-md-6 ml-auto mr-auto" id="userPage">
					<!--<div class="card card-login"> -->
                        <form class="form" method="post" id="loginForm">
                            <div>
                                <h4 class="">로그인</h4>
                            </div>

                            <div>

                                <div class="input-group">
<!--                                     <div class="input-group-prepend"></div> -->
                                    <input type="text" class="form-control" placeholder="ID" id="login_id" name="login_id">
                                </div>
                                <div class="input-group">
                                    <input type="password" class="form-control" placeholder="Password" id="login_pw" name="login_pw">

                                </div>
                            </div>
                            <br> <br>
                            <div>

                                <input type="submit" value="로그인"><br>
                                <a href="#" id="getRegistForm" onclick="getRegistForm()">회원가입</a>
                                <span id="forgotAccount"> <a href="#"  onclick="forgotAccount()">아이디/비밀번호 찾기</a>
                                </span>

                            </div>
                        </form>

                        <form class="form" method="post" id="registForm" style="display: none">
                            <div>
                                <h4 class="">회원가입</h4>
                            </div>

                            <article style="width: 100%; text-align: center;">고수 등록은 로그인 후 마이페이지에서 등록하실 수 있습니다.</article>

                            <div>
                                <div class="input-group">
<!--                                     <div class="input-group-prepend"></div> -->
                                    <input type="text" class="form-control" placeholder=" ID" id="m_id" name="m_id"> <input type="checkbox" id="idcheck" class="id_pw_check">
                                </div>
                                <article id='idcheckmsg' style="font-size: 11px; display: inherit;"></article>
                                <div class="input-group">
                                    <input type="password" class="form-control" placeholder="Password" id="m_pw" name="m_pw"> <input type="checkbox" id="pwcheck" class="id_pw_check">
                                </div>
                                <article id='pwcheckmsg' style="font-size: 11px; display: inherit;"></article>
                                <div class="input-group">
                                    <input type="password" class="form-control" placeholder="Password" id="confirm_pw">
                                </div>
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Name" id="m_name" name="m_name">
                                </div>
                                <div class="input-group">
                                    <input type="email" class="form-control" placeholder="Email" id="m_email" name="m_email"> <input type="checkbox" id="emailcheck" class="id_pw_check">
                                </div>
                                <article id='emailcheckmsg' style="font-size: 11px; display: inherit;"></article>
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="M / F" id="m_gender" name="m_gender">
                                </div>
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="기본 N" id="m_ver" name="m_ver" value="N">
                                </div>
                            </div>
                            <br> <br> <br> <br>
                            <div>
                                <input type="submit" value="Regist">
                            </div>
                        </form>
                        <div class="form" style="display: none;" id="myPage">

                            <div>
                                <h4 class="">My Page</h4>
                            </div>
                            <form>

                                <table id="myPageTable">
                                    <tr>
                                        <td colspan="2" id="loginPhoto"><img id="profileImage" class="profileImage"></td>
                                    </tr>
                                    <tr>
                                        <td><input type="hidden" id="loginIdx"></td>
                                    </tr>
                                    <tr>
                                        <td>아이디</td>
                                        <td><input type="text" id="loginId" readonly></td>
                                    </tr>
                                    <tr>
                                        <td>이름</td>
                                        <td><input type="text" id="loginName" readonly></td>
                                    </tr>
                                    <tr>
                                        <td>이메일</td>
                                        <td><input type="text" id="loginEmail" readonly></td>
                                    </tr>
                                    
                                </table>
                                <div >
                                    <a href="#" onclick="getEditForm()">프로필 변경</a>
                                    <button onclick="logout()">로그아웃</button>
                                    <br> <a href="#" onclick="getDeleteForm()">회원 탈퇴</a>
                                </div>
                            </form>
                        </div>
                       
                        <div class="form" style="display: none;" id="adminPage">
                            <div>
                                <h4 class="">대장님 Page</h4>
                            </div>
                            <form>
                                <table id="memberInfoTable">
                                    <tr>
                                        <td>IDX</td>
                                        <td>ID</td>
                                        <td>NAME</td>
                                        <td>Email</td>
                                        <td>Ver</td>
                                        <td>gender</td>
                                        <td>codeVer</td>
                                    </tr>
                                </table>
                                <div>
                                    <button onclick="logout()">로그아웃</button>
                                </div>
                            </form>
                        </div>
                        <form class="form" style="display: none;" id="pwCheckForm">
                            <div>
                                <h4 class="">Password Check</h4>
                            </div>
                            <br>
                            <article style="width: 100%; text-align: center;">본인 확인을 위해 비밀번호를 입력해주세요.</article>
                            <br>
                            <table>
                                <tr>
                                    <td>비밀번호</td>
                                    <td><input type="password" class="edit form-control" id="chkPw1"></td>
                                </tr>
                                <tr>
                                    <td>확인</td>
                                    <td><input type="password" class="edit form-control" id="chkPw2"></td>
                                </tr>
                            </table>
                            <div>
                                <a href="#" onclick="getEditForm()">뒤로가기</a> <input type="submit" value="확인">
                            </div>
                        </form>
                        <div class="form" style="display: none;" id="EditForm">
                            <div>
                                <h4 class="">정보 수정</h4>
                            </div>
                            <form>
                            
                                <table>
                                    <tr>
                                        <td><input type="hidden" class="edit form-control" id="editIdx"></td>
                                    </tr>
                                    <tr>
                                        <td>NAME</td>
                                        <td><input type="text" class="edit form-control" id="editName"></td>
                                    </tr>
                                    <tr>
                                        <td>Email</td>
                                        <td><input type="text" class="edit form-control" id="editEmail"></td>
                                    </tr>
                                    <tr>
                                        <td>사진</td>
                                        <td><input type="file" class="edit form-control" id="editPhoto"></td>
                                    </tr>
                                </table>
                                <div>
                                    <input type="submit" value="수정하기"><br>
                                    <a href="#" id="getPwCheckForm" onclick="getPwCheckForm()">비밀번호를 변경</a> <br>
                                </div>
                            </form>
                        </div>
                        <form class="form" style="display: none;" id="pwEditForm">
                            <div>
                                <h4 class="">비밀번호 변경</h4>
                            </div>
                            <br>
                            <article>변경할 비밀번호를 입력해주시옵소서</article>
                            <br>
                            <table style="width: 100%">
                                <tr>
                                    <td>비밀번호</td>
                                    <td><input type="password" class="edit form-control" id="editPw1"><input type="checkbox" id="pwEditcheck" class="id_pw_check"></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <article id='pwEditcheckmsg' style="font-size: 11px; display: inherit;"></article>
                                    </td>
                                </tr>
                                <tr>
                                    <td>확인</td>
                                    <td><input type="password" class="edit form-control" id="editPw2"></td>

                                </tr>
                            </table>
                            <div>
                                <input type="submit" value="확인">
                            </div>
                        </form>
                        <div class="form" style="display: none;" id="notVerifyForm">
                            <div>
                                <h4 class="">인증 미승인</h4>
                            </div>
                            <br>
                            <article style="width: 100%; text-align: center;">미인증 사용자<br>메일 인증 후 다시 이용해주세요.<br> 
                            <a href="#" id="reSendMail" onclick="reSendMail()">메일인증 재전송</a>
                            </article>
                            <br> <input type="hidden" id="remailId">
                            <div>
                                <a href="#" onclick="getLoginForm()">로그인</a> <br>
                            </div>
                        </div>
                        <form class="form" style="display: none;" id="forgotIdForm">
                            <div>
                                <h4 class="">아이디를 분실하셨나염?</h4>
                            </div>
                            <br>
                            <article style="width: 100%; text-align: center;">아이디 찾기를 위해 마이에스큐엘 워크벤치에 저장되어있는 개인정보를 입력해주세요.</article>
                            <br>
                            <table style="width: 100%">
                                <tr>
                                    <td>이름</td>
                                    <td><input type="text" class="edit form-control" id="forgotId_name"></td>
                                </tr>
                                <tr>
                                    <td>이메일</td>
                                    <td><input type="text" class="edit form-control" id="forgotId_email"></td>
                                </tr>
                            </table>
                            <div>
                                <input type="submit" value="확인"><a href="#" onclick="getLoginForm()">로그인</a>
                            </div>
                        </form>
                        <form class="form" style="display: none;" id="forgotPwForm">
                            <div>
                                <h4 class="">비밀번호를 분실하셨나염???</h4>
                            </div>
                            <br>
                            <article style="width: 100%; text-align: center;">비밀번호 찾기를 위한 개인정보를 입력해주세요.제가 확인해보고 알려드릴께염</article>
                            <br>
                            <table style="width: 100%">
                                <tr>
                                    <td>아이디</td>
                                    <td><input type="text" class="edit form-control" id="forgotPw_id"></td>
                                </tr>
                                <tr>
                                    <td>이름</td>
                                    <td><input type="text" class="edit form-control" id="forgotPw_name"></td>
                                </tr>
                                <tr>
                                    <td>이메일</td>
                                    <td><input type="text" class="edit form-control" id="forgotPw_email"></td>
                                </tr>
                            </table>
                            <div>
                                <input type="submit" value="확인"><a href="#" onclick="getLoginForm()">로그인</a>
                            </div>
                        </form>
                        <form class="form" style="display: none;" id="deleteForm">
                            <div>
                                <h4 class="">회원 탈퇴를 위한 비밀번호 확인</h4>
                            </div>
                            <br>
                            <article style="width: 100%; text-align: center;">김래원 : 내가 10일동안 울면서 후회하고 만들었는데, 니 꼭 그랬어야 되냐? 너 그러면 안됐어. 꼭 그렇게 다 가져가야만 속이 후련했냐? 탈퇴하실생각이면 비밀번호를 입력하지 아니하지 아니하십시오</article>
                            <br>
                            <table style="width: 100%">
                                <tr>
                                    <td>비밀번호</td>
                                    <td><input type="password" class="edit form-control" id="deletePw1"></td>
                                </tr>
                                <tr>
                                    <td>비밀번호 확인</td>
                                    <td><input type="password" class="edit form-control" id="deletePw2"></td>
                                </tr>
                            </table>
                            <div class="footer text-center">
                                <a href="#" onclick="">뒤로가기</a> <input type="submit" value="탈퇴하기">
                            </div>
                        </form>
                    </div>

 <script>
        $(document).ready(function() {
            if (sessionStorage.getItem('loginId') == null) {
                displayNone();
                $('#userPage').addClass('col-md-6');
                $('#userPage').addClass('col-lg-4');
                $('#loginForm').css('display', 'block');
                
            } else if (sessionStorage.getItem('loginId') == 'admin') {
                displayNone();
                getAdminInfo();
                
            } else {
                displayNone();
                $('#userPage').addClass('col-md-6');
                $('#userPage').addClass('col-lg-4');
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
    </script>

</body></html>