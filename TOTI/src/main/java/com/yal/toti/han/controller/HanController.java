package com.yal.toti.han.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HanController {

	@RequestMapping("/service")
	public String getService() {
		return "han/admin/adminService";
	}

	@RequestMapping("/question")
	public String getQuestion() {
		return "han/admin/adminQuestion";
	}

	/*
	 * @RequestMapping("/profile/${mento_idx}") public String getList() { return
	 * "han/user/profile/${mento_idx}"; }
	 */
	
}
