package com.yal.toti.song.mentor.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yal.toti.song.mentor.domain.RequestList;

@RestController
@RequestMapping("requestList")
public class RequestListController {

	@GetMapping
	public ResponseEntity<List<RequestList>> getList(){
		List<RequestList> list = null;
		
		ResponseEntity<List<RequestList>> entity = new ResponseEntity<List<RequestList>>(list, HttpStatus.OK);
		
		return entity;
	}
}
