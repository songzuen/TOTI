package com.yal.toti.kang.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yal.toti.kang.domain.KategoriData;
import com.yal.toti.kang.domain.RequestData;
import com.yal.toti.kang.service.RequestService;

@RestController
public class RequestController {

	@Autowired
	private RequestService requestService;
	
	@CrossOrigin
	@GetMapping("/kategorieList")
	public ResponseEntity<List<KategoriData>> getKategorieList() {
		
		List<KategoriData> list = requestService.getKategorieList();
		
		ResponseEntity<List<KategoriData>> entity = new ResponseEntity<List<KategoriData>>(list, HttpStatus.OK);
		
		return entity;	
	}
	
	
}
