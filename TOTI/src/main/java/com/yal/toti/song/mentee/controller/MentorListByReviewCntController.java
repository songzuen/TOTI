package com.yal.toti.song.mentee.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yal.toti.song.mentee.domain.MentorMemberInfo;
import com.yal.toti.song.mentee.service.MentorListService;

@RestController
public class MentorListByReviewCntController {
	
	@Autowired
	private MentorListService mentorListService;

	// 고수 리스트
	@GetMapping
	@RequestMapping("/mentee/mentorListByRCnt")
	public ResponseEntity<List<MentorMemberInfo>> getListByRCnt(
			@RequestParam(value = "rCnt", required = false) boolean chk) {
		List<MentorMemberInfo> list = null;

			list = mentorListService.getListByRCnt();
			
		ResponseEntity<List<MentorMemberInfo>> entity = new ResponseEntity<List<MentorMemberInfo>>(list, HttpStatus.OK);
		return entity;
	}
}
