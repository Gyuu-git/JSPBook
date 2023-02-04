<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<title>Exception</title>
</head>
<body>
	<p>오류가 발생했습니다</p>
	<!-- exception객체를 사용하기 위해서는 page디렉티브의 isErrorPage="true" -->
	<p>예외 : <%=exception%></p>
	<!-- exception : JSP에서 제공해주는 오류 처리용 기본 내장 객체 -->
	<p>예외 유형 : <%=exception.toString()%></p>
	<p>예외 유형 : <%=exception.getClass().getName()%></p>
	<p>오류 메시지 : <%=exception.getMessage()%></p>
</body>
</html>