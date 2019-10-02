<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	session.removeAttribute("id");
	session.removeAttribute("idx");
	session.removeAttribute("name");
	session.removeAttribute("photo_name");
	
	String a = (String) session.getAttribute("id");
	String b = (String) session.getAttribute("idx");
	String c = (String) session.getAttribute("name");
	String d = (String) session.getAttribute("photo_name");
	
	response.sendRedirect("/toti/main");
	
%>