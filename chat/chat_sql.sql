select est.est_idx, est.mento_idx, request.m_idx, request.cate_idx from toti.toti_estimatee as est join toti.toti_request as request on est.request_idx = request.request_idx;

select est.est_idx, req.cate_idx, est.mento_idx, req.m_idx, est.est_price, est.est_cont from toti.toti_estimatee as est join toti.toti_request as req on est.request_idx = req.request_idx where mento_idx = 3;

select * from toti.toti_request;

select * from toti.toti_chatroom;

select * from toti.toti_member;

select est.est_idx, req.cate_idx, est.mento_idx, req.m_idx, est.est_price, est.est_cont from toti.toti_estimatee as est join toti.toti_request as req on est.request_idx = req.request_idx where mento_idx = 3;