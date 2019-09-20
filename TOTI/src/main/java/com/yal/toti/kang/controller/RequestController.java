package com.yal.toti.kang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.yal.toti.kang.domain.RequestListData;
import com.yal.toti.kang.service.RequestService;

@Controller
@RequestMapping("/request")
public class RequestController {

	@Autowired
	private RequestService requestService;
	
	
	@RequestMapping(method = RequestMethod.GET)
	public String getRequestList(@RequestParam("cate_idx") int cate_idx, Model model) {

		RequestListData data = requestService.getRequestListData(cate_idx);

		model.addAttribute("data", data);

		return "kang/request/requestForm";

	}
	
	
	
}
