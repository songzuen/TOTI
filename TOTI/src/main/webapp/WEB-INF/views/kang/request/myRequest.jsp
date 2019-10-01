<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="myRequest">
</div>
<script>
		
	$(document).ready(function() {
		
		rquestData();
	
	});

	function rquestData() {

		$.ajax({
			url : 'http://localhost:8080/toti/requestData',
			type : 'GET',
			data : {
				request_idx : $('#request_idx').val(),
				m_idx : $('#m_idx').val()
			},
			success : function(data) {
				
				var html = '';
				
				html += '<img src="<c:url value="/images/user/'+data.userInfo.m_photo+'" />">';
				html += '<div id="requesr_user"><p>'+data.request_date+'</p>';
				html += '<h2>'+data.cate_name+'('+data.service_name+')</h2><h3>'+data.userInfo.m_name+'님</h3></div>';
				html += '<div id="request_con">'
				
				for (var i = 0; i < data.answer.length; i++) {
					html += '<p class="con_p1">'+data.answer[i].quest_name+'</p>';
					html += '<p class="con_p2">'+data.answer[i].answer_cont+'</p>';			
				}
				
				html += '</div>';

				$('#myRequest').html(html);
			}

		});
		
	}
</script>