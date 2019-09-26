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
	// 고수 이름 변경
	public int updateName(MentoProfile mentoProfile);
	// 한 줄 소개 변경
	public int updateShot(MentoProfile mentoProfile);
	// 제공 서비스 변경
	// 위치 변경
	// 결제 수단 변경
	// 학력
	public int updateEdu(MentoProfile mentoProfile);
	// 경력
	public int updateCareer(MentoProfile mentoProfile);
	// 상세 소개
	public int updateLong(MentoProfile mentoProfile);
	
	// 리뷰 작성
	public int insertReview(ReviewInfo reviewInfo);
}
