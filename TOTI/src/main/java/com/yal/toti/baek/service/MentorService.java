package com.yal.toti.baek.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yal.toti.baek.dao.ChatSessionDao;
import com.yal.toti.baek.domain.MentorProfile;
import com.yal.toti.baek.domain.MentorReview;

@Service("mentorService")
public class MentorService {

	@Autowired
	private SqlSessionTemplate template;

	private ChatSessionDao dao;

	public String mentorCheck(int user, int roomnum) {
		dao = template.getMapper(ChatSessionDao.class);

		int room_user = dao.selectMentorCheck(roomnum);

		return room_user == user ? "Y" : "N";
	}

	public MentorProfile getMentorProfile(int user) {
		dao = template.getMapper(ChatSessionDao.class);

		MentorProfile profile = dao.selectMentorProfile(user);

		/*
		 * if (profile == null) { System.out.println("null"); }
		 */

		return profile;
	}

	public List<MentorReview> getReview(int user) {
		dao = template.getMapper(ChatSessionDao.class);

		List<MentorReview> reviews = dao.selectMentorReview(user);

		/*
		 * if (reviews != null) { System.out.println(reviews); }
		 */

		return reviews;
	}
}
