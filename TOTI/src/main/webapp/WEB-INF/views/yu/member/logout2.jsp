<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%
	session.removeAttribute("id");
	
	session.removeAttribute("kakao");
	
	
	response.sendRedirect("/toti/main");
%>