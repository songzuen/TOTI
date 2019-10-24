package com.yal.toti.yu.member.service;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.yal.toti.yu.member.dao.MemberDaoInterface;
import com.yal.toti.yu.member.domain.MemberInfo;

@Service("mypageService")
public class MypageService {

	@Autowired
	private SqlSessionTemplate template;
	private MemberDaoInterface dao;

	@Autowired
	private BCryptPasswordEncoder encoder;

	// 내 정보 불러오기
	public MemberInfo myInfo(String id) {

		dao = template.getMapper(MemberDaoInterface.class);

		MemberInfo memberInfo = dao.selectById(id);

		return memberInfo;
	}

	// 사진 업로드
	public int editProcess(HttpServletRequest request, MemberInfo memberInfo) {

		dao = template.getMapper(MemberDaoInterface.class);

		// 사진 저장 경로
		String path = "/uploadfile";
		String dir = request.getSession().getServletContext().getRealPath(path);

		int rCnt = 0;
		String newFileName = "";

		if (memberInfo.getPhoto() != null) {
			newFileName = memberInfo.getId() + "_" + memberInfo.getPhoto().getOriginalFilename();

			try {

				memberInfo.getPhoto().transferTo(new File(dir, newFileName));
				memberInfo.setPhoto_name(newFileName);

			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		// DB저장
		rCnt = dao.updateMem(memberInfo);

		return rCnt;
	}

	public int editProcess(MemberInfo memberInfo) {

		dao = template.getMapper(MemberDaoInterface.class);

		int cnt = 0;

		System.out.println("editProcess"+memberInfo);

		// 비밀번호 암호화
		memberInfo.setPw(encoder.encode(memberInfo.getPw()));
		
		
		// DB저장
		cnt = dao.updateMem(memberInfo);
		
		System.out.println("editProcess"+cnt);
		return cnt;
	}
	
	// 회원 탈퇴
	public int deleteMem(String id) {
		
		dao = template.getMapper(MemberDaoInterface.class);
		
		int cnt = 0;
		
		cnt = dao.deleteMem(id);
		System.out.println("deleteMemService"+cnt);
		
		return cnt;
	}
}
