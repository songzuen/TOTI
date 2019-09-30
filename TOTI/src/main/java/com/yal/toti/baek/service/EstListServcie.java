package com.yal.toti.baek.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yal.toti.baek.dao.ChatSessionDao;
import com.yal.toti.baek.domain.EstInfo;

@Service("listService")
public class EstListServcie {

	@Autowired
	private SqlSessionTemplate template;

	private ChatSessionDao dao;

	public List<EstInfo> getEstList(int user) {
		dao = template.getMapper(ChatSessionDao.class);

		List<EstInfo> list = dao.selectAllList(user);

		if (list == null) {
			System.out.println("null");
		}

		return list;
	}
}
