<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h3>선택한 과일</h3>

<%
	request.setCharacterEncoding("utf-8");

	String[] fruits = request.getParameterValues("fruits");
%>
<%=Arrays.toString(fruits)%>