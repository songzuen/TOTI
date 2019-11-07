<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%
	String id = request.getParameter("id");
 	String idxstr = request.getParameter("idxstr");
	String name = request.getParameter("name");
	String photo_name = request.getParameter("photo_name");
	String ver = request.getParameter("ver");
	String gender = request.getParameter("gender");
	
	
    System.out.println(ver);
    System.out.println(id);
 	
	int idx = Integer.parseInt(idxstr);
	
	
	session.setAttribute("id", id); 
	session.setAttribute("idx", idx);
	session.setAttribute("name", name); 
	session.setAttribute("photo_name", photo_name);
	session.setAttribute("ver", ver);
	session.setAttribute("tortee", "N");
	session.setAttribute("gender", gender);

	
	String id1 = (String)session.getAttribute("id");
    String ver1 = (String)session.getAttribute("ver");
    String tortee = (String)session.getAttribute("tortee");
    
    
    System.out.println("session.getAttribute >>>>> "+ver1);
  	System.out.println("tortee >>>>> "+tortee);
	
	
%>