package com.yal.toti.kang.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.yal.toti.kang.dao.RequestDaoInterface;
import com.yal.toti.kang.domain.AnswerData;
import com.yal.toti.kang.domain.CategoriData;
import com.yal.toti.kang.domain.ItemListData;
import com.yal.toti.kang.domain.RequestData;
import com.yal.toti.kang.domain.RequestListData;

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
			int cnt = dao.insertRequest(data.getM_idx(), data.getCate_idx());
			
			System.out.println("요청서 번호 : "+data.getRequest_idx());
			
			System.out.println("ddd : "+ cnt );
			
			//dao.insertService(data.getRequest_idx(), data.getM_idx(), data.getService_idx());
			
			/*for(AnswerData answer : data.getAnswerDatas()) {
				dao.insertAnswer(data.getRequest_idx(), answer.getQurest_idx(), answer.getAnswer_cont());
			}*/
			
	        return 200;
	        
	    } catch(Exception e) {
	    	
	        e.printStackTrace();
	        TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
	        
	        return 500;
	    }

	}

}
