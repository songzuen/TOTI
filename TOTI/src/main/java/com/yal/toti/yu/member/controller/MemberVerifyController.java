package com.yal.toti.yu.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yal.toti.yu.member.service.MemberVerifyService;

@Controller
public class MemberVerifyController {
	
	@Autowired
	private MemberVerifyService service;
	
	//@ResponseBody
	@RequestMapping("/member/m_codeVer")
	public String m_codeVer(
			@RequestParam("m_id") String m_id,
			@RequestParam("m_code") String m_code
			) {
		
		String verifyResult = service.m_codeVer(m_id, m_code);
		
		return "member/m_codeVer"+verifyResult;		
	}
	

//	@ResponseBody
//	@RequestMapping("/member/verify")
//	public String verify(
//			@RequestParam("id") String id,
//			@RequestParam("code") String code
//			) {
//		
//		return id + " : " + code;		
//	}

	// 메일 재 발송 요청 
		@CrossOrigin
		@RequestMapping("/member/remail")
		@ResponseBody
		public String reSendMail(@RequestParam("m_id") String m_id) {
			
			if (m_id != null) {
				
				service.reMailSend(m_id);
				return "SUCCESS";
			
			} else {
				
				return "FAIL";
			}
		}
	
}