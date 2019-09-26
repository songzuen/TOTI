-- 각 고수의 개인정보, 고수에게 달린 리뷰들(각 리뷰의 별점, 리뷰개수, 별점 평), 고수 제공 서비스 
select *,(if(isnull(r.review_idx),'리뷰 없음',r.review_cont)) cont,
(if(isnull(r.review_idx),'리뷰 없음',(select round(avg(sr.review_star),1) from toti.toti_review sr where sr.mento_idx = t.mento_idx))) str,
(select count(review_cont) from toti.toti_review src where src.mento_idx = t.mento_idx) cont_cnt,
(
select group_concat(service_name SEPARATOR ',') from toti.toti_mentor_service tor
join toti.toti_mentor m on m.mento_idx = tor.mento_idx
join toti_service ser on ser.service_idx = tor.service_idx
where t.mento_idx = tor.mento_idx
group by tor.mento_idx
) tor_sname
from toti.toti_mentor t join toti.toti_mentor_profile p on t.mento_idx = p.mento_idx
join toti.toti_member b on b.m_idx = t.mento_idx
join toti.toti_cate c on c.cate_idx = t.cate_idx
left outer join 
(
select * from 
	(
    select review_idx,mento_idx,review_star,review_cont, review_date, m_name as member_name 
    from toti.toti_review w join toti.toti_member e on w.m_idx = e.m_idx 
    ) na
	where review_idx > 0
) r on r.mento_idx = t.mento_idx
where t.mento_idx = 3
order by review_date desc