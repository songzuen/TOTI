package com.yal.toti.yu.member.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yal.toti.yu.member.domain.RequestMemberLogin;
import com.yal.toti.yu.member.service.MemberLoginService;

@RequestMapping(value = "/member/login")
@RestController
public class MemberLoginController {
	
	@Autowired
	private MemberLoginService service;
	
	@GetMapping
	public String getLoginForm() {
		return "member/loginForm";
	}

	@CrossOrigin
	@PostMapping
	public ResponseEntity<String> memberLogin(RequestMemberLogin login, HttpServletRequest request) {

		int cnt = 0;

		cnt = service.login(login.getLogin_id(), login.getLogin_pw(), request);

		String loginId = (String) request.getSession().getAttribute("loginId");

		System.out.println("로그인 아이디 : " + loginId);
		if (cnt == 2) {
			return new ResponseEntity<String>(loginId + "_notVerify", HttpStatus.OK);
		} else {
			return new ResponseEntity<String>(cnt == 1 ? loginId : "FAIL", HttpStatus.OK);
		}
	}
	
	
	
	/*
	 * @RequestMapping(method = RequestMethod.GET) public String
	 * loginForm(HttpServletRequest request) { // 물론 나중엔 인터셉터 수준에서 리퀘스트를 가로채서 세션정보
	 * 확인하고... 해볼 것 String view = "member/loginForm"; HttpSession session =
	 * request.getSession(false);// 현재 세션을 가지고있으면 갖고있고 없으면 null 반환하라고 펄스함 if
	 * (session != null && session.getAttribute("loginInfo") != null) { view =
	 * "redirect:/main"; // 컨텍스트 경로 기준으로.. 센드 리다이렉트? }
	 * 
	 * return view; }
	 * 
	 * 
	 * // 메일 인증처리 후 변경된 로그인 코드
	 * 
	 * @RequestMapping(method = RequestMethod.POST) public String
	 * login(@RequestParam("m_id") String id, @RequestParam("m_email") String
	 * m_email, @RequestParam("m_pw") String pw, HttpServletRequest request,
	 * HttpSession session) {
	 * 
	 * String view = "member/loginfail";
	 * 
	 * // 서비스 로그인 처리 후 반환 타입 변경 int loginChk = service.login(id, m_email, pw,
	 * request);
	 * 
	 * switch (loginChk) { case 1: // 새로운 view(jsp) 추가 view = "member/notVerify";
	 * break; case 2: view = "redirect:/main"; break; }
	 * 
	 * return view;
	 * 
	 * }
	 */


}
