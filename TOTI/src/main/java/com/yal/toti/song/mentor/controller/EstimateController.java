package com.yal.toti.song.mentor.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yal.toti.song.mentor.domain.WriteEstimate;
import com.yal.toti.song.mentor.service.EstimateService;

@RestController
@RequestMapping("/estimateform/{request_idx}")
public class EstimateController {

	@Autowired
	private EstimateService estimateService;

	@PostMapping
	public int writeEstimate(WriteEstimate write, HttpServletRequest request,
			@PathVariable("request_idx") int request_idx) {

		int cnt = estimateService.insertEstimate(write, request, request_idx);
		return (cnt > 0 ? cnt : 0);
	}
}
