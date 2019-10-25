package com.yal.toti.baek.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yal.toti.baek.service.RoomService;

@RestController
@RequestMapping("/chat/room")
public class ChatRoomController {

	@Autowired
	private RoomService service;

	@CrossOrigin
	@GetMapping("/{est_idx}/{cate_idx}/{user}/{m_idx}")
	public int createChatRoom(@PathVariable("est_idx") int roomnum, @PathVariable("cate_idx") int category,
			@PathVariable("user") int user, @PathVariable("m_idx") int target) {

		System.out.println(roomnum);
		
		int cnt = service.insertChatRoom(roomnum, category, user, target);

		return cnt;
	}

	@GetMapping("/{est_idx}")
	public String searchChatRoom(@PathVariable("est_idx") int roomnum) {

		String room = service.searchChatRoom(roomnum);

		return room;
	}

	@CrossOrigin
	@GetMapping(value = "/{m_idx}/{user}/{est_idx}", produces = "application/text; charset=utf8")
	public String targetName(@PathVariable("m_idx") int target, @PathVariable("user") int user, @PathVariable("est_idx") int est_idx) {

		String name = service.targetName(target, user, est_idx);

		return name;
	}

	@CrossOrigin
	@GetMapping(value = "/name/{user}", produces = "application/text; charset=utf8")
	public String usertName(@PathVariable("user") int user) {

		String name = service.userName(user);

		return name;
	}

}
