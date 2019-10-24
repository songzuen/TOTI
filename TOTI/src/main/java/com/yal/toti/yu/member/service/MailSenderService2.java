package com.yal.toti.yu.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yal.toti.yu.member.dao.MemberDaoInterface;
import com.yal.toti.yu.member.domain.MemberInfo;

@Service("mailSenderService2")
public class MailSenderService2 {
	
	@Autowired
	private SqlSessionTemplate template;
	private MemberDaoInterface dao;
	
	
	// verify값 변경
	public int changeVer(String id) {
		
		dao = template.getMapper(MemberDaoInterface.class);
		
		int cnt = 0;
		cnt = dao.updateVer(id);
		
		return cnt;		
	}
	
	// verify값 확인
	public int ver(String id) {
		
		dao = template.getMapper(MemberDaoInterface.class);
		
		int cnt = 0;
		MemberInfo memberInfo = null;
		
		memberInfo = dao.selectById(id);
		if(memberInfo != null && memberInfo.getVer()=="Y") {
			
		}
		
		return cnt;
	}
	

}
