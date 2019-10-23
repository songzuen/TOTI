package com.yal.toti.baek.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RTCController {

	@RequestMapping(value = "chat/rtc/{roomnum}/{target}/{user}")
	public String getRTCPage(@PathVariable("roomnum") int roomnum, @PathVariable("target") String target,
			@PathVariable("user") String user, Model model) {

		model.addAttribute("roomnum");
		model.addAttribute("target");
		model.addAttribute("user");

		return "/baek/chat/rtcPage";
	}
}
