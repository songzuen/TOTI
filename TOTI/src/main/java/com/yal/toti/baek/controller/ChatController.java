package com.yal.toti.baek.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatController {

	@RequestMapping(value = "chat/chatPage")
	public String chatPage() {
		
		return "/baek/chat/chatPage";
	}
}
