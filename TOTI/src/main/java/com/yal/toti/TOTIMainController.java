package com.yal.toti;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TOTIMainController {

	@RequestMapping("/main")
	public String getMain() {
		return "main";
	}
	
	@RequestMapping("/sample")
	public String getSamplePage() {
		return "kang/sample";
	}
}
