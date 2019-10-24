package com.yal.toti.yu.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yal.toti.yu.member.domain.MemberInfo;
import com.yal.toti.yu.member.domain.RequestMentorReg;
import com.yal.toti.yu.member.domain.RequestVerEditMemberInfo;
import com.yal.toti.yu.member.service.MentorRegService;
import com.yal.toti.yu.member.service.verEditService;


@RestController
@RequestMapping("/member/mentor")
public class RestFulMentorController {

	@Autowired
	private MentorRegService regService;
	
	@Autowired
	private  verEditService verEditService;
	
	
	@CrossOrigin
	@PostMapping
	public ResponseEntity<String> insertMentor(RequestMentorReg mentorReg, HttpServletRequest request){
		
		int cnt = regService.mentorInsert(request, mentorReg);
		
		return new ResponseEntity<String>(cnt>0 ? "success" : "fail" , HttpStatus.OK);
		
	}
	
	
	
// ver change
	@CrossOrigin
	@GetMapping("/{id}")
	public ResponseEntity<MemberInfo> getVer(@PathVariable("id") String id){
		
		MemberInfo memberInfo = verEditService.getEditVerData(id);
		
		return new ResponseEntity<MemberInfo>(memberInfo, HttpStatus.OK);			
	}
	
	@CrossOrigin
	@PutMapping("/{id}")
	public ResponseEntity<String> editVer(
			@PathVariable("id") String id,
			@RequestBody RequestVerEditMemberInfo editRequest,
			HttpServletRequest request
			){
		
		editRequest.setId(id);
		int cnt = verEditService.verEdit(editRequest, request);
		System.out.println(editRequest);
		
		
	
	return new ResponseEntity<String>(cnt>0?"success":"fail", HttpStatus.OK);
		
		
	}
}
