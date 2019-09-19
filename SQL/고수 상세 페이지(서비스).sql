select *,
		(if(isnull(review_idx),'리뷰 없음',review_cont))
		review_cont, (if(isnull(review_idx),0,(select
		round(avg(sr.review_star),1) from toti.toti_review sr where
		sr.mento_idx = t.mento_idx))) str,
		(select count(review_cont) from toti.toti_review src where src.mento_idx =
		t.mento_idx) cont_cnt
		from toti.toti_mentor t join toti.toti_mentor_profile p on t.mento_idx =
		p.mento_idx
		join toti.toti_member b on b.m_idx = t.mento_idx
		join toti.toti_cate c on c.cate_idx = t.cate_idx
		join toti_mentor_service tor on tor.mento_idx = t.mento_idx
        join toti_service ser on ser.service_idx = tor.service_idx
		join toti_mentee_service tee on tee.service_idx = ser.service_idx
		left outer join
		(select * from (select
		review_idx,mento_idx,review_star,review_cont, review_date,m_idx as
		member_idx,m_name as member_name from toti.toti_review w join
		toti.toti_member e on w.m_idx = e.m_idx ) na where review_idx > 0) r
        on r.mento_idx = t.mento_idx;
		where tee.m_idx = r.m_idx and t.mento_idx = 3 ;
        
        select * from toti.toti_review