package com.yal.toti.han.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yal.toti.han.dao.UserDaoInterface;
import com.yal.toti.han.domain.MentoInfo;
import com.yal.toti.han.domain.MentoProfile;
import com.yal.toti.han.domain.ServiceEdit;

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

	// 고수가 추가할 수 있는 서비스
	public List<ServiceEdit> getService(int mento_idx) {
		dao = template.getMapper(UserDaoInterface.class);
		List<ServiceEdit> serviceEdit = dao.getService(mento_idx);
		return serviceEdit;
	}

	// 삭제를 위한 저장된 서비스
	public List<ServiceEdit> getService2(int mento_idx) {
		dao = template.getMapper(UserDaoInterface.class);
		List<ServiceEdit> serviceEdit = dao.getService2(mento_idx);
		return serviceEdit;
	}
	//
	// 고수의 서비스 등록
	public int editService(int mento_idx, int service_idx) {
		dao = template.getMapper(UserDaoInterface.class);
		int resultCnt = 0;
		resultCnt = dao.updateService(mento_idx, service_idx);
		return resultCnt;
	}

	// 등록된 서비스 삭제
	public int delService(int mento_idx, int service_idx) {
		System.out.println(mento_idx+"//"+service_idx);
		dao = template.getMapper(UserDaoInterface.class);
		int resultCnt = 0;
		resultCnt = dao.deleteService(mento_idx, service_idx);
		return resultCnt;
	}
	
	// 위치 수정
	public int LocationEdit(MentoProfile mentoProfile) {
		dao = template.getMapper(UserDaoInterface.class);
		int resultCnt = 0;
		resultCnt = dao.updateLocation(mentoProfile);
		return resultCnt;
	}
	
	// 결제 수단 수정
	public int PayEdit(MentoProfile mentoProfile) {
		dao = template.getMapper(UserDaoInterface.class);
		int resultCnt = 0;
		resultCnt = dao.updatePay(mentoProfile);
		return resultCnt;
	}
	
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
