package com.yal.toti.baek.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ChatListController {

	@RequestMapping(value = "chat/chatList", method = RequestMethod.GET)
	public String loginForm(HttpServletRequest request) {

		String view = "/baek/chat/chatList";

		return view;
	}

	/*
	 * @RequestMapping(value = "chat/chatList", method = RequestMethod.POST) public
	 * String login(@RequestParam("m_id") String id, HttpServletRequest request,
	 * HttpSession session, Model model) {
	 * 
	 * String view = "baek/chat/chatPage"; int loginChk = loginService.login(id,
	 * request);
	 * 
	 * switch (loginChk) { case 1: MemberInfo memberInfo = (MemberInfo)
	 * request.getSession().getAttribute("loginInfo");
	 * model.addAttribute("loginInfo", memberInfo); System.out.println(memberInfo);
	 * view = "/baek/chat/chatList"; break;
	 * 
	 * case 2: view = "redirect:/chat/chatList"; break;
	 * 
	 * } return view; }
	 */
}
