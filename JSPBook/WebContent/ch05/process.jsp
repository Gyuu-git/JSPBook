<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Implicit Objects(내장 객체)</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
%>
	<!-- 표현문 -->
	<p>이름 : <%=name %></p>
	<p>요청 정보 길이 : <%=request.getContentLength() %></p>
	<p>클라이언트 전송 방식(method가 post/get/put) : <%=request.getMethod() %></p>
	<p>요청 URI : <%=request.getRequestURI() %></p>
	<p>서버 이름 : <%=request.getServerName() %></p>
	<p>서버 포트 : <%=request.getServerPort() %></p>
</body>
</html>