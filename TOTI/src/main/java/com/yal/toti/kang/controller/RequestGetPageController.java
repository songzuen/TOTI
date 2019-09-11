package com.yal.toti.kang.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RequestGetPageController {

	@RequestMapping("/request")
	public String getRequestPage() {
		
		return "kang/request/requestForm";
	}
	
}
