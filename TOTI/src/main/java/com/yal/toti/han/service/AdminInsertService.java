package com.yal.toti.han.service;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yal.toti.han.dao.HyewonDaoInterface;
import com.yal.toti.han.domain.InsertService;
import com.yal.toti.han.domain.ServiceInfo;

@Service("admininsertService")
public class AdminInsertService {

	private HyewonDaoInterface dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	public int ServiceInsert(HttpServletRequest request, InsertService insertService) {

		dao = template.getMapper(HyewonDaoInterface.class);
		
		ServiceInfo serviceInfo = insertService.toServiceInfo();
		
		System.out.println(serviceInfo);
		
		int resultCnt = 0;
		
		resultCnt = dao.insertService(serviceInfo);
		
		return resultCnt;
	}
	
}
