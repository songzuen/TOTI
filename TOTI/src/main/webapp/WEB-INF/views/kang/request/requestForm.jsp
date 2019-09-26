<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/frame/contents/header.jsp"%>

<script type="text/javascript" src="<c:url value="/js/jquery.ajax-cross-origin.min.js" />"></script>
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
					<h2>${data.cate_name}</h2>
				</div>
				<div class="col-md-8 col-md-offset-2">
					<div class="progress">
						<div
							class="progress-bar progress-bar-info progress-bar-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100">
							<div id="dd">
							</div>
						</div>
					</div>
					<form role="form" method="post">
					<div>
						<!-- 분야번호 -->
						<input type="hidden" value="${data.cate_idx}" id="cate_idx" name="cate_idx">
						<!-- 회원번호 -->
						<input type="hidden" placeholder="회원ID" name="m_idx" value="1">
					</div>
					<div class="step well">
							<div>
								 ${data.cate_name}분야에서 원하는 서비스는 ?
								<div>
									<c:forEach items="${data.service}" var="service" varStatus="stat">
										<input id="${ service.service_idx }_service" type="radio" value="${ service.service_idx }" name="service_idx">
										<label for="${ service.service_idx }_service">${ service.service_name }</label><br>
									</c:forEach>
								</div>
							</div>
					</div>
					<c:forEach items="${data.quest}" var="quest" varStatus="stat">
						<div class="step well">
							<div>
								<input type="hidden" value="${ quest.quest_idx }" class="quest_idx" name="answerDatas[${stat.index}].qurest_idx">
								<input type="hidden" value="${ quest.quest_type }" class="${ quest.quest_idx }_type">
								${ quest.quest_name }
								<div id="${ quest.quest_idx }_item_wrap">
									
								</div>
							</div>
						</div>
					</c:forEach>				
					<input type="submit" class="action submit btn btn-success" value="보내기">
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
	
<script type="text/javascript">

	

	$(document).ready(function() {
				
		var cnt = 0;
		
		$(".quest_idx").each(function(){
			itemList($(this).val(), cnt);
			cnt++;
		});

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
			
			quest_idx = $('#'+current+'_quest_idx').val();

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
		
		function itemList(quest_idx, cnt) {
			
			$.ajax({
				url : 'http://localhost:8080/toti/itemList/'+quest_idx,
				type : 'GET',
				success : function(data) {
					
					var html = '';
					
					if(quest_idx == 999) {
						for (var i = 0; i < data.length; i++) {
							html += '<input id="'+data[i].item_idx+'_item" type="'+$('.'+quest_idx+'_type').val()+'"'
							if($('#cate_idx').val() == 1){
								html +=	'placeholder="ex) 음치탈출하고싶어요"';
							}else if($('#cate_idx').val() == 2){
								html +=	'placeholder="ex) 몸치탈출하고싶어요"';
							}else if($('#cate_idx').val() == 3){
								html +=	'placeholder="ex) 악보읽기 힘들어요"';
							}
							html += 'name="answerDatas['+cnt+'].answer_cont" >';
						}
					}else if(quest_idx == 6){
					
						$.ajax({
							crossOrigin: true,
							url : 'http://localhost:8080/toti/xml/City.xml',
							dataType : 'xml',
							error : function(error) {
								alert(error);
							},
							success : function(data) {
								alert('언제');
								
								/* html += '<select id="api" name="api">';
								html += '<option selected>광역시/도</option>';

								for (var i = 0; i < data.BorodCityResponse.borodCity.length; i++) {	
								html += '<option value="'+ data.BorodCityResponse.borodCity[i].brtcNm +'">'+ data.BorodCityResponse.borodCity[i].brtcNm + '</option>';
								}
								
								html +=	'</select>'; */
								
 							}
						});
	
					}else {
						for (var i = 0; i < data.length; i++) {
							html += '<input id="'+data[i].item_idx+'_item" type="'+$('.'+quest_idx+'_type').val()+'" value="'+data[i].item_cont+'"';
							html += 'name="answerDatas['+cnt+'].answer_cont" >';
							html += '<label for="'+data[i].item_idx+'_item">'+ data[i].item_cont + '</label><br>';
						}
					}
					
					$('#'+quest_idx+'_item_wrap').html(html);
				
				}

			});
			
		}
		
		
	</script>	
	<script type="text/javascript" src="<c:url value="/js/jquery.ajax-cross-origin.min.js" />"></script>
</body>
</html>
