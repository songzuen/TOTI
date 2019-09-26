package com.yal.toti.han.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yal.toti.han.dao.UserDaoInterface;
import com.yal.toti.han.domain.MentoInfo;
import com.yal.toti.han.domain.MentoProfile;

@Service("mentoProfile")
public class MentoProfileService {

	private UserDaoInterface dao;

	@Autowired
	private SqlSessionTemplate template;

	// 멘토 리스트
	public List<MentoInfo> getMentoList() {
		dao = template.getMapper(UserDaoInterface.class);
		List<MentoInfo> list = dao.selectMentoList();
		return list;
	}

	// 고수 정보 획득
	public List<MentoProfile> getMentoData(int mento_idx) {
		dao = template.getMapper(UserDaoInterface.class);
		List<MentoProfile> mentoProfile = dao.selectMentoProfile(mento_idx);
		return mentoProfile;
	}

	// 이름 수정
	public int NameEdit(MentoProfile mentoProfile) {
		dao = template.getMapper(UserDaoInterface.class);
		int resultCnt = 0;
		resultCnt = dao.updateName(mentoProfile);
		return resultCnt;
	}

	// 한 줄 소개 수정
	public int ShotEdit(MentoProfile mentoProfile) {
		dao = template.getMapper(UserDaoInterface.class);
		int resultCnt = 0;
		resultCnt = dao.updateShot(mentoProfile);
		return resultCnt;
	}
	
	// 제공 서비스 수정
	
	// 위치 수정
	
	// 결제 수단 수정
	
	// 학력 수정
	public int EduEdit(MentoProfile mentoProfile) {
		dao = template.getMapper(UserDaoInterface.class);
		int resultCnt = 0;
		resultCnt = dao.updateEdu(mentoProfile);
		return resultCnt;
	}
	
	// 경력 수정
	public int CareerEdit(MentoProfile mentoProfile) {
		dao = template.getMapper(UserDaoInterface.class);
		int resultCnt = 0;
		resultCnt = dao.updateCareer(mentoProfile);
		return resultCnt;
	}
	
	// 상세 소개 수정
	public int LongEdit(MentoProfile mentoProfile) {
		dao = template.getMapper(UserDaoInterface.class);
		int resultCnt = 0;
		resultCnt = dao.updateLong(mentoProfile);
		return resultCnt;
	}
	
}
