package com.yal.toti.yu.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yal.toti.yu.member.service.MemberDeleteService;

@RestController
@RequestMapping("/member/delete")
public class MemberDeleteController {
	
	@Autowired
	private MemberDeleteService service;

	@CrossOrigin
	@DeleteMapping("/{m_idx}")
	public ResponseEntity<String> memberDelete(@PathVariable("m_idx") int m_idx) {

		System.out.println(m_idx);

		return new ResponseEntity<String>(service.deleteMember(m_idx) > 0 ? "SUCCESS" : "FAIL", HttpStatus.OK);

	}
	
}
