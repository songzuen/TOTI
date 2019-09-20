package com.yal.toti.yu.member.service;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yal.toti.yu.member.dao.MemberDaoInterface;
import com.yal.toti.yu.member.domain.MemberInfo;
import com.yal.toti.yu.member.domain.RequestMemberEdit;
import com.yal.toti.yu.member.domain.RequestMemberPwEdit;

@Service(value = "editService")
public class MemberEditService {

	// @Autowired
	// private MemberJdbcTemplateDao dao;

	// 자동 메퍼를 이용해서 생성할 dao
	private MemberDaoInterface dao;

	// 자동 메퍼를 위한 sqlSessionTemplate 객체 주입
	// @Inject : 타입에 맞는 주입 ( java 에서 지원 : 특정 프레임워크에 의존하지 않음 )
	@Autowired
	private SqlSessionTemplate template;

	/*
	 * public MemberInfo getEditFormData(int m_idx) { // SqlSessionTemplate getMapper 를
	 * 이용해 dao 생성 dao = template.getMapper(MemberDaoInterface.class); MemberInfo
	 * memberInfo = dao.selectMemberByIdx(m_idx);
	 * 
	 * return memberInfo; }
	 */

	public int MemberEdit(RequestMemberEdit edit, HttpServletRequest request) {
		// SqlSessionTemplate getMapper 를 이용해 dao 생성
		dao = template.getMapper(MemberDaoInterface.class);
		int cnt = 0;

		String path = "/uploadfile/userphoto";
		String dir = request.getSession().getServletContext().getRealPath(path);

		MemberInfo memberInfo = edit.toMemberInfo();

		/*
		 * // 신규 파일 체크 if (edit.getM_photo() != null && !edit.getM_photo().isEmpty() &&
		 * edit.getM_photo().getSize() > 0) {
		 * 
		 * String newFileName = edit.getM_id() + "_" +
		 * edit.getM_photo().getOriginalFilename();
		 */

		try {
			if (edit.getEditPhoto() != null) {
				String newFileName = edit.getEditIdx() + "_" + edit.getEditPhoto().getOriginalFilename();
				// 이전 파일 삭제
				new File(dir, newFileName).delete();

				// 데이터 베이스 저장을 위한 새로운 파일 이름
				memberInfo.setM_photo(newFileName);
				// 신규파일 저장
				edit.getEditPhoto().transferTo(new File(dir, newFileName));
			}

			cnt = dao.editMember(memberInfo);

		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("사진 업로드가 오류임");
		}
		// int rCnt = dao.memberUpdate(memberInfo);
		return cnt;

		/*
		 * } else { // 신규파일이 없으면 이전 파일 이름을 그대로 업데이트 memberInfo.setM_photo(oldFileName);
		 * } return rCnt;
		 */

	}

	// 비밀번호 변경찾기
	public int memberPwEdit(RequestMemberPwEdit pwEdit) {

		dao = template.getMapper(MemberDaoInterface.class);
		int cnt = dao.editMemberPw(pwEdit);
		return cnt;
	}

}
