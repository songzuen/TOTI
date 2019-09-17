package com.yal.toti.han.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yal.toti.han.dao.HyewonDaoInterface;

@Service("admindeleteService")
public class AdminDeleteService {

	private HyewonDaoInterface dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	public int servicedelete(int id) {
		
		dao = template.getMapper(HyewonDaoInterface.class);
		
		return dao.deleteService(id);
	}
}
