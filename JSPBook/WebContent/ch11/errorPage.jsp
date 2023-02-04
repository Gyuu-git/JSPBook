<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page errorPage="errorPage_error.jsp" %>
<!-- 1) page 디렉티브 태그를 이용한 예외 처리
		errorPage(오류를 처리하는 jsp페이지) / isErrorPage( 속성을 사용
 -->
<!DOCTYPE html>
<html>
<head>
<title>Exception</title>
</head>
<body>
<!-- 예외 처리(Exception) 
 - 프로그램이 처리되는 동안 특정한 문제가 발생했을 때 
 	처리를 중단하고 다른 처리를 하는 것
 	ex) 0으로 나눔, null.toString(), page not found
 		nullpoint exception, array outbound
-->
	<!-- errorPage.jsp?name=apple => APPLE -->
	<!-- errorPage.jsp => 오류발생(null을 대문자 변환 불가) -->
	name 파라미터 : <%=request.getParameter("name").toUpperCase()%>
</body>
</html>















