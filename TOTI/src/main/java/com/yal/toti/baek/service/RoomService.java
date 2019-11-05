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
		if (cnt != 0) {
			cnt += insertChatlog(roomnum);
		}
		return cnt;

	}

	public int insertChatlog(int roomnum) {
		dao = template.getMapper(ChatSessionDao.class);

		int cnt = dao.insertChatlog(
				"멘토로 부터 견적서가 도착했습니다.<br>견적서 내용을 확인해주세요.<br><hr><a onclick=" + "modalDisplay()" + ">견적서 내용</a>", "",
				roomnum, 0);

		return cnt;
	}

	public String searchChatRoom(int roomnum) {
		dao = template.getMapper(ChatSessionDao.class);

		String room = dao.searchChatRoom(roomnum);

		return room;
	}

	public String targetName(int target, int user, int est_idx) {
		dao = template.getMapper(ChatSessionDao.class);

		String targetName = dao.searchTargetName(target, est_idx);

		if (targetName == null || targetName == "") {
			targetName = dao.searchTargetNameByUser(target, est_idx);
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
		System.out.println(list);
		return list;
	}
}
