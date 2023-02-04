<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Cookie</title>
</head>
<body>
<!-- 폼 페이지 
	요청 URI : cookie01_process.jsp?id=jsg&pw=java
	요청 파라미터 : id=jsg&pw=java
	방식 : post
-->
<form action="cookie01_process.jsp" method="post">
	<!-- 폼 데이터 -->
	<p>아이디 : <input type="text" name="id" /></p>
	<p>비밀번호 : <input type="text" name="pw" /></p>
	<p><input type="submit" value="전송" /></p>
</form>

</body>
</html>