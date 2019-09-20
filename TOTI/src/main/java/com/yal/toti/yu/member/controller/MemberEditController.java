package com.yal.toti.yu.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yal.toti.yu.member.domain.RequestMemberEdit;
import com.yal.toti.yu.member.service.MemberEditService;

	@RequestMapping(value = "/member/edit")
	@RestController
	public class MemberEditController {
	
		@Autowired
		private MemberEditService service;
	
		@CrossOrigin
		@PostMapping
		public ResponseEntity<String> memberEdit(RequestMemberEdit edit, HttpServletRequest request) {
			
			int cnt=0;
			System.out.println(edit);
			
			cnt = service.MemberEdit(edit, request);
			
			return new ResponseEntity<String>(cnt > 0 ? "SUCCESS" : "FAIL", HttpStatus.OK);
			
		}

		
		

/*@Controller
@RequestMapping("/member/memberEdit")
public class MemberEditController {
	
	@Autowired
	private MemberEditService editService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String editForm(
			@RequestParam("memberId") int id,
			Model model
			) {
		
		MemberInfo memberInfo = editService.getEditFormData(id);
		
		model.addAttribute("editData", memberInfo);
		
		return "member/editForm";
		
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String edit(RequestMemberEdit edit,
			HttpServletRequest request
			) {
		
		System.out.println("수정 :::::::" + edit);
		System.out.println("수정 이전 파일 : " + edit.getOldFile());
		
		int rCnt = 0;
		rCnt = editService.edit(edit, edit.getOldFile(), request);
		System.out.println(rCnt);
		
		return "redirect:/member/memberList";
		
	}
	*/
		
}
