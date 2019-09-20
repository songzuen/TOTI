package com.yal.toti.yu.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yal.toti.yu.member.service.ForgotService;

@Controller
public class MemberForgotController {

	@Autowired
	private ForgotService service;

	@CrossOrigin
	@RequestMapping("/member/forgotId")
	@ResponseBody
	public String forgotId(@RequestParam("m_name") String m_name, @RequestParam("m_email") String m_email) {

		int cnt = service.forgotId(m_name, m_email);

		return cnt > 0 ? "SUCCESS" : "FAIL";
	}

	@CrossOrigin
	@RequestMapping("/member/forgotPw")
	@ResponseBody
	public String forgotPw(@RequestParam("m_id") String m_id, @RequestParam("m_name") String m_name,
			@RequestParam("m_email") String m_email) {

		int cnt = service.forgotPw(m_id, m_name, m_email);

		return cnt > 0 ? "SUCCESS" : "FAIL";
	}
}
