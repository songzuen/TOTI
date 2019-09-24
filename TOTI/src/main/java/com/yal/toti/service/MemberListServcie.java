package com.yal.toti.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yal.toti.baek.dao.ChatSessionDao;
import com.yal.toti.baek.domain.MemberInfo;

@Service("listService")
public class MemberListServcie {

	@Autowired
	private SqlSessionTemplate template;

	private ChatSessionDao dao;

	public List<MemberInfo> getMemberList(String user) {
		dao = template.getMapper(ChatSessionDao.class);

		List<MemberInfo> list = dao.selectAllList(user);

		return list;
	}
}
