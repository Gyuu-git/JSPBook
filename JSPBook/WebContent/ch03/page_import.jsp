<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<title>Directives Tag</title>
</head>
<body>
	Today is <%=new Date() %>
	<%
		// 세션 내장 객체의 now 이름 속석의 값으로 현재 시각을 넣어줌
		session.setAttribute("now", new Date());
	%>
</body>
</html>