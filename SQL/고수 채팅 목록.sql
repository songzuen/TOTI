-- 견적서 번호, 회원 사진, 회원 이름, 회원이 요청한 분야,서비스, 고수의 견적 비용, 회원 요구사항
select est_idx,m_photo,m_name, cate_name,service_name, format(est_price,0) est_price, answer_cont from toti.toti_estimatee e 
join toti.toti_request r on r.request_idx = e.request_idx
join toti.toti_member m on r.m_idx = m.m_idx
join toti.toti_mentee_service ms on ms.request_idx = r.request_idx
join toti.toti_service s on s.service_idx = ms.service_idx
join toti.toti_cate c on c.cate_idx = s.cate_idx
join toti.toti_answer a on a.request_idx = r.request_idx
where quest_idx = 999 and mento_idx = 2
order by est_date desc;

