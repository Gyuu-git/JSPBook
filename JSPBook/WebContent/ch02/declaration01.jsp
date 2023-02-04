<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Scripting Tag</title>
</head>
<body>
<h2>선언문 태그 연습</h2>
<!-- 정수형 전역 변수 data에 50을 할당(대입) -->
<%! int data = 50; %>

<%	// 스크립틀릿 태그 작성
	out.print("Value of the variable is : " + data);
%>
</body>
</html>