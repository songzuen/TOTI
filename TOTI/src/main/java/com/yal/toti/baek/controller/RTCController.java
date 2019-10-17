package com.yal.toti.baek.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RTCController {

	@RequestMapping(value = "chat/rtc")
	public String getRTCPage() {

		return "/baek/chat/rtcPage";
	}
}
