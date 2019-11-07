package com.yal.toti.kang.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yal.toti.kang.dao.RequestDaoInterface;
import com.yal.toti.kang.domain.CategoriData;
import com.yal.toti.kang.domain.EstimateeList;
import com.yal.toti.kang.domain.ItemListData;
import com.yal.toti.kang.domain.RequestData;
import com.yal.toti.kang.domain.RequestListData;
import com.yal.toti.kang.domain.UserRequestData;
import com.yal.toti.kang.domain.UserRequestList;

@Service("requestService")
public class RequestService {

	private RequestDaoInterface dao;

	@Autowired
	private SqlSessionTemplate template;

	public List<CategoriData> getKategorieList() {

		dao = template.getMapper(RequestDaoInterface.class);

		List<CategoriData> list = dao.categorieList();

		return list;

	}

	public String getKategorIdx(int m_idx) {

		dao = template.getMapper(RequestDaoInterface.class);

		String data = dao.categorieIdx(m_idx);
		
		return data;

	}
	
	public RequestListData getRequestListData(int cate_idx) {

		dao = template.getMapper(RequestDaoInterface.class);

		RequestListData data = new RequestListData();
		CategoriData cd = new CategoriData();
		
		data.setCatedata(dao.cate_data(cate_idx));	
		cd.setCate_idx(cate_idx);
		data.setService(dao.serviceData(cate_idx));
		data.setQuest(dao.questData(cate_idx));
		
		return data;

	}
	
	public List<ItemListData> getItemList(int quest_idx) {

		dao = template.getMapper(RequestDaoInterface.class);

		List<ItemListData> list = dao.itemListData(quest_idx);

		return list;

	}
	
	
	@Transactional(rollbackFor=Exception.class)
	public int insertRequest(RequestData data) throws Exception {
		
		dao = template.getMapper(RequestDaoInterface.class);

		try {
			
			//요청서
			dao.insertRequest(data);
			
			//서비스
			dao.insertService(data);
			
			Map<String, Object> an = new HashMap<String, Object>();
			
			an.put("request_idx", data.getRequest_idx());
			an.put("answerDatas", data.getAnswerDatas());
			
			//답변
			dao.insertAnswer(an);
			
	        return 200;
	        
	    } catch(Exception e) {
	    	
	        e.printStackTrace();
	        
	        throw new Exception();
	    }

	}
	

	public List<UserRequestList> getUserRequests(int m_idx) {

		dao = template.getMapper(RequestDaoInterface.class);

		List<UserRequestList> list = dao.userRequestList(m_idx);
		
		for(UserRequestList data : list ) {
			data.setRequest_cnt(dao.requestCnt(data.getRequest_idx()));
		}
		
		return list;

	}
	
	public List<Integer> getUserDelRequests(int m_idx) {

		dao = template.getMapper(RequestDaoInterface.class);

		List<Integer> list = dao.userDelRequestNum(m_idx);
		
		return list;

	}
	
	//매일 23시 59분 59초에 실행
	@Scheduled(cron="59 59 23 * * *")
	public void userRequestDel() {
		
		dao = template.getMapper(RequestDaoInterface.class);
		
		dao.userRequestDel();
		
		System.out.println("5일지난 유저의 요청서 삭제 스케줄러 실행완료.");
		
	}
	
	public UserRequestData getUserRequestData(int request_idx, int m_idx) {

		dao = template.getMapper(RequestDaoInterface.class);
		
		UserRequestData data = new UserRequestData();
		
		data.setRequest_idx(request_idx);
		
		data.setUserInfo(dao.requestUserInfo(request_idx, m_idx));
		
		data.setAnswer(dao.requestAnswer(request_idx));
		
		data.setCate_name(dao.requestCate(request_idx));

		data.setService_name(dao.requestService(request_idx));
		
		data.setRequest_date(dao.requestDate(request_idx));
		
		return data;

	}
	
	
	public EstimateeList getEstimateeList(int request_idx) {

		dao = template.getMapper(RequestDaoInterface.class);

		EstimateeList data = new EstimateeList();
		
		data.setCate_name(dao.requestCate(request_idx));
		data.setService_name(dao.requestService(request_idx));
		data.setRequest_date(dao.requestDate(request_idx));
		data.setEstiData(dao.estimateeList(request_idx));
		
		return data;

	}
	
	public int requestDelete(int request_idx) {
		
		dao = template.getMapper(RequestDaoInterface.class);
		
		int cnt = dao.requestDelete(request_idx);
		
		return cnt;
		
	}
	
}
