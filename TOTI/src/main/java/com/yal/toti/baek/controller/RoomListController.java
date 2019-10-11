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

import com.yal.toti.baek.domain.ChatRoomInfo;
import com.yal.toti.baek.service.RoomService;

@RestController
@RequestMapping("chat/roomlist")
public class RoomListController {

	@Autowired
	private RoomService service;

	@CrossOrigin
	@GetMapping("/{user}")
	public ResponseEntity<List<ChatRoomInfo>> getChatList(@PathVariable("user") int user) {

		List<ChatRoomInfo> list = service.getRoomList(user);

		return new ResponseEntity<List<ChatRoomInfo>>(list, HttpStatus.OK);
	}
}
