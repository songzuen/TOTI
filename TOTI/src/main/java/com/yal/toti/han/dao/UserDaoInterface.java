package com.yal.toti.han.dao;

import java.util.List;

import com.yal.toti.han.domain.MentoInfo;
import com.yal.toti.han.domain.MentoProfile;
import com.yal.toti.han.domain.ReviewInfo;
import com.yal.toti.han.domain.ServiceEdit;

public interface UserDaoInterface {
	
	// 멘토 리스트
	public List<MentoInfo> selectMentoList();
	
	
	// 고수 프로필 설정 페이지
	public List<MentoProfile> selectMentoProfile(int mento_idx);
	// 고수 이름 변경
	public int updateName(MentoProfile mentoProfile);
	// 한 줄 소개 변경
	public int updateShot(MentoProfile mentoProfile);
	
	// 고수 분야의 서비스 보기
	public List<ServiceEdit> getService(int mento_idx);
	// 고수가 선택한 서비스
	public List<ServiceEdit> getService2(int mento_idx);
	// 고수의 서비스 등록
	public int updateService(int mento_idx, int service_idx);
	// 등록된 서비스 삭제
	public int deleteService(int mento_idx, int service_idx);
	
	// 위치 변경
	public int updateLocation(MentoProfile mentoProfile);
	// 결제 수단 변경
	public int updatePay(MentoProfile mentoProfile);
	// 학력 변경
	public int updateEdu(MentoProfile mentoProfile);
	// 경력 변경
	public int updateCareer(MentoProfile mentoProfile);
	// 상세 소개
	public int updateLong(MentoProfile mentoProfile);
	
	// 리뷰 작성
	public int insertReview(ReviewInfo reviewInfo);
	// 리뷰 삭제
	public int deleteReview(int review_idx);
}
