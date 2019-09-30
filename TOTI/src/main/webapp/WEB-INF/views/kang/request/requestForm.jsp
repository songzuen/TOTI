<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/frame/contents/header.jsp"%>
<!-- title -->
<title>TOTI</title>
<style type="text/css">
.map_wrap {
	position: relative;
	width: 100%;
	height: 350px;
}

.title {
	font-weight: bold;
	display: block;
}

.hAddr {
	position: absolute;
	left: 10px;
	top: 10px;
	border-radius: 2px;
	background: #fff;
	background: rgba(255, 255, 255, 0.8);
	z-index: 1;
	padding: 5px;
}

#centerAddr {
	display: block;
	margin-top: 2px;
	font-weight: normal;
}

.bAddr {
	padding: 5px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}
</style>
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
					<form role="form" method="post" id="requestForm">
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
		var c = 0;
		
		btnnext.click(function() {
	
			if(!$('input:radio[name=service_idx]').is(':checked')) {
				alert("체크해주세요");
			}else if(current > 1){
				
				if ($('input[name="answerDatas['+c+'].answer_cont"]').attr('type') == 'checkbox' || $('input[name="answerDatas['+c+'].answer_cont"]').attr('type') == 'radio') {
					if($('input[name="answerDatas['+c+'].answer_cont"]:checked').length == 0) {
						alert('체크 ㅠ');
					}else {
						if (current < widget.length) {
							widget.show();
							widget.not(':eq(' + (current++) + ')').hide();
							setProgress(current);
							c++;
						}
						hideButtons(current);
					}
				}else {
					if($('input[name="answerDatas['+c+'].answer_cont"]').val() == '') {
						alert('빈칸채우세여');
					}else{
						if (current < widget.length) {
							widget.show();
							widget.not(':eq(' + (current++) + ')').hide();
							setProgress(current);
							c++;
						}
						hideButtons(current);
					}
				}
			}else {
				
				if(c < 0) {
					c = 0;
				}
				
				if (current < widget.length) {
						widget.show();
						widget.not(':eq(' + (current++) + ')').hide();
						setProgress(current);
				}
				hideButtons(current);
			}

		})

		// Back button click action
		btnback.click(function() {

			if (current > 1 || c > 0) {
				current = current - 2;
				c = c-2;
				btnnext.trigger('click');
				
			}
			
			hideButtons(current);
			
		})
		
		
		$('#requestForm').submit(function() {
			  
			if($('input[name="answerDatas['+c+'].answer_cont"]').val() == '') {
				alert('빈칸채우세여');
				
				return false;
			}
		});
		
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
						
						html += '<input type="button" value="주소가져오기" onclick="openMap()">';
						html += '주소 : <input type="text" id="city_idx" name="answerDatas['+cnt+'].answer_cont">';
						
						
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
		
		
		function openMap() {
			
            window.name = 'requestForm';
            // window.open("open할 window", "자식창 이름", "팝업창 옵션");
            window.open('<c:url value="/request/map" />', 'mapForm', "width=800, height=600,top = 100, left = 100, resizable = no, scrollbars = no");
		}
		
</script>
</body>
</html>
