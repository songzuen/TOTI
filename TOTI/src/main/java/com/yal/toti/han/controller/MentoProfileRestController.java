package com.yal.toti.han.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	// 고수 모든 정보
	@CrossOrigin
	@GetMapping("/{mento_idx}")
	public ResponseEntity<List<MentoProfile>> getMentoInfo(@PathVariable("mento_idx") int mento_idx, Model model){//HttpSession session
		
		List<MentoProfile> profile = mentoservice.getMentoData(mento_idx);
		
		model.addAttribute("mento_idx", mento_idx);//session.getAttribute()
		
		ResponseEntity<List<MentoProfile>> entity = new ResponseEntity<List<MentoProfile>>(profile, HttpStatus.OK);
		
		return entity;
	}
	
	// 이름 수정
	@CrossOrigin
	@PutMapping("/editname/{mento_idx}")
	public ResponseEntity<String> editName(@PathVariable("mento_idx") int mento_idx, @RequestBody MentoProfile mentoProfile){
		
		mentoProfile.setMento_idx(mento_idx);
		
		int cnt = mentoservice.NameEdit(mentoProfile);
		
		return new ResponseEntity<String>(cnt < 0 ? "success" : "fail", HttpStatus.OK);
		
	}
	
	// 한 줄 소개 수정
	@CrossOrigin
	@PutMapping("/editshot/{mento_idx}")
	public ResponseEntity<String> editShot(@PathVariable("mento_idx") int mento_idx, @RequestBody MentoProfile mentoProfile){
		
		mentoProfile.setMento_idx(mento_idx);
		
		int cnt = mentoservice.ShotEdit(mentoProfile);
		
		return new ResponseEntity<String>(cnt < 0 ? "success" : "fail", HttpStatus.OK);
		
	}
	
	// 제공 서비스 수정
	
	// 위치 수정
	
	// 결제 수단 수정
	
	// 학력 수정
	@CrossOrigin
	@PutMapping("/editedu/{mento_idx}")
	public ResponseEntity<String> editEdu(@PathVariable("mento_idx") int mento_idx, @RequestBody MentoProfile mentoProfile){
		
		mentoProfile.setMento_idx(mento_idx);
		
		int cnt = mentoservice.EduEdit(mentoProfile);
		
		return new ResponseEntity<String>(cnt < 0 ? "success" : "fail", HttpStatus.OK);
		
	}
	// 경력 수정
	@CrossOrigin
	@PutMapping("/editcareer/{mento_idx}")
	public ResponseEntity<String> editCareer(@PathVariable("mento_idx") int mento_idx, @RequestBody MentoProfile mentoProfile){
		
		mentoProfile.setMento_idx(mento_idx);
		
		int cnt = mentoservice.CareerEdit(mentoProfile);
		
		return new ResponseEntity<String>(cnt < 0 ? "success" : "fail", HttpStatus.OK);
		
	}
	// 상세 소개 수정
	@CrossOrigin
	@PutMapping("/editlong/{mento_idx}")
	public ResponseEntity<String> editLong(@PathVariable("mento_idx") int mento_idx, @RequestBody MentoProfile mentoProfile){
		
		mentoProfile.setMento_idx(mento_idx);
		
		int cnt = mentoservice.LongEdit(mentoProfile);
		
		return new ResponseEntity<String>(cnt < 0 ? "success" : "fail", HttpStatus.OK);
		
	}
}
