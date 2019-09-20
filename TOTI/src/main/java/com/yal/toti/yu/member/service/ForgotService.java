package com.yal.toti.yu.member.service;

import java.util.Random;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yal.toti.yu.member.dao.MemberDaoInterface;
import com.yal.toti.yu.member.domain.MemberInfo;


@Service("forgotService")
public class ForgotService {

	@Autowired
	private MailSenderService service;

	@Autowired
	private SqlSessionTemplate template;

	private MemberDaoInterface dao;

	public int forgotId(String m_name, String m_email) {

		dao = template.getMapper(MemberDaoInterface.class);

		MemberInfo info = dao.searchId(m_name, m_email);

		if (info != null) {
			service.sendId(info.getM_id(), info.getM_email(), info.getM_name());
			return 1;
		}
		return 0;
	}

	public int forgotPw(String m_id, String m_name, String m_email) {

		dao = template.getMapper(MemberDaoInterface.class);

		MemberInfo info = dao.searchPw(m_id, m_name, m_email);
		int cnt = 0;

		if (info != null) {

			Random r = new Random(System.nanoTime());
			StringBuffer sb = new StringBuffer();

			for (int i = 0; i < 14; i++) {
				// r.nextBoolean() == true : 숫자,
				// r.nextBoolean() == false : 영문자
				if (r.nextBoolean()) {
					sb.append(r.nextInt(10));
				} else {
					sb.append((char) (r.nextInt(26) + 97));
				}
			}
			cnt = dao.changeRandomPw(sb.toString(), info.getM_id());

			service.sendPw(info.getM_id(), info.getM_email(), info.getM_name(), sb.toString());
			return cnt;
		}
		return cnt;
	}

}
