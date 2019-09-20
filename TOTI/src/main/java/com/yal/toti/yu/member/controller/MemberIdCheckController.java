package com.yal.toti.yu.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yal.toti.yu.member.service.MemberRegService;

@Controller
public class MemberIdCheckController {
	
	@Autowired
	private MemberRegService service;

	
	// 2. 간단한 문자나 문자열 처리해야한다면 이렇게 굳이 뷰페이지 만들지 않고 리스폰스바디를 사용해서 편하게 할 수 있음
	@CrossOrigin
	@RequestMapping("/member/idCheck")
	@ResponseBody //뷰페이지가 아니라 스트링값 그대로 응답처리
	public String idCheck(@RequestParam("m_id") String m_id) {
		
		//model.addAttribute("result",regService.idCheck(id));
		System.out.println("아이디 체크 : "+ m_id);
		System.out.println(service.idCheck(m_id));
		
		return service.idCheck(m_id);
		
	}
	
	/*
	 * // 리스폰스바디를 사용하지 않는 방식은 -> Y나 N 하나 반환하는데도 뷰 페이지를 만듬
	 * 
	 * @RequestMapping("/member/idCheck") public String idCheck1(@RequestParam("id")
	 * String id, Model model) {
	 * 
	 * model.addAttribute("result",service.idCheck(id));
	 * 
	 * return "member/idCheck"; }
	 */
}
