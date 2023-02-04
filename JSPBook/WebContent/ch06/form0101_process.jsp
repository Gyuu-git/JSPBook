<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");

	String memId = request.getParameter("memId");
	String password = request.getParameter("password");
	String remember_me = request.getParameter("remember-me");
%>
<p>memId : <%=memId%></p>
<p>passowrd : <%=password%></p>
<p>remember_me : <%=remember_me%></p>