<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Implicit Objects(내장 객체)</title>
</head>
<body>
	<!-- 폼 요소(태그) -->
	<!-- process.jsp?name=개똥이
		process.jsp : URL
		name=개똥이 : 요청파라미터(HTTP파라미터, 쿼리스트링)
	 -->
	<form action="process.jsp" method="post">
		<p>
			이름: <input type="text" name="name" />
			<input type="submit" value="전송" />
		</p>
	</form>
</body>
</html>