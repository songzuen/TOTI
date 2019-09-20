SELECT a.request_idx,m.m_idx, m_name, m_photo, c.cate_name, quest_name, answer_cont, service_name, request_date 
FROM toti.toti_answer a 
left outer join toti.toti_question q on q.quest_idx = a.quest_idx 
join toti.toti_request r on r.request_idx = a.request_idx
join toti.toti_member m on m.m_idx = r.m_idx 
join toti.toti_cate c on q.cate_idx = c.cate_idx
join toti.toti_mentee_service tee on m.m_idx =  tee.m_idx
join toti.toti_service s on s.service_idx = tee.service_idx and c.cate_idx = s.cate_idx
where not c.cate_idx = 4
order by request_date desc;