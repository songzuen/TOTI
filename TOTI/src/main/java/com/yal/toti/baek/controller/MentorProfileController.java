package com.yal.toti.baek.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yal.toti.baek.domain.MentorProfile;
import com.yal.toti.baek.domain.MentorReview;
import com.yal.toti.baek.service.MentorService;

@RestController
@RequestMapping("chat/profile/mentor")
public class MentorProfileController {

	@Autowired
	private MentorService service;

	@CrossOrigin
	@GetMapping("/{m_idx}")
	public MentorProfile mentorProfile(@PathVariable("m_idx") int user) {

		MentorProfile profile = service.getMentorProfile(user);

		/* System.out.println(profile); */
		return profile;
	}

	@CrossOrigin
	@GetMapping("review/{user}")
	public ResponseEntity<List<MentorReview>> reviews(@PathVariable("user") int user) {

		List<MentorReview> reviews = service.getReview(user);

		ResponseEntity<List<MentorReview>> entity = new ResponseEntity<List<MentorReview>>(reviews, HttpStatus.OK);

		return entity;
	}

}
