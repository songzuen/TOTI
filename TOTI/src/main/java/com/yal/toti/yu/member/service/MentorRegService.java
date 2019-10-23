package com.yal.toti.yu.member.service;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.yal.toti.yu.member.dao.MemberDaoInterface;
import com.yal.toti.yu.member.domain.MentorInfo;
import com.yal.toti.yu.member.domain.RequestMentorReg;



@Service("mentorRegService")
public class MentorRegService {

	private MemberDaoInterface dao;
	
	@Inject
	private SqlSessionTemplate template;
	
	
	public int mentorInsert(HttpServletRequest request, RequestMentorReg mentorReg) {
	
		dao =template.getMapper(MemberDaoInterface.class);
				
		MentorInfo mentorInfo = mentorReg.toMentorInfo();
		
		int resultCnt = 0;
		
		resultCnt = dao.insertMen(mentorInfo);
		
		return resultCnt;
		
	}
	

	
	
}
