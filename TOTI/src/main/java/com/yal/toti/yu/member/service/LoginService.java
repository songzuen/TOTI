package com.yal.toti.yu.member.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.yal.toti.yu.member.dao.MemberDaoInterface;
import com.yal.toti.yu.member.domain.MemberInfo;



@Service("loginService")
public class LoginService {
	
	@Autowired
	private SqlSessionTemplate template;
	private MemberDaoInterface dao;
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	
	
	public int login(String id, String pw, HttpServletRequest request) {
		
		dao = template.getMapper(MemberDaoInterface.class);
		
		int cnt = 0;
		MemberInfo memberInfo = null;
		
		memberInfo = dao.selectById(id);
		System.out.println(cnt);
		// 인증처리된 아이디인지 확인
		char verify = memberInfo.getVerify();
		// 1. 인증 처리됨 -> 암호화된 비밀번호 비교
		if(verify == 'Y' && memberInfo!=null && encoder.matches(pw, memberInfo.getPw())) {
			cnt = 1;
		} else if (verify == 'N') {
			cnt = 2; // 2. 미인증 회원
		} else {
			cnt = 3; // 3. 로그인 실패
		}
		
		return cnt; 
	}
	
	public MemberInfo member(String id){
		dao = template.getMapper(MemberDaoInterface.class);
		
		MemberInfo mi = null;
		mi = dao.selectById(id);
		
		return mi;
		
	}
}
