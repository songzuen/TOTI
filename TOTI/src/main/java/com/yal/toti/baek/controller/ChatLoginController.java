package com.yal.toti.baek.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.yal.toti.baek.domain.MemberInfo;
import com.yal.toti.baek.service.LoginService;

@Controller
public class ChatLoginController {

	@Autowired
	private LoginService loginService;

	@RequestMapping(value = "chat/chatLogin", method = RequestMethod.GET)
	public String loginForm(HttpServletRequest request) {

		String view = "/baek/chat/chatLogin";
		HttpSession session = request.getSession(false);

		if (session != null && session.getAttribute("loginInfo") != null) {
			view = "/baek/chat/chatPage";
		}

		return view;
	}

	@RequestMapping(value = "chat/chatLogin", method = RequestMethod.POST)
	public String login(@RequestParam("m_id") String id, HttpServletRequest request, HttpSession session, Model model) {

		String view = "baek/chat/chatPage";
		int loginChk = loginService.login(id, request);

		switch (loginChk) {
		case 1:
			MemberInfo memberInfo = (MemberInfo) request.getSession().getAttribute("loginInfo");
			model.addAttribute("loginInfo", memberInfo);
			System.out.println(memberInfo);
			view = "/baek/chat/chatPage";
			break;

		case 2:
			view = "redirect:/chat/chatLogin";
			break;

		}
		return view;
	}

}
