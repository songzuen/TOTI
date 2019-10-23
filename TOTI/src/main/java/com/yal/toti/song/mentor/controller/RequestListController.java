package com.yal.toti.song.mentor.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yal.toti.song.mentor.domain.RequestList;
import com.yal.toti.song.mentor.service.RequestListService;

//@RequestMapping("/mentor/requestList/{mento_idx}")

@RestController
@RequestMapping("/mentor/requestList")
public class RequestListController {

	@Autowired
	private RequestListService requestListService;

	@GetMapping("/{mento_idx}")
		public ResponseEntity<List<RequestList>> getList(@PathVariable("mento_idx") int mento_idx, Model model){
		List<RequestList> list = null;

		list = requestListService.getAllList(mento_idx);
		
		model.addAttribute("mento_idx", mento_idx);
		ResponseEntity<List<RequestList>> entity = new ResponseEntity<List<RequestList>>(list, HttpStatus.OK);

		return entity;
	}
	
}
