<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Implicit Objects</title>
</head>
<body>
	<%
		out.print("오늘의 날짜 및 시각 : <br>");
		out.print(Calendar.getInstance().getTime());
	%>
</body>
</html>