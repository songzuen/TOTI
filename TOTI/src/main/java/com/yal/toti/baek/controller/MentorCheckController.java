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
	@GetMapping("/{user}/{room_num}")
	public String mentorCheck(@PathVariable("user") int user, @PathVariable("room_num") int roomnum) {

		String check = service.mentorCheck(user, roomnum);

		return check;
	}

}
