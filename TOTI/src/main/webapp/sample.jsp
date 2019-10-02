<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/frame/header.jsp" %>
	<title>Blog Masonry | Triangle</title>
</head><!--/head-->
<body>
	<%@ include file="/WEB-INF/views/frame/nav.jsp" %>
    <!--/#header-->
    <section id="page-breadcrumb">
        <div class="vertical-center sun">
             <div class="container">
                <div class="row">
                    <div class="action">
                        <div class="col-sm-12">
                            <h1 class="title">여기가 타이틀</h1>
                            <p>설명?...</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/#action-->
    
    <section id="blog" class="padding-top padding-bottom">
        <div class="container">
            <div class="row">
                   <div class="col-md">
                       	여기에 콘텐츠 @@@@@@@@@@@@@@@@@@@@@@
                        <!-- 제공하는 컨텐츠 이렇게 넣으세여 예시↓ -->
                        <div class="single-blog two-column">
                            <div class="post-thumb">
                                <a href="blogdetails.html"><img src="images/blog/masonary/9.jpg" class="img-responsive" alt=""></a>
                                <div class="post-overlay">
                                    <span class="uppercase"><a href="#">14 <br><small>Feb</small></a></span>
                                </div>
                            </div>
                            <div class="post-content overflow">
                                <ul class="nav nav-justified post-nav">
                                    <li><a href="#"><i class="fa fa-tag"></i>Creative</a></li>
                                </ul>
                                <h2 class="post-title bold"><a href="blogdetails.html">Advanced business cards design</a></h2>
                                <h3 class="post-author"><a href="#">Posted by micron News</a></h3>
                                <p>Duis autem vel eum iriure dolor in hendrerit in blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber [...]</p>
                                <a href="#" class="read-more">View More</a>
                                <div class="post-bottom overflow">
                                    <ul class="nav nav-justified post-nav">
                                        <li><a href="#"><i class="fa fa-heart"></i>32 Love</a></li>
                                        <li><a href="#"><i class="fa fa-comments"></i>3 Comments</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                      <!-- 예시 끝 -->
                     <!-- 동준님 이거 쓰세여 회원가입 -->
                     <!-- 너비 조절은 col-md-4 col-sm-12 클래스를 통해서 하세여 더 늘리고싶으면 col-md-5 로 올리는 식으로 -->
                     <div class="col-md-4 col-sm-12">
                         <div class="contact-form bottom">
                             <h2>Send a message</h2>
                             <form id="main-contact-form" name="contact-form" method="post" action="sendemail.php">
                                 <div class="form-group">
                                     <input type="text" name="name" class="form-control" required="required" placeholder="Name">
                                 </div>
                                 <div class="form-group">
                                     <input type="email" name="email" class="form-control" required="required" placeholder="Email Id">
                                 </div>
                                 <div class="form-group">
                                     <textarea name="message" id="message" required="required" class="form-control" rows="8" placeholder="Your text here"></textarea>
                                 </div>
                                 <div class="form-group">
                                     <input type="submit" name="submit" class="btn btn-submit" value="Submit">
                                 </div>
                             </form>
                         </div>
                     </div>
                    <!-- 여기까지 -->
                    </div>
                </div>
            </div>
    </section>
    <!--/#blog-->
    
	<%@ include file="/WEB-INF/views/frame/footer.jsp" %>

	<script>
		
		$(document).ready(function() {
			
		});
	
	</script>
</body>
</html>