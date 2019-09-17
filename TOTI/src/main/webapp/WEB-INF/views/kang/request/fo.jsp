<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.7.2.js"></script>
<!-- title -->
<title>TOTI</title>
<style>
	body {
		padding: 0;
		margin: 0;
	}
</style>
</head>
<body>
			<div>
				<div>
					<input type="hidden" value="${data.cate_idx}" id="cate_idx">
					<h2>${data.cate_name}</h2>
				</div>
				
						회원 Idx : <input type="text" placeholder="회원ID">

							<div>
								<input type="hidden" value="${ quest.quest_idx }" id="${ quest.quest_idx }_quest_idx">
								 1. ${data.cate_name}분야에서 원하는 서비스는 ?
								<div>
									<c:forEach items="${data.service}" var="service" varStatus="stat">
										<input type="checkbox" value="${ service.service_idx }"> ${ service.service_name }<br>
									</c:forEach>
								</div>
							</div>
					<c:forEach items="${data.quest}" var="quest" varStatus="stat">
						<div class="step well">
							<div>
								<input type="hidden" value="${ quest.quest_idx }" class="quest_idx">
								<input type="text" value="${ quest.quest_type }" class="${ quest.quest_idx }_type">
								${stat.count+1}. ${ quest.quest_name }
								<div id="${ quest.quest_idx }_item_wrap">
									
								</div>
							</div>
						</div>
					</c:forEach>
	</div>
<script type="text/javascript">

	$(document).ready(function() {
				
		$(".quest_idx").each(function(){
			itemList($(this).val());
		});
		
	});

	
	function itemList(quest_idx) {

			$.ajax({
					url : 'http://localhost:8080/toti/itemList/' + quest_idx,
					type : 'GET',
					success : function(data) {						
						var html = '';
						
						alert($('.'+quest_idx+'_type').val());
						
						for (var i = 0; i < data.length; i++) {
							html += '<input type="'+$('.'+quest_idx+'_type').val()+'" value="'+data[i].item_idx+'">'+ data[i].item_cont + '<br>';
						}

						$('#'+quest_idx+'_item_wrap').html(html);
						

					}

			});

	}
</script>	
	
</body>
</html>
