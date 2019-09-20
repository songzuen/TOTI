package com.yal.toti.yu.member.dao;

import java.util.List;
import java.util.Map;

import com.yal.toti.yu.member.domain.MemberInfo;
import com.yal.toti.yu.member.domain.RequestMemberPwEdit;
import com.yal.toti.yu.member.domain.SearchParam;

public interface MemberDaoInterface {
	
	// 아이디 중복 체크
	//public MemberInfo selectMemberById2(String m_id);
	// 회원 정보 수정을 위한 정보 획득
	//public MemberInfo selectMemberByIdx(int m_idx);
	
	
	// 회원 로그인처리시
	public MemberInfo selectMemberById(String m_id);
	// 이메일 중복
	public MemberInfo selectMemberByEmail(String m_email);
	// 회원가입
	public int insertMember(MemberInfo memberInfo);
	// 회원 정보 수정
	public int editMember(MemberInfo memberInfo);
	// 회원 비밀번호 변경수정
	public int editMemberPw(RequestMemberPwEdit pwEdit);
	// 회원 정보 삭제
	public int deleteMember(int m_idx);
	
	// 이전 dao에서는 검색 처리를 위한 여러개의 메서드가 필요.	
	// 게시물의 개수 : 동적 쿼리로 검색의 결과 까지 처리
	public int selectTotalCount(SearchParam searchParam);
	// 게시물의 LIST :  동적 쿼리로 검색의 결과 까지 처리
	//public List<MemberInfo> selectList(int index, int count);
	public List<MemberInfo> selectList(Map<String, Object> params);
	
	//전체리스트를 불러오는
	//회원의 전체 리스트 
	public List<MemberInfo> selectAllList();
	
	// 20190821
	// 회원 이메일 인증 처리
	public int m_codeVer(String m_id, String m_code);
	
	public MemberInfo searchId(String m_name, String m_email);
	
	public MemberInfo searchPw(String m_id, String m_name, String m_email);
	
	public  int changeRandomPw(String m_pw, String m_id);
}
