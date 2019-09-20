package com.yal.toti.yu.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yal.toti.yu.member.domain.RequestMemberLogin;
import com.yal.toti.yu.member.service.MemberLoginService;


@RestController
@RequestMapping("/member/pwcheck")
public class MemberPwCheckController {

	@Autowired
	private MemberLoginService service;

	@CrossOrigin
	@GetMapping
	public String getPwEditForm() {

		return "member/pwCheckForm";
	}

	@CrossOrigin
	@PostMapping
	public ResponseEntity<String> memberPwEdit(@RequestBody RequestMemberLogin login) {
		System.out.println("로그인아이디 : "+ login.getLogin_id());
		System.out.println("로그인비번 : " + login.getLogin_pw());

		int cnt = service.chkMember(login.getLogin_id(), login.getLogin_pw());
		return new ResponseEntity<String>(cnt > 0 ? "SUCCESS" : "FAIL", HttpStatus.OK);
	}

}
