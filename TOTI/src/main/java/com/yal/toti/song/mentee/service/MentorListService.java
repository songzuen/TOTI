package com.yal.toti.song.mentee.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yal.toti.song.mentee.dao.MentorListDao;
import com.yal.toti.song.mentee.domain.MentorMemberInfo;
import com.yal.toti.song.mentee.domain.SearchParam;

@Service("mentorListService")
public class MentorListService {

	@Autowired
	private SqlSessionTemplate template;
	
	private MentorListDao dao;

	public List<MentorMemberInfo> getAllList() {
		dao = template.getMapper(MentorListDao.class);
		
		List<MentorMemberInfo> list = dao.selectAllList();
		
		return list;
	}

	public List<MentorMemberInfo> getListData(SearchParam search) {
		dao = template.getMapper(MentorListDao.class);
		
		int totalCnt = dao.selectTotalCount(search);
		
		List<MentorMemberInfo> mmi = null;
		
		Map<String, Object> params =new HashMap<String, Object>();
		params.put("search", search);
		
		mmi = dao.selectMentorList(params);
		return mmi;
	}

	public List<MentorMemberInfo> getListByRCnt() {
		
		dao = template.getMapper(MentorListDao.class);
		
		List<MentorMemberInfo> list = dao.selectListByRCnt();
		
		return list;
	}
}
