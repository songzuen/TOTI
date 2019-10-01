package com.yal.toti.han.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yal.toti.han.dao.UserDaoInterface;
import com.yal.toti.han.domain.ReviewInfo;

@Service("review")
public class ReviewService {
	
	private UserDaoInterface dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	// 리뷰 등록
		public int ReviewInsert(ReviewInfo reviewInfo) {

			dao = template.getMapper(UserDaoInterface.class);

			int resultCnt = 0;

			resultCnt = dao.insertReview(reviewInfo);

			return resultCnt;
		}

}
