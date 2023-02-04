<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Implicit Objects</title>
</head>
<body>
 	<form action="response01_process.jsp" method="post">
 		<p>아이디 : <input type="text" name="id" required /></p>
 		<p>비밀번호 : <input type="password" name="pw" required /></p>
 		<p><input type="submit" value="전송" /></p>
 	</form>
</body>
</html>