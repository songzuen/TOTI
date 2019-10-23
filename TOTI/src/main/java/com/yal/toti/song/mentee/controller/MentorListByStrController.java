package com.yal.toti.song.mentee.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yal.toti.song.mentee.domain.MentorInfo;
import com.yal.toti.song.mentee.domain.MentorMemberInfo;
import com.yal.toti.song.mentee.domain.SearchParam;
import com.yal.toti.song.mentee.service.MentorListService;

@RestController
@RequestMapping("/mentee/mentorListByStr")
public class MentorListByStrController {

	@Autowired
	private MentorListService mentorListService;

	// 고수 리스트
	@GetMapping
	public ResponseEntity<List<MentorMemberInfo>> getListByRCnt(
			@RequestParam(value = "rCnt", required = false) boolean chk) {
		List<MentorMemberInfo> list = null;

			list = mentorListService.getListByStr();
			
		ResponseEntity<List<MentorMemberInfo>> entity = new ResponseEntity<List<MentorMemberInfo>>(list, HttpStatus.OK);
		return entity;
	}
}
