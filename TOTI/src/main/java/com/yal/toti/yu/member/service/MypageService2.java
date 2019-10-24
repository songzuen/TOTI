package com.yal.toti.yu.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yal.toti.yu.member.dao.MemberDaoInterface;
import com.yal.toti.yu.member.domain.CoinInfo;

@Service("mypageService2")
public class MypageService2 {

	@Autowired
	private SqlSessionTemplate template;
	private MemberDaoInterface dao;


	// 내 코인 정보 불러오기
	public CoinInfo myCoinInfo(int idx) {

		dao = template.getMapper(MemberDaoInterface.class);

		CoinInfo coinInfo = dao.coinSelect(idx);

		return coinInfo;
	}

	

	public int editProcessCoin( CoinInfo coinInfo) {

		dao = template.getMapper(MemberDaoInterface.class);

		int cnt = 0;

		System.out.println("editProcessCoin"+coinInfo);

		
		
		// DB저장
		cnt = dao.addCoin(coinInfo);
		
		System.out.println("editProcessCoin"+cnt);
		
		return cnt;
	}
	
	
}
