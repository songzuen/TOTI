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
</body>
</html>