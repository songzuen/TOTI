package com.yal.toti.han.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yal.toti.han.dao.HyewonDaoInterface;
import com.yal.toti.han.domain.ServiceInfo;

@Service("adminlistService")
public class AdminListService {

	private HyewonDaoInterface dao;

	@Autowired
	private SqlSessionTemplate template;

	public List<ServiceInfo> getServiceList(int cate_idx) {

		dao = template.getMapper(HyewonDaoInterface.class);

		List<ServiceInfo> list = dao.selectServiceByCate(cate_idx);

		return list;

	}

	public List<ServiceInfo> getAllList() {

		dao = template.getMapper(HyewonDaoInterface.class);

		List<ServiceInfo> list = dao.selectAllList();

		return list;

	}
}
