package com.yal.toti.yu.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yal.toti.yu.member.domain.RequestMemberPwEdit;
import com.yal.toti.yu.member.service.MemberEditService;


@RequestMapping(value = "/member/pwedit")
@RestController
public class MemberPwEditController {

	@Autowired
	private MemberEditService service;

	@CrossOrigin
	@PutMapping
	public ResponseEntity<String> memberPwEdit(@RequestBody RequestMemberPwEdit pwEdit) {
		int cnt = 0;
		System.out.println(pwEdit);

		cnt = service.memberPwEdit(pwEdit);

		return new ResponseEntity<String>(cnt > 0 ? "SUCCESS" : "FAIL", HttpStatus.OK);
	}

}
