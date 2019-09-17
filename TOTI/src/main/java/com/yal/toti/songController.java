package com.yal.toti;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String getPage(@RequestParam("mento_idx") int mento_idx) {
		return "song/mentee/mentorPage";
	}
}
