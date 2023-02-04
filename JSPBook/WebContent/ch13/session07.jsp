<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Session</title>
</head>
<body>
	<h4>---------- 세션 유효 시간 변경 전 ----------</h4>
	<%
		// 세션에 설정된 유효 시간(기본 1800초(30분))
		int time = session.getMaxInactiveInterval();	// 초단위
		out.print("<p>세션 유효 시간 : " + time + "초</p>");
	%>
	<h4>---------- 세션 유효 시간 변경 후 ----------</h4>
	<%
		// 세션 유효 시간을 60 * 60(3600초 : 1시간)으로 설정
		session.setMaxInactiveInterval(60*60);	// 3600초
		
		time = session.getMaxInactiveInterval();
		out.print("<p>세션 유효 시간 : " + time + "초</p>");
	%>
</body>
</html>