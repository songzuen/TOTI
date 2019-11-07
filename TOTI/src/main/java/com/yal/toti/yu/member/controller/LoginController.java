package com.yal.toti.yu.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yal.toti.yu.member.domain.KakaoLoginInfo;
import com.yal.toti.yu.member.domain.MemberInfo;
import com.yal.toti.yu.member.service.LoginService;


@RestController
@CrossOrigin
@RequestMapping(value = "/member/login")
public class LoginController {

	@Autowired
	private LoginService loginService;

	@PostMapping
	public Map<String, String> login(HttpServletRequest request, @RequestParam("id") String id,
			@RequestParam("pw") String pw) {

		int cnt = loginService.login(id, pw, request);
		MemberInfo mi = loginService.member(id);
		
		String name = "";
		String photo_name="";
		String idxstr = "";
		String ver = "";
		String gender="";
		
		idxstr =  String.valueOf(mi.getIdx());
		name = mi.getName();
		photo_name = mi.getPhoto_name();
		ver = mi.getVer();
		gender = mi.getGender();
		
		String view = "";
		Map<String, String> maps = new HashMap<String, String>();

		if (cnt == 1) {
			// 1. �씤利� 泥섎━�맖 -> 硫붿씤 �솕硫댁쑝濡�
			view = "success";
			maps.put("name", name);
			maps.put("photo_name", photo_name);
			maps.put("id", id);
			maps.put("idxstr", idxstr);
			maps.put("ver", ver);
			maps.put("gender", gender);
			maps.put("view", view);
		} else if (cnt == 2) {
			// 2. 誘몄씤利� �쉶�썝 -> �씠硫붿씪 �떎�떆 蹂대궡湲�
			view = "undefined";
			maps.put("id", null);
			maps.put("view", view);
		} else if (cnt == 3) {
			// 3. 濡쒓렇�씤 �떎�뙣 -> loginFail �럹�씠吏�
			view = "loginfail";
			maps.put("id", null);
			maps.put("view", view);
		}
		
		int idx =  Integer.parseInt(idxstr);
		
		System.out.println("idx="+idx);
		System.out.println("ver="+ver);

		/* return new ResponseEntity<String>(cnt>0?"success":"fail", HttpStatus.OK); */
		// return new ResponseEntity<String>(view, HttpStatus.OK);
		return maps;
	}
	@PostMapping("/kakao")
	public String kakaoLogin(KakaoLoginInfo kakaoLoginInfo) {
		
		
		
		return null;
	}

	  //移댁뭅�삤�넚 愿��젴 濡쒓렇�븘�썐 硫붿냼�뱶
    @RequestMapping("kakao_logout.do")
    public String kakao_logout(HttpSession session, HttpServletRequest request) {
        
        //�꽭�뀡�뿉 �떞湲닿컪 珥덇린�솕
        session.invalidate();
        
        return "home";
    }


}
