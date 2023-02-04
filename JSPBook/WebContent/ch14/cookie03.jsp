<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Cookie</title>
</head>
<body>
<%
	// 요청시마다 쿠키를 함께 보냄. 쿠키는 request 객체에 감김
	Cookie[] cookies = request.getCookies();
	// [0]cookies : userID
	// [1]cookies : userPW
	// [2]cookies : JSESSIONID(영향이 없음)
	for(int i = 0; i < cookies.length; i++){
		// 모든 쿠키를 삭제
		cookies[i].setMaxAge(0);
		response.addCookie(cookies[i]);
	}
	response.sendRedirect("cookie02.jsp");
%>
</body>
</html>