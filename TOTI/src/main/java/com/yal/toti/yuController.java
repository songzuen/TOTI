package com.yal.toti;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class yuController {
	
	@RequestMapping("/login")
	public String getLogin() {
		return "yu/member/login";
	}
	@RequestMapping(value = "/member/loginProcess")
	public String getLogi1process() {
		return "yu/member/loginProcess";
	}
	
	@RequestMapping(value = "/member/logout")
	public String getLogout() {
		return "yu/member/logout";
	}

	@RequestMapping("/reg")
	public String getReg() {
		return "yu/member/reg";
	}
	@RequestMapping(value = "/member/verify")
	public String getVerify() {
		return "yu/member/keyVerify";
	}

	@RequestMapping(value = "/mypage")
	public String getMypage() {
		return "yu/member/mypage";
	}
	@RequestMapping(value = "/insertMentor")
	public String getMentorReg() {
		return "yu/member/insertMentor";
	}
}
