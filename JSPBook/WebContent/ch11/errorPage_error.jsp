<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>
<!-- isErrorPage : 현재 본 jsp 페이지는 오류처리 페이지이다. 기본이 false -->
<!DOCTYPE html>
<html>
<head>
<title>Exception</title>
</head>
<body>
	<p>오류가 발생했습니다</p>
	<!-- p. 361 -->
	<!-- exception : JSP에서 제공해주는 오류 처리용 기본 내장 객체 -->
	<p>예외 유형 : <%=exception.toString()%></p>
	<p>예외 유형 : <%=exception.getClass().getName()%></p>
	<p>오류 메시지 : <%=exception.getMessage()%></p>
</body>
</html>















