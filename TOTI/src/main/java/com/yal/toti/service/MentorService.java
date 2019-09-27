package com.yal.toti.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yal.toti.baek.dao.ChatSessionDao;

@Service("mentorService")
public class MentorService {

	@Autowired
	private SqlSessionTemplate template;

	private ChatSessionDao dao;

	public String mentorCheck(int user) {
		dao = template.getMapper(ChatSessionDao.class);

		String check = dao.selectMentorCheck(user);

		return check;
	}
}
