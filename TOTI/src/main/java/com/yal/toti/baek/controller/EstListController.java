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

import com.yal.toti.baek.domain.EstInfo;
import com.yal.toti.baek.service.EstListServcie;

@RestController
@RequestMapping("chat/estlist")
public class EstListController {

	@Autowired
	private EstListServcie service;

	@CrossOrigin
	@GetMapping("/{user}")
	public ResponseEntity<List<EstInfo>> getMemberList(@PathVariable("user") int user) {

		// System.out.println(user);
		
		List<EstInfo> list = service.getEstList(user);

		ResponseEntity<List<EstInfo>> entity = new ResponseEntity<List<EstInfo>>(list, HttpStatus.OK);

		return entity;
	}

}
