package com.yal.toti.han.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yal.toti.han.dao.AdminDaoInterface;
import com.yal.toti.han.domain.CategoryInfo;
import com.yal.toti.han.domain.ServiceInfo;

@Service("adminService")
public class ServiceAdminService {

	private AdminDaoInterface dao;

	@Autowired
	private SqlSessionTemplate template;
	
	public List<CategoryInfo> getCategoryList() {

		dao = template.getMapper(AdminDaoInterface.class);

		List<CategoryInfo> list = dao.categoryList();

		return list;

	}

	public List<ServiceInfo> getServicebyCate(int cate_idx) {

		dao = template.getMapper(AdminDaoInterface.class);

		List<ServiceInfo> list = dao.selectServiceByCate(cate_idx);

		return list;

	}

	public int ServiceInsert(ServiceInfo insertService) {

		dao = template.getMapper(AdminDaoInterface.class);

		int resultCnt = 0;

		resultCnt = dao.insertService(insertService);

		return resultCnt;
	}

	public int Servicedelete(int service_idx) {

		dao = template.getMapper(AdminDaoInterface.class);

		return dao.deleteService(service_idx);
	}
}
