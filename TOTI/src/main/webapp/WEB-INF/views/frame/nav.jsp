<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <% session = request.getSession();
      Object idxstr = session.getAttribute("idx");
      String id = (String)session.getAttribute("id");
      
   %>
<header id="header">
   <div class="navbar navbar-inverse" role="banner">
      <div class="container">
         <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
               data-target=".navbar-collapse">
               <span class="sr-only">Toggle navigation</span> <span
                  class="icon-bar"></span> <span class="icon-bar"></span> <span
                  class="icon-bar"></span>
            </button>
            <!-- logo -->
            <a class="navbar-brand" href="<c:url value="/" />">
               <h1>
                  <img height="80" src="<c:url value="/images/toti_logo.png" />" alt="logo">
               </h1>
            </a>
         </div>
         <!-- nav -->
         <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
            <% 
               if(idxstr == null){
            %>
               <!-- 로그인전 nav-->
               <li><a href="<c:url value="/login" />">로그인</a></li>
               
               <li class="active"><a href="<c:url value="/reg" />">회원가입</a></li>
               
            <%
            } else if (idxstr != null && id.equals( "admin@admin")){%>
             <!-- --------------- -->
            <li><a href="<c:url value="/service" />">상세 서비스</a></li>
               <li><a href="<c:url value="/question" />">요청서 질문</a></li>
               
                 <li class="dropdown"><a href="#">${name}님<i class="fa fa-angle-down"></i></a>
                <ul role="menu" class="sub-menu">
                         <li style="padding: 5px 0 10px 15px">
                         <div>안녕하세요, ${name}님 </div>
                         </li>
                         <hr>
                        <li><a href="<c:url value="/member/logout"/>">로그아웃</a></li>     
                  </ul>
             <% 
             } else { 
            %>
            
               <!-- 멘티 로그인 -->
                        <li><a href="<c:url value="/user/requests" />">보낸요청</a></li>
                        <li><a href="<c:url value="/chat/chatLogin" />">채팅</a></li>
                        <li><a href="<c:url value="/mentorList" />">멘토찾기</a></li>
                        <li class="dropdown"><a href="#">${name} 멘티님<i class="fa fa-angle-down"></i></a>
                            <ul role="menu" class="sub-menu">
                               <li style="padding: 5px 0 10px 15px">
                                  <div>안녕하세요, ${name}님 </div>
                                </li>
                                <li><a href="<c:url value="/user/requests" />">보낸요청</a></li>
                                <li><a href="#">설정</a></li>
                                <li><a href="<c:url value="/mypage" />">마이페이지</a></li>
                                <hr>
                                
                                <li><a href="#">멘토로 전환</a></li>
                                <li><a href="<c:url value="/member/logout"/>">로그아웃</a></li>
                                
                            </ul>
                        </li>
                        
                        <!-- 멘토 로그인 -->

                        <li><a href="<c:url value="/requestList" />">받은요청</a></li>
                        <li><a href="<c:url value="/mentor/chatList" />">채팅</a></li>
                        <li><a href="<c:url value="/profile/${idx}" />">프로필</a></li>
                        <li class="dropdown"><a href="#">${name}멘토님<i class="fa fa-angle-down"></i></a>
                            <ul role="menu" class="sub-menu">
                               <li style="padding: 5px 0 10px 15px">
                                   <div>안녕하세요, ${name}님</div>
                                   <div>★ 평점 5.0 | 리뷰 1</div>
                                </li>
                                <li><a href="<c:url value="/profile/${idx}" />">프로필 관리</a></li>
                                <li><a href="aboutus2.html">설정</a></li>
                                <hr>
                                <li><a href="service.html">고객으로 전환</a></li>
                                <li><a href="pricing.html">로그아웃</a></li>
                            </ul>
                        </li>
                        <%
                  }
                  %>
            </ul>
         </div>
         <div class="search">
            <form role="form">
               <i class="fa fa-search"></i>
               <div class="field-toggle">
                  <input style="font-size: 13px; width: 250px" type="text"
                     class="search-form" autocomplete="off"
                     placeholder="원하는 분야를 검색하세요.">
               </div>
            </form>
         </div>
      </div>
   </div>
</header>