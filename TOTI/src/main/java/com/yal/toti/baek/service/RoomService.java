package com.yal.toti.baek.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yal.toti.baek.dao.ChatSessionDao;
import com.yal.toti.baek.domain.ChatRoomInfo;

@Service("roomService")
public class RoomService {

	@Autowired
	private SqlSessionTemplate template;

	private ChatSessionDao dao;

	public String searchChatRoom(int roomnum, int category, int user, int target) {
		dao = template.getMapper(ChatSessionDao.class);

		String room = dao.searchChatRoom(user, target, category);

		if (room == null) {
			room = dao.searchChatRoom(target, user, category);
		}

		if (room == null) {
			dao.insertChatRoom(roomnum, category, user, target);
			room = dao.searchChatRoom(user, target, category);
		}

		return room;
	}

	public String targetName(int target, int user) {
		dao = template.getMapper(ChatSessionDao.class);

		String targetName = dao.searchTargetName(target);

		if (targetName == null) {
			targetName = dao.searchTargetNameByUser(user);
		}

		return targetName;
	}

	public String userName(int user) {
		dao = template.getMapper(ChatSessionDao.class);

		String userName = dao.searchUserName(user);

		return userName;
	}

	public List<ChatRoomInfo> getRoomList(int user) {
		dao = template.getMapper(ChatSessionDao.class);

		List<ChatRoomInfo> list = dao.selectChatRoomListByUser(user);
		if (list == null) {

		}

		return list;
	}
}
