package com.yal.toti.song.mentor.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yal.toti.song.mentor.domain.RequestList;
import com.yal.toti.song.mentor.service.RequestDeleteService;
import com.yal.toti.song.mentor.service.RequestListService;

//@RequestMapping("/mentor/requestList/{mento_idx}")

@RestController
@RequestMapping("/mentor/requestList")
public class RequestListController {

	@Autowired
	private RequestListService requestListService;

	@Autowired
	private RequestDeleteService requestDeleteService;

	@GetMapping
	public ResponseEntity<List<RequestList>> getList() {
//		public ResponseEntity<List<RequestList>> getList(@PathVariable("mento_idx") int mento_idx){
		List<RequestList> list = null;

		// list= requestListService.getAllList(mento_idx);
		list = requestListService.getAllList();

		ResponseEntity<List<RequestList>> entity = new ResponseEntity<List<RequestList>>(list, HttpStatus.OK);

		return entity;
	}

	@DeleteMapping("/{request_idx}")
	public ResponseEntity<String> deleteRequest(@PathVariable("request_idx") int request_idx) {
		int cnt = requestDeleteService.deleteRequest(request_idx);
		return new ResponseEntity<String>(cnt > 0 ? "success" : "fail", HttpStatus.OK);

	}

}
