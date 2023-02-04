<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Directives Tag</title>
</head>
<body>
	<!-- include 디렉티브(골뱅이) -->
	<%@ include file="header.jsp" %>

	<h4>-----현재 페이지 영역(01)-----</h4>

	<!-- include 디렉티브 태그는 정적(파라미터 X) -->
	<%@ include file="footer.jsp" %>
	
	<!-- 
		include 액션태그
			>> include 디렉티브 태그와 같다.
		include 태그 안에 주석 X
	 -->
	<!-- include 액션태그는 동적(파라미터 O) -->
	<!-- footer.jsp?id=a001&alias=gdi -->
	<jsp:include page="footer.jsp">
		<jsp:param name="id" value="a001"/>
		<jsp:param name="alias" value="gdi"/>
	</jsp:include>
</body>
</html>