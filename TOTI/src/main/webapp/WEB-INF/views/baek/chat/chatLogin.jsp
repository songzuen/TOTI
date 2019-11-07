<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>TOTI</title>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script
	src="http://localhost:3000/socket.io/socket.io.js"></script>
<%@ include file="/WEB-INF/views/frame/header.jsp"%>
</head>
<!--/head-->
<body>
	<%@ include file="/WEB-INF/views/frame/nav.jsp"%>
	<!--/#header-->
	<section id="page-breadcrumb">
		<div class="vertical-center sun">
			<div class="container">
				<div class="row">
					<div class="action">
						<div class="col-sm-12">
							<h1 class="title">채 팅</h1>
							<p>로그인 먼저 해주세요</p>
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

					<form method="post">
						<input type="text" name="m_id" required="required"> <input
							type="submit">
					</form>
					<!-- 예시 끝 -->
				</div>
			</div>
		</div>
	</section>
	<!--/#blog-->

	<%@ include file="/WEB-INF/views/frame/footer.jsp"%>

	<script>
		$(document).ready(function() {

		});
	</script>
</body>
</html>