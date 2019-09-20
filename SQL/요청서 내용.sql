SELECT r.request_idx, quest_name, answer_cont, m.m_idx, m_name, m_photo,cate_name, service_name FROM toti.toti_answer a 
join toti.toti_question q on q.quest_idx = a.quest_idx 
join toti.toti_request r on r.request_idx = a.request_idx join toti.toti_member m on m.m_idx = r.m_idx 
join toti.toti_cate c on q.cate_idx = c.cate_idx
left outer join (select cate_idx, service_name, m_idx from toti.toti_service se 
join toti.toti_mentee_service tee on se.service_idx = tee.service_idx ) cate on cate.cate_idx = c.cate_idx
where r.request_idx =1
