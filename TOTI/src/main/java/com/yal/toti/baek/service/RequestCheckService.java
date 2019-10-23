package com.yal.toti.baek.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yal.toti.baek.dao.ChatSessionDao;

@Service("reqService")
public class RequestCheckService {

	@Autowired
	private SqlSessionTemplate template;

	private ChatSessionDao dao;

	public int getReqNum(int room_num) {
		dao = template.getMapper(ChatSessionDao.class);

		int num = dao.selectReqNum(room_num);

		return num;
	}
}
