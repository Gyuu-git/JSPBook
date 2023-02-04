<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Directives Tag</title>
</head>
<body>
	<h2>contentType 디렉티브 태그</h2>
	<h4>text/html : 문자와 html 태그로 구성됨</h4>
	<h4>charset=UTF-8 : 문자 인코딩</h4>
	<h4>language="java" : 프로그래밍 언어는 java</h4>
	<h1><%=session.getAttribute("now") %></h1>
</body>
</html>