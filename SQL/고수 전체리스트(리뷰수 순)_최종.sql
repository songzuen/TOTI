-- 리뷰 수 순서로 고수번호, 고수 사진, 고수 이름, 고수 분야, 고수 지역, 고수 한줄 소개, 고수 레슨 관련 리뷰(가장 최근에 달린 리뷰 1개), 평균 별점, 리뷰 개수, 고수 지원 서비스 정렬
select t.mento_idx,m_photo, m_name, cate_name, tor_location, p_shot,
		(if(isnull(review_idx),'리뷰 없음',review_cont)) review_cont, 
        (if(isnull(review_idx),0,(select round(avg(sr.review_star),1) from toti.toti_review sr where sr.mento_idx = t.mento_idx))) str,
        (select count(review_cont) from toti.toti_review src where src.mento_idx = t.mento_idx) cont_cnt,
        (select group_concat(service_name SEPARATOR ',') 
		from toti.toti_mentor_service tor join toti.toti_mentor m on m.mento_idx = tor.mento_idx
		join toti_service ser on ser.service_idx = tor.service_idx where t.mento_idx = tor.mento_idx
		group by tor.mento_idx) sname
		from toti.toti_mentor t join toti.toti_mentor_profile p on t.mento_idx = p.mento_idx
		join toti.toti_member b on b.m_idx = t.mento_idx
		join toti.toti_cate c on c.cate_idx = t.cate_idx
		left outer join 
        (
        select r1.review_idx,
		r1.mento_idx as midx, review_cont from toti.toti_review r1
		where r1.review_idx =
			(
			select r2.review_idx from toti.toti_review r2 where
			r1.mento_idx =
			r2.mento_idx order by r2.review_date desc limit 0,1
			)
		) rev
		on rev.midx=t.mento_idx
		order by cont_cnt desc;