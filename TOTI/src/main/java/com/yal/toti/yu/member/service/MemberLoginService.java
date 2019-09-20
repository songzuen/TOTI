package com.yal.toti.yu.member.service;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yal.toti.yu.member.dao.MemberDaoInterface;
import com.yal.toti.yu.member.domain.MemberInfo;
/*
수정 내용  : 인증 상태를 3개 상태로 구분	해서 return, return type 변경
		   boolean -> int
	 	  	0 - 로그인 실패
			1 - 미인증 계정 로그인	
			2 - 정상 로그인
*/
@Service(value = "loginService")
public class MemberLoginService { // MemberService는 그저 마킹효과 나중에 관리~

	//@Autowired
	//private MemberJdbcTemplateDao dao;
	
	// 자동 메퍼를 이용해서 생성할 dao 
	private MemberDaoInterface dao;
	
	// 자동 메퍼를 위한 sqlSessionTemplate 객체 주입
	// @Inject : 타입에 맞는 주입 ( java 에서 지원 : 특정 프레임워크에 의존하지 않음 )
	@Autowired
	private SqlSessionTemplate template;
	
	//  메일인증 들어간 코드
	public int login(String m_id, String m_pw, HttpServletRequest request) {
		
		// SqlSessionTemplate getMapper 를 이용해 dao 생성
		dao = template.getMapper(MemberDaoInterface.class);
		
		MemberInfo memberInfo = null;
		
		memberInfo = dao.selectMemberById(m_id);
				
		// 변수 타입 변경 boolean -> int  
		// 0 : 로그인 실패
		// 1 : 미인증 로그인
		// 2 : 로그인 정상 처리
		int cnt = 0;	
		if (memberInfo != null && memberInfo.pwChk(m_pw)) {
			request.getSession(true).setAttribute("loginId", memberInfo.getM_id());
			if (memberInfo.getM_codeVer() == 'N') {
				cnt =2 ;
				
			}else {
				cnt = 1;
			}
		}

		return cnt;
	}
	
	public int chkMember(String m_id, String m_pw) {

		dao = template.getMapper(MemberDaoInterface.class);

		MemberInfo memberInfo = null;

		memberInfo = dao.selectMemberById(m_id);

		int cnt = 0;
		if (memberInfo != null && memberInfo.pwChk(m_pw)) {

			cnt = 1;
			return cnt;
		}
		return cnt;
	}

}
