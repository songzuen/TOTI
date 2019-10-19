package com.yal.toti.song.mentee.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yal.toti.song.mentee.domain.MentorInfo;
import com.yal.toti.song.mentee.domain.MentorMemberInfo;
import com.yal.toti.song.mentee.domain.SearchParam;
import com.yal.toti.song.mentee.service.MentorListService;

@RestController
public class MentorListController {

	@Autowired
	private MentorListService mentorListService;

	// 고수 리스트
	@CrossOrigin
	@GetMapping
	@RequestMapping("/mentee/mentorList")
	public ResponseEntity<List<MentorMemberInfo>> getAllList(
			@RequestParam(value = "stype", required = false) String stype,
			@RequestParam(value = "keyword", required = false) String keyword
			) {
		List<MentorMemberInfo> list = null;

		SearchParam search = null;
	
		if (stype != null && keyword != null && !stype.isEmpty() && !keyword.isEmpty()) {
			search = new SearchParam();
			search.setStype(stype);
			search.setKeyword(keyword);
			
			list = mentorListService.getListData(search);
			
		}
		else {
			list = mentorListService.getAllList();
		}
		ResponseEntity<List<MentorMemberInfo>> entity = new ResponseEntity<List<MentorMemberInfo>>(list, HttpStatus.OK);
		return entity;
	}
}
