package com.yal.toti.yu.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yal.toti.yu.member.service.MemberRegService;

@Controller
public class MemberEmailCheckController {

	@Autowired
	private MemberRegService service;
	
	@CrossOrigin
	@RequestMapping("/member/emailCheck")
	@ResponseBody
	public String emailCheck(@RequestParam("m_email") String m_email) {
		System.out.println(m_email);
		System.out.println(service.emailCheck(m_email));

		return service.emailCheck(m_email);
	}
}