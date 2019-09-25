package com.yal.toti.han.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yal.toti.han.domain.MentoInfo;
import com.yal.toti.han.domain.MentoProfile;
import com.yal.toti.han.service.MentoProfileService;

@RestController
@RequestMapping("/mento")
public class MentoProfileRestController {
	
	@Autowired
	private MentoProfileService mentoservice;

	@CrossOrigin
	@GetMapping("/mentoList")
	public ResponseEntity<List<MentoInfo>> getKategorieList() {
		
		List<MentoInfo> list = mentoservice.getMentoList();
		
		ResponseEntity<List<MentoInfo>> entity = new ResponseEntity<List<MentoInfo>>(list, HttpStatus.OK);
		
		return entity;	
	}
	
	@CrossOrigin
	@GetMapping("/{mento_idx}")
	public ResponseEntity<List<MentoProfile>> getMentoInfo(@PathVariable("mento_idx") int mento_idx, Model model){//HttpSession session
		
		List<MentoProfile> profile = mentoservice.getMentoData(mento_idx);
		
		model.addAttribute("mento_idx", mento_idx);//session.getAttribute()
		
		ResponseEntity<List<MentoProfile>> entity = new ResponseEntity<List<MentoProfile>>(profile, HttpStatus.OK);
		
		return entity;
	}
	
}
