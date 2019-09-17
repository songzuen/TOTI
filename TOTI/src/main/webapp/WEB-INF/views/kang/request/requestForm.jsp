<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/frame/contents/header.jsp"%>
<!-- title -->
<title>TOTI</title>
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
				<div>
					<input type="hidden" value="${data.cate_idx}" id="cate_idx">
					<h2>${data.cate_name}</h2>
				</div>
				<div class="col-md-8 col-md-offset-2">
					<div class="progress">
						<div
							class="progress-bar progress-bar-info progress-bar-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100">
						</div>
					</div>
					<form role="form" action="" method="post">
					<div class="step well">
							<div>
								<input type="hidden" value="${ quest.quest_idx }" id="${ quest.quest_idx }_quest_idx">
								 1. ${data.cate_name}분야에서 원하는 서비스는 ?
								<div>
									<c:forEach items="${data.service}" var="service" varStatus="stat">
										<input type="checkbox" name="${ service.service_idx }_service" value="${ service.service_idx }"> ${ service.service_name }<br>
									</c:forEach>
								</div>
							</div>
					</div>
					<c:forEach items="${data.quest}" var="quest" varStatus="stat">
						<div class="step well">
							<div>
								<input type="hidden" value="${ quest.quest_idx }" id="${ quest.quest_idx }_quest_idx">
								${stat.count+1}. ${ quest.quest_name }
								<div id="${ quest.quest_idx }_item_wrap">
									
								</div>
							</div>
						</div>
					</c:forEach>
					</form>
					<button class="action back btn btn-info">Back</button>
					<input type="submit" class="action submit btn btn-success" value="보내기">
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
	
<script type="text/javascript">
	
	var quest_idx = 0;

	$(document).ready(function() {
	
		var current = 1;
		
		var list = new Array();
		
		<c:forEach items="${data.quest}" var="item">
			list.push("${item.quest_idx}");
		</c:forEach>
		
		for (var i = 0; i < list.length; i++) {
			quest_idx = $('#'+list[i]+'_quest_idx').val();
			itemList(quest_idx);
		}
		
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
			
			quest_idx = $('#'+current+'_quest_idx').val();
			
			itemList(quest_idx);
			
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
		
		function itemList(quest_idx) {
			
			$.ajax({
				url : 'http://localhost:8080/toti/itemList/'+quest_idx,
				type : 'GET',
				success : function(data) {
					
					var html = '';
					for (var i = 0; i < data.length; i++) {
						html += '<input type="radio" name="'+quest_idx+'_item" value="'+data[i].item_idx+'">'+ data[i].item_cont+'<br>';
					}

					$('#'+quest_idx+'_item_wrap').html(html);
				}

			});
			
		}
	</script>	
	
</body>
</html>
