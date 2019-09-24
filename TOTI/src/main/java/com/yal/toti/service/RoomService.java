package com.yal.toti.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yal.toti.baek.dao.ChatSessionDao;

@Service
public class RoomService {

	@Autowired
	private SqlSessionTemplate template;

	private ChatSessionDao dao;

	public String searchChatRoom(String user, String target) {
		dao = template.getMapper(ChatSessionDao.class);

		String room = dao.searchChatRoom(user, target);

		if (room == null) {
			room = dao.searchChatRoom(target, user);
		}

		if (room == null) {
			dao.insertChatRoom(user, target);
			room = dao.searchChatRoom(user, target);
		}

		return room;
	}
}
