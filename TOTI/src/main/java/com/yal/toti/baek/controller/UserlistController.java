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

import com.yal.toti.baek.domain.MemberInfo;
import com.yal.toti.service.MemberListServcie;

@RestController
@RequestMapping("chat/memberlist")
public class UserlistController {

	@Autowired
	private MemberListServcie service;

	@CrossOrigin
	@GetMapping("/{user}")
	public ResponseEntity<List<MemberInfo>> getMemberList(@PathVariable("user") String user) {

		List<MemberInfo> list = service.getMemberList(user);

		ResponseEntity<List<MemberInfo>> entity = new ResponseEntity<List<MemberInfo>>(list, HttpStatus.OK);

		return entity;
	}

}
