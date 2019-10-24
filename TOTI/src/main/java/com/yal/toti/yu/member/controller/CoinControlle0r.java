package com.yal.toti.yu.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yal.toti.yu.member.domain.CoinInfo;
import com.yal.toti.yu.member.service.MypageService2;



@RestController
@CrossOrigin
@RequestMapping("/member/coin")
public class CoinControlle0r {

	@Autowired
	private MypageService2 mypageService2;

	@GetMapping
	public CoinInfo coinInfo(HttpServletRequest request, @RequestParam(value = "idx") int idx) {

		CoinInfo coinInfo = mypageService2.myCoinInfo(idx);
		System.out.println(coinInfo);
		
		return coinInfo;
	}

	// 내정보 수정 -> 기존 값 불러오기
	@GetMapping("/idx")
	public CoinInfo editMyCoinInfo(int idx) {

		CoinInfo coinInfo = mypageService2.myCoinInfo(idx);
		

		return coinInfo;
	}

	
	// 내정보 수정 (그 외 업로드)
	@PostMapping
	public String editProcessCoin1(@RequestBody CoinInfo coinInfo) {

		System.out.println("editProcessCoin1" + coinInfo);
		int cnt = mypageService2.editProcessCoin(coinInfo);

		return cnt > 0 ? "success" : "fail";
	}
	
}
