package com.yal.toti.kang.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yal.toti.kang.dao.RequestDaoInterface;
import com.yal.toti.kang.domain.KategoriData;
import com.yal.toti.kang.domain.RequestData;

@Service("requestService")
public class RequestService {

	private RequestDaoInterface dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	public List<KategoriData> getKategorieList() {
		
		dao = template.getMapper(RequestDaoInterface.class);

		List<KategoriData> list = dao.kategorieList();

		return list;
		
	}
	
	public RequestData getRequestData() {
		
		dao = template.getMapper(RequestDaoInterface.class);
		
		RequestData data = dao.requestData();
		
		return data;
		
	}
	
}
