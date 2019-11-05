<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%
	session.removeAttribute("id");
	session.removeAttribute("idx");
	session.removeAttribute("name");
	session.removeAttribute("photo_name");
	session.removeAttribute("ver");
	session.removeAttribute("gender");
	session.removeAttribute("kakao");
	
	
	 String a = (String) session.getAttribute("id");
	String b = (String) session.getAttribute("idx");
	String c = (String) session.getAttribute("name");
	String d = (String) session.getAttribute("photo_name");
	String e = (String) session.getAttribute("ver");
	String f = (String) session.getAttribute("kakao");
	String g = (String) session.getAttribute("gender");

	
	
	System.out.println("id세션 >>>>> " + a);
	System.out.println("idx >>>>> " + b);
	System.out.println("name >>>>> " + c);
	System.out.println("사진 >>>>> " + d);
	System.out.println("여부 >>>>> " + e);
	System.out.println("로그아웃됨"); 
	System.out.println("kaka"+f); 
	System.out.println("gender"+g); 
	response.sendRedirect("/toti/main");
%>