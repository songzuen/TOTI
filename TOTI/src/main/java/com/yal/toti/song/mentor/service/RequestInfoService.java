package com.yal.toti.song.mentor.service;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yal.toti.song.mentor.dao.RequestListDao;
import com.yal.toti.song.mentor.domain.RequestList;

@Service("requestInfoService")
public class RequestInfoService {

	@Autowired
	private SqlSessionTemplate template;
	
	private RequestListDao dao;
	
	
	public List<RequestList> getRequestInfo(int request_idx) {
		
		dao = template.getMapper(RequestListDao.class);
		
		List<RequestList> list = null;
		
		list = dao.getRequestInfo(request_idx);
		
		return list;
	}

}
