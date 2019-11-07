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


@Service("regService")
public class RegService {

	@Autowired
	private SqlSessionTemplate template;
	private MemberDaoInterface dao;

	@Autowired
	private BCryptPasswordEncoder encoder;

	public MemberInfo checkId(String id) {

		dao = template.getMapper(MemberDaoInterface.class);

		MemberInfo memberInfo = dao.selectById(id);

		return memberInfo;
	}

	public int memInsert(HttpServletRequest request, MemberInfo memberInfo) {

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

		// 비밀번호 암호화
		memberInfo.setPw(encoder.encode(memberInfo.getPw()));
		

		// DB저장
		rCnt = dao.insertMem(memberInfo);

		return rCnt;
	}
}
