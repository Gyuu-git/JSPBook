<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<title>Scripting Tag</title>
</head>
<body>
<p>
	Today's date : 
	<%	// 스크립틀릿
		out.print("<p>" + new java.util.Date() + "</p>");
	%>
	<!-- 표현문 -->
	<%=new Date() %>
</body>
</html>