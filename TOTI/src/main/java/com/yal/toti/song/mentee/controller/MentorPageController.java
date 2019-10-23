package com.yal.toti.song.mentee.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yal.toti.song.mentee.domain.MentorMemberInfo;
import com.yal.toti.song.mentee.domain.MentorServiceList;
import com.yal.toti.song.mentee.service.MentorPageService;

@RestController
@RequestMapping("/mentorpage/{mento_idx}")
public class MentorPageController {

	@Autowired
	MentorPageService mentorPageService;

	// 고수 페이지
	@GetMapping
	public 	ResponseEntity<List<MentorMemberInfo>> getMentorPage(
			@PathVariable("mento_idx") int mento_idx, Model model
			){
		List<MentorMemberInfo> list= null;
		list = mentorPageService.getPage(mento_idx);
		model.addAttribute("mento_idx", mento_idx);
		ResponseEntity<List<MentorMemberInfo>> entity = new ResponseEntity<List<MentorMemberInfo>>(list,HttpStatus.OK);

		return entity;
	}

//	@RequestMapping(value = "/mentorpage/{mento_idx}", method = RequestMethod.GET)
//	public String getMentorPage(Model model, @PathVariable("mento_idx") int mento_idx) {
//		List<MentorMemberInfo> list = mentorPageService.getPage(mento_idx);
//		System.out.println(mento_idx);
//		model.addAttribute("viewData", list);
//		return "song/mentee/mentorPage";
//	}
}
