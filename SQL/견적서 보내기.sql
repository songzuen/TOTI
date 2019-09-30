-- 3번 견적서에 멘토번호 3번이면 중복 전송 막기
insert into toti.toti_estimatee (mento_idx, request_idx, est_price, est_cont, est_file) 
select '3','3','20000','zzz',null from dual
where not exists (select * from toti.toti_estimatee where request_idx = '3' and mento_idx = '3');
