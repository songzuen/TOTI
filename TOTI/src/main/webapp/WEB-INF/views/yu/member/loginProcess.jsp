<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%
	String id = request.getParameter("id");
 	String idxstr = request.getParameter("idxstr");
	String name = request.getParameter("name");
	String photo_name = request.getParameter("photo_name");

 	
	int idx = Integer.parseInt(idxstr);
	
	
	session.setAttribute("id", id); 
	session.setAttribute("idx", idx);
	session.setAttribute("name", name); 
	session.setAttribute("photo_name", photo_name);
	
%>