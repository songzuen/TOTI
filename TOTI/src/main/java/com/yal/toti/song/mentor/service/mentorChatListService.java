package com.yal.toti.song.mentor.service;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yal.toti.song.mentor.dao.EstimateDao;
import com.yal.toti.song.mentor.domain.ChatList;

@Service("mentorChatService")
public class mentorChatListService {

	@Autowired
	private SqlSessionTemplate template;
	
	private EstimateDao dao;

	public List<ChatList> getList(int mento_idx) {
		dao = template.getMapper(EstimateDao.class);
		
		List<ChatList> list = null;
		list = dao.getChatList(mento_idx);
		
		return list;
		
	}
	
	
}
