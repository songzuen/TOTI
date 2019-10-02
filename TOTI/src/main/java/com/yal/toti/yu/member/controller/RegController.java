package com.yal.toti.yu.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yal.toti.yu.member.domain.MemberInfo;
import com.yal.toti.yu.member.service.MailSenderService;
import com.yal.toti.yu.member.service.RegService;


@RestController
@CrossOrigin
@RequestMapping(value = "/member/reg")
public class RegController {

	@Autowired
	private RegService regService;
	@Autowired
	private MailSenderService mailSenderService;

	@PostMapping
	public ResponseEntity<String> regMem(HttpServletRequest request, MemberInfo memberInfo) {

		int cnt = regService.memInsert(request, memberInfo);
		if (cnt > 0) {
			cnt = mailSenderService.send(memberInfo);
		} else {
			cnt = 0;
		}
		return new ResponseEntity<String>(cnt > 0 ? "success" : "fail", HttpStatus.OK);
	}

	@GetMapping()
	public String checkId(@RequestParam("id") String id) {

		MemberInfo memberInfo = regService.checkId(id);
		return memberInfo == null ? "Y" : "N";
	}
}
