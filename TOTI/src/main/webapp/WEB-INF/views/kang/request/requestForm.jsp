<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/frame/contents/header.jsp"%>
<!-- title -->
<title>TOTI</title>
<script type="text/javascript">
	$(document).ready(function() {
		var current = 1;

		widget = $(".step");
		btnnext = $(".next");
		btnback = $(".back");
		btnsubmit = $(".submit");

		// Init buttons and UI
		widget.not(':eq(0)').hide();
		hideButtons(current);
		setProgress(current);

		// Next button click action
		btnnext.click(function() {
			if (current < widget.length) {
				widget.show();
				widget.not(':eq(' + (current++) + ')').hide();
				setProgress(current);
			}
			hideButtons(current);
		})

		// Back button click action
		btnback.click(function() {
			if (current > 1) {
				current = current - 2;
				btnnext.trigger('click');
			}
			hideButtons(current);
		})
	});

	// Change progress bar action
	setProgress = function(currstep) {
		var percent = parseFloat(100 / widget.length) * currstep;
		percent = percent.toFixed();
		$(".progress-bar").css("width", percent + "%").html(percent + "%");
	}

	// Hide buttons according to the current step
	hideButtons = function(current) {
		var limit = parseInt(widget.length);

		$(".action").hide();

		if (current < limit)
			btnnext.show();
		if (current > 1)
			btnback.show();
		if (current == limit) {
			btnnext.hide();
			btnsubmit.show();
		}
	}
</script>
</head>
<body>
	<%@include file="/WEB-INF/views/frame/loading.jsp"%>
	<!-- page container -->
	<div class="page-container">
		<%@include file="/WEB-INF/views/frame/contents/contentsHeader.jsp"%>
		<%@include file="/WEB-INF/views/frame/contents/nav.jsp"%>
		<!-- demo content -->
		<div class="demo-content mrg-top-md">
			<!-- container -->
			<div class="container" style="margin-top: -50px">
				<div class="col-md-8 col-md-offset-2">
					<div class="progress">
						<div
							class="progress-bar progress-bar-info progress-bar-striped active"
							role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
					</div>
					<form role="form">
						<div class="step well">
							<div>
								질문 1 <label for="f">여자</label> <input type="radio" id="f">
								<input type="text">
							</div>
						</div>
						<div class="step well">
							<label for="usr">Mobile Number:</label> <input type="text"
								class="form-control" id="usr">
						</div>
						<div class="step well">
							<div class="form-group">
								<label for="email">Email address:</label> <input type="email"
									class="form-control" id="email">
							</div>
						</div>
						<div class="step well">
							<div class="form-group">
								<label for="pwd">Password:</label> <input type="password"
									class="form-control" id="pwd">
							</div>
							<div class="form-group">
								<label for="pwd">Retype Password:</label> <input type="password"
									class="form-control" id="pwd">
							</div>
						</div>
						<input type="submit" class="action submit btn btn-success"
							value="보내기">
					</form>
					<button class="action back btn btn-info">Back</button>
					<button class="action next btn btn-info">Next</button>
				</div>
				<!-- end home variation -->
				<!-- end component -->
			</div>
			<!-- end container -->
		</div>
		<!-- end demo content -->
		<!-- footer -->
		<%@include file="/WEB-INF/views/frame/contents/footer.jsp"%>
	</div>
</body>
</html>
