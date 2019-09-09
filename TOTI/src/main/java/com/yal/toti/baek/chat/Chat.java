package com.yal.toti.baek.chat;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Chat {

	@RequestMapping(value = "baek/chat")
	public String getChatPage() {

		return "/baek/chat/chatPage";
	}
}
