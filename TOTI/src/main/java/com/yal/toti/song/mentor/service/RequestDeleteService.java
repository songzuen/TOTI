package com.yal.toti.song.mentor.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yal.toti.song.mentor.dao.RequestListDao;

@Service("requestDeleteService")
public class RequestDeleteService {

	@Autowired
	private SqlSessionTemplate template;
	
	private RequestListDao dao;
	
	public int deleteRequest(int request_idx) {
		dao = template.getMapper(RequestListDao.class);
		
		int rCnt = 0;
		rCnt = dao.deleteRequest(request_idx);
		
		return rCnt;
	}

}
