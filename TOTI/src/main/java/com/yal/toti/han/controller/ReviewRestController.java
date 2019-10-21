package com.yal.toti.han.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yal.toti.han.domain.ReviewInfo;
import com.yal.toti.han.service.ReviewService;

@RestController
@RequestMapping
public class ReviewRestController {
	
	@Autowired
	private ReviewService reviewservice;
	
	@CrossOrigin
	@PostMapping("/review")
	public ResponseEntity<String> questionInsert(ReviewInfo reviewInfo) {

		int cnt = reviewservice.ReviewInsert(reviewInfo);

		return new ResponseEntity<String>(cnt > 0 ? "success" : "fail", HttpStatus.OK);
	}
	
	@CrossOrigin
	@DeleteMapping("/delreview/{review_idx}")
	public ResponseEntity<String> deleteService(@PathVariable("review_idx") int review_idx) {

		int cnt = reviewservice.ReviewDelete(review_idx);

		return new ResponseEntity<String>(cnt > 0 ? "success" : "fail", HttpStatus.OK);
	}
}
