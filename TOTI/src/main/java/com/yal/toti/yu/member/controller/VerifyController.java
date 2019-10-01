package com.yal.toti.yu.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yal.toti.yu.member.domain.MemberInfo;
import com.yal.toti.yu.member.service.MailSenderService;


@RestController
@CrossOrigin
@RequestMapping("/member/verifyidx")
public class VerifyController {
	
	@Autowired
	private MailSenderService mailSenderService; 
	
	// 인증키 메일 통해 인증키 값 변경
	@GetMapping
	public String verify(
			@RequestParam("code") String code,
			@RequestParam("id") String id
			) {
		
		int cnt = mailSenderService.changeVerify(id);
		
		return cnt>0?"success":"fail";
	}
	
	// 미인증 회원 -> 인증키 이메일 다시 전송
	@GetMapping("/resend")
	public String resendEmail(
			@RequestParam("id") String id
			) {
		
		MemberInfo memberInfo = new MemberInfo(id);
		int cnt = mailSenderService.send(memberInfo);
		
		return cnt > 0 ? "success" : "fail";
	}

}
