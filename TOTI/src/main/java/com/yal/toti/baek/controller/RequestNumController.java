package com.yal.toti.baek.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yal.toti.baek.service.RequestCheckService;

@RestController
@RequestMapping("chat/checkreq")
public class RequestNumController {

	@Autowired
	private RequestCheckService service;

	@CrossOrigin
	@GetMapping("/{room_num}")
	public int getReqNum(@PathVariable("room_num") int room_num) {

		System.out.println(room_num);

		int num = 0;

		num = service.getReqNum(room_num);

		return num;
	}

}
