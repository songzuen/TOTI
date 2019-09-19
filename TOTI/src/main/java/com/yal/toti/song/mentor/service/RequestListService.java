package com.yal.toti.song.mentor.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yal.toti.song.mentor.dao.RequestListDao;
import com.yal.toti.song.mentor.domain.RequestList;

@Service("requestListService")
public class RequestListService {
	
	@Autowired
	private SqlSessionTemplate template;
	
	private RequestListDao dao;

	//public List<RequestList> getAllList(int mento_idx) {
	public List<RequestList> getAllList() {
		
		dao = template.getMapper(RequestListDao.class);
		
		//List<RequestList> list = dao.selectAllRequest(mento_idx);
		List<RequestList> list = dao.selectAllRequest();
		
		return list;
	}

}
