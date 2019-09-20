package com.yal.toti.yu.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yal.toti.yu.member.domain.MemberInfo;
import com.yal.toti.yu.member.service.MemberMypageService;


@RestController
@RequestMapping(value = "/member/mypage")
public class MemberMypageController {

	@Autowired
	private MemberMypageService service;

	@CrossOrigin
	@GetMapping("/{m_id}")
	public ResponseEntity<MemberInfo> myInfo(@PathVariable("m_id") String m_id) {
		MemberInfo memberInfo = service.getInfo(m_id);
		System.out.println(memberInfo);
		return new ResponseEntity<MemberInfo>(memberInfo, HttpStatus.OK);
	}
	
//	@RequestMapping("/member/mypage")
//	public String mypage(HttpSession session) {
//		String view = "member/mypage";
//		
//		if(session == null || session.getAttribute("loginInfo")==null) {
//			view = "redirect:/member/login"; //컨텍스트 경로를 따로 쓰지 않았음
//		}
//		
//		return view;
//	}
}
