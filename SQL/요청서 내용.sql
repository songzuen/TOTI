-- 요청서 번호, 질문 내용, 답 내용, 회원번호, 회원이름, 회원 사진, 회원 선택 분야/ 서비스 
SELECT r.request_idx,quest_name, answer_cont, m.m_idx, m_name, m_photo,cate_name, cate.service_name FROM toti.toti_answer a 
join toti.toti_question q on q.quest_idx = a.quest_idx 
join toti.toti_request r on r.request_idx = a.request_idx join toti.toti_member m on m.m_idx = r.m_idx 
join toti.toti_cate c on q.cate_idx = c.cate_idx
join toti.toti_mentee_service ms on ms.request_idx = r.request_idx
join toti.toti_service s on ms.service_idx = s.service_idx
left outer join (select cate_idx, se.service_idx, se.service_name, m_idx from toti.toti_service se 
join toti.toti_mentee_service tee on se.service_idx = tee.service_idx ) cate on cate.service_idx = s.service_idx
where r.request_idx =2
group by q.quest_idx;
