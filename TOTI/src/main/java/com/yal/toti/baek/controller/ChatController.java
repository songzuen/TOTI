package com.yal.toti.baek.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatController {

	@RequestMapping(value = "chat/chatPage/{est_idx}/{m_idx}")
	public String chatPage(@PathVariable("est_idx") int est_idx, @PathVariable("m_idx") int m_idx, Model model) {

		model.addAttribute("est_idx", est_idx);
		model.addAttribute("m_idx", m_idx);

		System.out.println(est_idx);
		System.out.println(m_idx);

		return "/baek/chat/chatPage";
	}
}
