package com.yal.toti.yu.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yal.toti.yu.member.domain.MemberInfo;
import com.yal.toti.yu.member.service.MailSenderService2;


@RestController
@CrossOrigin
@RequestMapping("/member/verifyidx2")
public class VerifyController2 {
	
	@Autowired
	private MailSenderService2 mailSenderService2; 
	
	// 인증키 메일 통해 인증키 값 변경
	@GetMapping
	public String ver(
			@RequestParam("id") String id
			) {
		
		int cnt = mailSenderService2.changeVer(id);
		
		return cnt>0?"success":"fail";
	}
	
	

}
