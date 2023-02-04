<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Exception</title>
</head>
<body>
	<!-- 폼페이지 
	요청URI : exception_process.jsp?num1=12&num2=6
	요청파라미터(HTTP파라미터, QueryString) : num=12&num2=6
	-->
	<form action="exception_process.jsp" method="post">
	<!-- 폼데이터 -->
		<p>숫자1 : <input type="text" name="num1" /></p>
		<p>숫자2 : <input type="text" name="num2" /></p>
		<p><input type="submit" value="나누기" /></p>
	</form>
</body>
</html>












