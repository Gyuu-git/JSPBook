<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Scripting Tag</title>
</head>
<body>
<%
	// 지역변수 a, b, sum => 서블릿 
	//			=> scriptlet01_jsp.java의 (..Service메서드)에서만 사용됨
	// 선언과 동시에 값을 할당 => 초기화
	int a = 2;
	int b = 3;
	int sum = a + b;
	
	// JSP 기본 객체인 out 객체의 print메서드를 이용하여 화면에 출력
	out.print("<p>2 + 3 = " + sum + "<br /></p>");
%>
<p><%=sum %></p>
</body>
</html>