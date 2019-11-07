<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%
	String id = request.getParameter("id");
	
	String kakao = request.getParameter("kakao");


	System.out.println("request.getParameter1 >>>>> "+id);
	System.out.println("request.getParameter2 >>>>> "+kakao);
	
	session.setAttribute("id", id);
	session.setAttribute("kakao", kakao);
	
	String id1 = (String) session.getAttribute("id");
	String kakao1 = (String) session.getAttribute("kakao");
	
	System.out.println("session.getAttribute >>>>> "+id1);
	System.out.println("session.getAttribute >>>>> "+kakao1);
	
	

	
%>