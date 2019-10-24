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

	public int insertChatRoom(int roomnum, int category, int user, int target) {
		dao = template.getMapper(ChatSessionDao.class);

		int cnt = 0;

		cnt = dao.insertChatRoom(roomnum, category, user, target);

		/*
		 * Date d = new Date(); SimpleDateFormat format = new
		 * SimpleDateFormat("yyyy년 MM월 dd일 E요일 HH:mm"); String date = format.format(d);
		 */

		/*
		 * cnt += dao.insertEstPriceToChatRoom(roomnum, user, date); cnt +=
		 * dao.insertEstContToChatRoom(roomnum, user, date);
		 */
		
		dao.updateLastMsgAtChatRoom(roomnum);

		return cnt;

	}

	public String searchChatRoom(int roomnum) {
		dao = template.getMapper(ChatSessionDao.class);

		String room = dao.searchChatRoom(roomnum);

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
