SELECT a.request_idx,m.m_idx, m_name, m_photo,quest_name, answer_cont, service_name, request_date 
FROM toti.toti_answer a 
join toti.toti_question q on q.quest_idx = a.quest_idx
join toti.toti_request r on r.request_idx  = a.request_idx 
join toti.toti_member m on m.m_idx = r.m_idx
join toti.toti_cate c on q.cate_idx = c.cate_idx 
join toti.toti_mentee_service tee on r.request_idx =  tee.request_idx
join toti.toti_service s on s.service_idx = tee.service_idx
where c.cate_idx = 4 and q.quest_idx = 999 and tee.service_idx in 
(select service_idx from toti.toti_mentor_service mts join toti.toti_mentor mt on mt.mento_idx=mts.mento_idx 
where mt.mento_idx=3)
order by request_date desc;
