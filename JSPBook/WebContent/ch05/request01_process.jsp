<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Implicit Object(내장 객체)</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("passwd");
		
		// 헤더(부수적인 정보를 담고 있음)에 있는 host라는 name에 매핑되어 있는 값을 보자
		String hostValue = request.getHeader("host");
		
		// 헤더이 있는 accept-language라는 name에 매핑되어 있는 값을 보자
		String alValue = request.getHeader("accept-language");
	%>
	<p>아이디 : <%=id %></p>
	<p>비밀번호 : <%=pw %></p>
	<p>호스트명 : <%=hostValue %></p>
	<p>설정된 언어 : <%=alValue %></p>
</body>
</html>