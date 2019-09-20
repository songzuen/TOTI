package com.yal.toti.song.mentor.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yal.toti.song.mentor.service.EstimateService;

@RestController
@RequestMapping("/credit/{mento_idx}")
public class CreditController {

	@Autowired
	private EstimateService estimateService;
	
	@PutMapping
	public ResponseEntity<String> updateCredit(@PathVariable("mento_idx")int mento_idx){
	 
		int cnt = estimateService.updateCredit(mento_idx);
		
		return new ResponseEntity<String>(cnt>0?"success":"fail",HttpStatus.OK);
	}
}
