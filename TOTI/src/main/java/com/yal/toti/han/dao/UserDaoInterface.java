package com.yal.toti.han.dao;

import java.util.List;

import com.yal.toti.han.domain.MentoInfo;
import com.yal.toti.han.domain.MentoProfile;
import com.yal.toti.han.domain.ReviewInfo;

public interface UserDaoInterface {
	
	// 멘토 리스트
	public List<MentoInfo> selectMentoList();
	
	// 고수 프로필 설정 페이지
	public List<MentoProfile> selectMentoProfile(int mento_idx);
	// 리뷰
	public int insertReview(ReviewInfo reviewInfo);
}
