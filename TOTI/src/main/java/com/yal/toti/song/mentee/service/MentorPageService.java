package com.yal.toti.song.mentee.service;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yal.toti.song.mentee.dao.MentorListDao;
import com.yal.toti.song.mentee.domain.MentorMemberInfo;
import com.yal.toti.song.mentee.domain.MentorServiceList;

@Service("mentorPageService")
public class MentorPageService {
	
	@Autowired
	private SqlSessionTemplate template;
	
	private MentorListDao dao;

	public List<MentorMemberInfo> getPage(int mento_idx) {
		
		dao = template.getMapper(MentorListDao.class);
		List<MentorMemberInfo> list = dao.getMentorPage(mento_idx);
		return list;
	}
}
