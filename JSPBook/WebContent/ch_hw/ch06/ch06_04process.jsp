<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	String mail = request.getParameter("mail");
%>
<p>name : <%=name%></p>
<p>addr : <%=addr%></p>
<p>mail : <%=mail%></p>