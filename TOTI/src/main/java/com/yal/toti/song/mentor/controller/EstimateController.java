package com.yal.toti.song.mentor.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yal.toti.song.mentor.domain.WriteEstimate;
import com.yal.toti.song.mentor.service.EstimateService;

@RestController
@RequestMapping("/estimate")
public class EstimateController {
	
	@Autowired
	private EstimateService estimateService;
		
	@PostMapping
	public ResponseEntity<String> writeEstimate(WriteEstimate write, HttpServletRequest request){
		int cnt = estimateService.insertEstimate(write, request);
		
		return new ResponseEntity<String>(cnt>0?"success":"fail",HttpStatus.OK);
	}
}
