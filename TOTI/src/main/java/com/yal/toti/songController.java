package com.yal.toti;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class songController {

	@RequestMapping("/estimate")
	public String getForm() {
	return "song/mentor/estimateForm";
	}
	
	@RequestMapping("/mentorList")
	public String getList() {
		return "song/mentee/mentorList";
	}
	
	@RequestMapping("/mentorpage/{mento_idx}")
	public String getPage() {
		return "song/mentee/mentorList";
	}
}
