<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Scripting Tag</title>
</head>
<body>
<h2>선언문 태그 연습</h2>
<%!
	int sum(int a, int b){
		return a + b;
	}
%>
<%	
	// sum이라는 전역 메소드를 호출(두 개의 파라미터를 전달)
	// out : JSP에서 제공해주는 기본 객체
	out.print("2 + 3 = " + sum(2,3));
%>
</body>
</html>