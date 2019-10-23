package com.yal.toti.yu.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yal.toti.yu.member.domain.MemberInfo;
import com.yal.toti.yu.member.service.MypageService;



@RestController
@CrossOrigin
@RequestMapping("/member/mypage")
public class MypageController {

	@Autowired
	private MypageService mypageService;

	@GetMapping
	public MemberInfo myInfo(HttpServletRequest request, @RequestParam(value = "id") String id) {

		MemberInfo memberInfo = mypageService.myInfo(id);
		System.out.println(memberInfo);
		
		return memberInfo;
	}

	// 내정보 수정 -> 기존 값 불러오기
	@GetMapping("/id")
	public MemberInfo editMyInfo(String id) {

		MemberInfo memberInfo = mypageService.myInfo(id);
		

		return memberInfo;
	}

	// 내정보 수정 (사진 업로드)
	@PostMapping
	public String editProcess(HttpServletRequest request, MemberInfo memberInfo) {

		int cnt = mypageService.editProcess(request, memberInfo);

		return cnt > 0 ? "success" : "fail";
	}

	// 내정보 수정 (그 외 업로드)
	@PutMapping
	public String editProcess1(@RequestBody MemberInfo memberInfo) {

		System.out.println("editProcess1" + memberInfo);
		int cnt = mypageService.editProcess(memberInfo);

		return cnt > 0 ? "success" : "fail";
	}
	
	// 회원탈퇴
	@DeleteMapping
	public String deleteMem(@RequestBody MemberInfo memberInfo) {
		
		System.out.println("deleteMemCon"+memberInfo.getId());
		int cnt = mypageService.deleteMem(memberInfo.getId());

		return cnt > 0 ? "success" : "fail";
	}

}
