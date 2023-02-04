<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>
<!-- isErrorPage : 이 JSP페이지가 오류 페이지인가? 
		false : 아니다
		true : 맞다
-->
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<!-- /images : WebContent > images 폴더 -->
<img src="/images/error.png" width=100%>
<!-- 오류 타입 -->
<%=exception.getClass().getName() %>

<!-- 오류 메시지 -->
<%=exception.getMessage() %><br>	

<%
	exception.printStackTrace(new PrintWriter(out));
%>
</body>
</html>