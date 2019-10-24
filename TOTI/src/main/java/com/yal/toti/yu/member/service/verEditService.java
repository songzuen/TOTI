package com.yal.toti.yu.member.service;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.yal.toti.yu.member.dao.MemberDaoInterface;
import com.yal.toti.yu.member.domain.MemberInfo;
import com.yal.toti.yu.member.domain.RequestVerEditMemberInfo;



@Service("verEditService")
public class verEditService  {

	private MemberDaoInterface dao;
	
	@Inject
	private SqlSessionTemplate template;
	
	
	public MemberInfo getEditVerData(String id) {
		
		dao = template.getMapper(MemberDaoInterface.class);
		
		 MemberInfo memberInfo = dao.selectById(id);
		
		return memberInfo;
	}
	
	public int verEdit(RequestVerEditMemberInfo edit, HttpServletRequest request) {
		
		dao = template.getMapper(MemberDaoInterface.class);
		
		int rCnt = 0;
		MemberInfo memberInfo = edit.toMemberInfo();
		

		rCnt = dao.goMentee(memberInfo);
		
		System.out.println("ver가 cnt ==== "+rCnt);
		
		return rCnt;
	}
	
}
