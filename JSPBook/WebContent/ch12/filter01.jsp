<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Filter</title>
</head>
<body>

<!-- /ch12/filter01_process.jsp?name=개똥이 -->
<form action="filter01_process.jsp" method="post">
	<p>이름 : <input type="text" name="name" /></p>
	<p><input type="submit" value="전송" /></p>
</form>

</body>
</html> 