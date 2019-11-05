<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%
	
	session.removeAttribute("tortee");
	
	session.setAttribute("tortee", "Y");
	
	String tortee = (String) session.getAttribute("tortee");
	
	
	
	System.out.println("tortee gomen>>>>> " + tortee);
	
	response.sendRedirect("/toti/main");
%>
