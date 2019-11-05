package com.yal.toti.kang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.yal.toti.kang.domain.RequestData;
import com.yal.toti.kang.domain.RequestListData;
import com.yal.toti.kang.service.RequestService;

@Controller
public class RequestController {

	@Autowired
	private RequestService requestService;
	
	@RequestMapping(value = ("/request"), method = RequestMethod.GET)
	public String getRequestList(@RequestParam("cate_idx") int cate_idx, Model model) {

		RequestListData data = requestService.getRequestListData(cate_idx);

		model.addAttribute("data", data);

		return "kang/request/requestForm";

	}
	
	@RequestMapping(value = ("/request"), method = RequestMethod.POST)
	public String request(RequestData data, Model model) {		

		try {
			requestService.insertRequest(data);

			model.addAttribute("request_idx", data.getRequest_idx());
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "kang/request/request";
	}

	@RequestMapping("/{request_idx}")
	public String userRequest(@PathVariable("request_idx") int request_idx, Model model) {		
		
		model.addAttribute("request_idx", request_idx);
		
		return "kang/request/request";
		
	}
	
	@RequestMapping("/requests")
	public String userRequestList() {		
		
		return "kang/request/myRequestList";
	}
	
	@RequestMapping("/estimatee/{request_idx}")
	public String userEstimatee(@PathVariable("request_idx") int request_idx, Model model) {		
		
		model.addAttribute("request_idx", request_idx);
		
		return "kang/request/estimatee";
		
	}
	
	@RequestMapping("/request/map")
	public String dd() {
		
		return "kang/request/map";
	}
	
}
