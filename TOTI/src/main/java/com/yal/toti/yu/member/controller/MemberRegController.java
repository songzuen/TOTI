package com.yal.toti.yu.member.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yal.toti.yu.member.domain.RequestMemberRegist;
import com.yal.toti.yu.member.service.MemberRegService;

@RestController
@RequestMapping("/member/regist")
public class MemberRegController {

	@Autowired
	private MemberRegService service;

	@CrossOrigin
	@GetMapping
	public String getRegistForm() {

		return "member/registForm";
	}

	@CrossOrigin
	@PostMapping
	public ResponseEntity<String> memberRegist(RequestMemberRegist regist) {

		System.out.println(regist);

		int cnt = service.memberInsert(regist);

		return new ResponseEntity<String>(cnt > 0 ? "SUCCESS" : "FAIL", HttpStatus.OK);
	}






/*@Controller
@RequestMapping("/member/regist")
public class MemberRegController {
	
	@Autowired
	private MemberRegService service;

	@CrossOrigin
	@GetMapping
	public String getForm() {
		return "member/registForm";
	}
	
	public ResponseEntity<String> regMember(RequestMemberRegist regRequest, HttpServletRequest request){
		
		System.out.println(regRequest);
		
		int cnt = service.memberInsert(regRequest);
		
		return new ResponseEntity<String>(cnt>0?"SUCCESS":"FAIL", HttpStatus.OK);
		
	}
	*/

}
