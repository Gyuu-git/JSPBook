<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");

	Enumeration paramNames = request.getParameterNames();
	while (paramNames.hasMoreElements()){
		String name = (String) paramNames.nextElement();
		String paramValue = request.getParameter(name);
		
		out.print("<p>" + name + " : " + paramValue + "</p>");
	}
%>