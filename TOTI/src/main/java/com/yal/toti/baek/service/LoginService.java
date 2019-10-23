package com.yal.toti.baek.service;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yal.toti.baek.dao.ChatSessionDao;
import com.yal.toti.baek.domain.MemberInfo;

@Service("loginSerivce")
public class LoginService {

	@Autowired
	private SqlSessionTemplate template;

	private ChatSessionDao dao;

	public int login(String id, HttpServletRequest request) {

		dao = template.getMapper(ChatSessionDao.class);

		int loginChk = 0;

		MemberInfo memberInfo = null;

		memberInfo = dao.selectMemberById(id);

		if (memberInfo != null) {
			request.getSession(true).setAttribute("loginInfo", memberInfo);
			loginChk = 1;
		} else {
			loginChk = 2;
		}
		return loginChk;
	}
}
