package com.yal.toti.yu.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yal.toti.yu.member.dao.MemberDaoInterface;
import com.yal.toti.yu.member.domain.MemberInfo;

@Service(value = "mypageService")
public class MemberMypageService {
	
	@Autowired
	private SqlSessionTemplate template;

	private MemberDaoInterface dao;
	
	public MemberInfo getInfo (String m_id) {
		
		dao = template.getMapper(MemberDaoInterface.class);
		
		MemberInfo memberInfo = null;
		
		memberInfo = dao.selectMemberById(m_id);
		
		return memberInfo;
	}
	
}
