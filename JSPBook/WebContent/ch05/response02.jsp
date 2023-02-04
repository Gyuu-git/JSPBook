<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Implicit Object</title>
</head>
<body>
	<p>이 페이지는 3초마다 새로고침 됩니다.</p>
	<%
		response.setIntHeader("Refresh", 3);
	%>
	<p><%=new Date().toLocaleString() %></p>
</body>
</html>