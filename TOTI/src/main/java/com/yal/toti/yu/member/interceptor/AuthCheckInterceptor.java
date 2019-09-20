package com.yal.toti.yu.member.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthCheckInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		// 세션에 loginInfo 객체가 존재하면 return true
		
		// 현재 요청에서 세션 객체 받기
		HttpSession session = request.getSession(false); // 트루 : 없으면 새로만든다(디폴트가 트루) 펄스 : 안 그런다
		
		// 요건 흐름을 보려고 자세히 써봄
//		if(session != null) {
//			// 세션에서 loginInfo 속성 값을 받아온다.
//			Object auth = session.getAttribute("loginInfo");
//			if (auth != null) {
//				return true;
//			}
//		}
		
		// 더 간단히 해보면
		if(session != null && session.getAttribute("loginInfo") != null) {
			return true;
		}
		
		//루트기준이기때문에 컨텍스트경로를 해줘야
		response.sendRedirect(request.getContextPath()+"/member/login");// ?reffer= 붙여주는 경우도 있는데 나중에 처리해보기로
		
		return false;
	}

}
