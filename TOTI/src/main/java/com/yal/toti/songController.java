package com.yal.toti;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class songController {

	@RequestMapping("/requestList/{request_idx}")
	public String getForm(@PathVariable("request_idx") int request_idx) {
	return "song/mentor/requestModal";
	}
	
	@RequestMapping("/mentorList")
	public String getMentorList() {
		return "song/mentee/mentorList";
	}
	
	@RequestMapping("/requestList")
	public String getRequestList() {
		return "song/mentor/requestList";
	}
	
	@RequestMapping("/mentor/{mento_idx}")
	public String getPage(@PathVariable("mento_idx") int mento_idx) {
		return "song/mentee/mentorPage";
	}
	
	@RequestMapping("/mentor/chatList")
	public String getChatList() {
		return "song/mentor/chatList";
	}
}
