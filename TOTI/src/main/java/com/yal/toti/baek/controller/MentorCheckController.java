package com.yal.toti.baek.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yal.toti.baek.service.MentorService;

@RestController
@RequestMapping("chat/mentorcheck")
public class MentorCheckController {

	@Autowired
	private MentorService service;

	@CrossOrigin
	@GetMapping("/{user}")
	public String mentorCheck(@PathVariable("user") int user) {

		String check = service.mentorCheck(user);

		return check;
	}

}
