package com.yal.toti;

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
	
	@RequestMapping("/mento")
	public String getMentoPage() {
		return "han/user/mentoProfile";
	}
	
}
