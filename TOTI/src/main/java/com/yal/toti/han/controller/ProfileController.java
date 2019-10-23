package com.yal.toti.han.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProfileController {

	@RequestMapping("/profile/{mento_idx}")
	public String getMentoProfile(@PathVariable("mento_idx") int mento_idx) {
		return "han/user/MentoProfile";
	}
	
	@RequestMapping("/review/{mento_idx}")
	public String writeReview(@PathVariable("mento_idx") int mento_idx) {
		return "han/user/ReviewWrite";
	}
	
	/*
	 * @RequestMapping("/mento") 
	 * public String mypage(HttpSession session) {
	 * 
	 * if (session == null || session.getAttribute("mento_idx") == null) { }
	 * 
	 * return "han/user/mentoProfile";
	 * 
	 * }
	 */
}
