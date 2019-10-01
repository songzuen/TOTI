package com.yal.toti.yu.member.dao;

import com.yal.toti.yu.member.domain.MemberInfo;
import com.yal.toti.yu.member.domain.MentorInfo;

public interface MemberDaoInterface {
	public int insertMem(MemberInfo memberInfo); // 회원가입
	public MemberInfo selectById(String id); // 로그인, 중복 아이디 체크
	public int updateVerify(String id); // verify값 변경
	public int updateMem(MemberInfo memberInfo); // 내 정보 수정
	public int deleteMem(String id); // 회원탈퇴
	public int insertMentor(MentorInfo mentorInfo); //멘토등록
	public int verUpdate (MemberInfo memberInfo);//멘토여부변경
}
