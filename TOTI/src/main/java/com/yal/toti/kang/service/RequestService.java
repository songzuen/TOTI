package com.yal.toti.kang.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.yal.toti.kang.dao.RequestDaoInterface;
import com.yal.toti.kang.domain.CategoriData;
import com.yal.toti.kang.domain.ItemListData;
import com.yal.toti.kang.domain.RequestData;
import com.yal.toti.kang.domain.RequestListData;
import com.yal.toti.kang.domain.UserRequestData;

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

	public RequestListData getRequestListData(int cate_idx) {

		dao = template.getMapper(RequestDaoInterface.class);

		RequestListData data = new RequestListData();

		data.setCate_idx(cate_idx);
		data.setCate_name(dao.cate_naem(cate_idx));

		data.setService(dao.serviceData(cate_idx));
		data.setQuest(dao.questData(cate_idx));
		
		return data;

	}
	
	public List<ItemListData> getItemList(int quest_idx) {

		dao = template.getMapper(RequestDaoInterface.class);

		List<ItemListData> list = dao.itemListData(quest_idx);

		return list;

	}
	
	@Transactional
	public int insertRequest(RequestData data) {
		
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
	        TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
	        
	        return 500;
	    }

	}
	
	public UserRequestData getUserRequestData(int request_idx) {

		dao = template.getMapper(RequestDaoInterface.class);

		UserRequestData data = dao.getUserRequestData(request_idx);

		return data;

	}
	

}
