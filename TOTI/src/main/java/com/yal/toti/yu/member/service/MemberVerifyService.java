package com.yal.toti.yu.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yal.toti.yu.member.dao.MemberDaoInterface;
import com.yal.toti.yu.member.domain.MemberInfo;

@Service("verifyService")
public class MemberVerifyService {
	
	@Autowired
	private MailSenderService service;

	@Autowired
	private SqlSessionTemplate template;
	
	private MemberDaoInterface dao;
	
	public String m_codeVer(String m_id, String m_code) {
		
		dao = template.getMapper(MemberDaoInterface.class);
		
		int cnt = dao.m_codeVer(m_id, m_code);
		
		return cnt>0?"SUCCESS":"FAIL";
	}

	public int reMailSend(String m_id) {
				
		dao = template.getMapper(MemberDaoInterface.class);
		
		System.out.println("id(email) : " + m_id);
		
		MemberInfo memberInfo = dao.selectMemberById(m_id);
		System.out.println("check : " + memberInfo);
		
		if(memberInfo != null) {
		
			service.send(memberInfo.getM_id(), memberInfo.getM_email(), memberInfo.getM_name(), memberInfo.getM_code());
			return 1;

		}
		return 0;
	}
	

}