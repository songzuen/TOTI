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
	@RequestMapping(value = "/member/loginProcess2")
	public String getLogi1process2() {
		return "yu/member/loginProcess2";
	}
	
	@RequestMapping(value = "/member/logout")
	public String getLogout() {
		return "yu/member/logout";
	}
	@RequestMapping(value = "/member/goMentor")
	public String getGoMentor() {
		return "yu/member/goMentor";
	}
	@RequestMapping(value = "/member/goMentee")
	public String getGoMentee() {
		return "yu/member/goMentee";
	}


	@RequestMapping(value = "/member/logout2")
	public String getLogout2() {
		return "yu/member/logout2";
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
	@RequestMapping(value = "/mypage2")
	public String getMypage2() {
		return "yu/member/mypage2";
	}
	@RequestMapping(value = "/insertMentor")
	public String getMentorReg() {
		return "yu/member/insertMentor";
	}
	@RequestMapping(value = "/cash")
	public String getCash() {
		return "yu/member/cash";
	}
	@RequestMapping(value = "/insertMen")
	public String getMen() {
		return "yu/member/insertMen";
	}
}
