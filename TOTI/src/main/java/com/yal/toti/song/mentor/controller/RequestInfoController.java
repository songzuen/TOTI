package com.yal.toti.song.mentor.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yal.toti.song.mentor.domain.RequestList;
import com.yal.toti.song.mentor.service.RequestInfoService;

@RestController
@RequestMapping("/requestInfo/{request_idx}")
public class RequestInfoController {

	@Autowired
	private RequestInfoService requestInfoService;
	
	@GetMapping
	public ResponseEntity<List<RequestList>> getRequestInfo(@PathVariable("request_idx") int request_idx){
		List<RequestList> list = null;
		
		list = requestInfoService.getRequestInfo(request_idx);
		ResponseEntity<List<RequestList>> entity = new ResponseEntity<List<RequestList>>(list,HttpStatus.OK);
		
		return entity;
		
		
	}
}
