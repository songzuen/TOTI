package com.yal.toti.baek.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yal.toti.service.RoomService;

@RestController
@RequestMapping("chat/room")
public class ChatRoomController {

	@Autowired
	private RoomService service;

	@CrossOrigin
	@GetMapping("/{user}/{target}")
	public String searchChatRoom(@PathVariable("user") String user, @PathVariable("target") String target) {

		String room = service.searchChatRoom(user, target);

		return room;
	}

}
