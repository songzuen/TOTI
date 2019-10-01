package com.yal.toti.song.mentor.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yal.toti.song.mentor.domain.Coin;
import com.yal.toti.song.mentor.service.EstimateService;

@RestController
@RequestMapping("/credit/{mento_idx}")
public class CreditController {

	@Autowired
	private EstimateService estimateService;
	
	@GetMapping
	public ResponseEntity<List<Coin>> confirmCredit(@PathVariable("mento_idx")int mento_idx){
		List<Coin> list = null;
		
		list = estimateService.coinCheck(mento_idx);
		
		ResponseEntity<List<Coin>> entity = new ResponseEntity<List<Coin>>(list,HttpStatus.OK);
		return entity;
	}
	
	@PutMapping
	public ResponseEntity<String> updateCredit(@PathVariable("mento_idx")int mento_idx){
	 
		int cnt = estimateService.updateCoin(mento_idx);
		return new ResponseEntity<String>(cnt>0?"success":"fail",HttpStatus.OK);
	}
}
