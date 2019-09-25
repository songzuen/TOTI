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
	public List<MentoInfo> getMentoList(){
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


}
