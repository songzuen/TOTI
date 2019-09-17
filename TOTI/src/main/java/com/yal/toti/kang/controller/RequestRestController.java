package com.yal.toti.kang.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.yal.toti.kang.domain.CategoriData;
import com.yal.toti.kang.domain.ItemListData;
import com.yal.toti.kang.domain.RequestListData;
import com.yal.toti.kang.service.RequestService;

@RestController
public class RequestRestController {

	@Autowired
	private RequestService requestService;
	
	@CrossOrigin
	@GetMapping("/kategorieList")
	public ResponseEntity<List<CategoriData>> getKategorieList() {
		
		List<CategoriData> list = requestService.getKategorieList();
		
		ResponseEntity<List<CategoriData>> entity = new ResponseEntity<List<CategoriData>>(list, HttpStatus.OK);
		
		return entity;	
	}
	
	@CrossOrigin
	@GetMapping("/itemList/{quest_idx}")
	public ResponseEntity<List<ItemListData>> getItemList(@PathVariable("quest_idx") int quest_idx) {
		
		List<ItemListData> list = requestService.getItemList(quest_idx);
		
		ResponseEntity<List<ItemListData>> entity = new ResponseEntity<List<ItemListData>>(list, HttpStatus.OK);
		
		return entity;	
	}
	
}
