<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>ch06 form_05</title>
<style>
div, button{
	margin: 15px;
}
</style>
</head>
<body>

<form action="ch06_05process.jsp" method="post">
	<div>
		<label>이름 : </label>
		<input type="text" name="name" />
	</div>
	<div>
		<label>주소 : </label>
		<input type="text" name="addr" />
	</div>
	<div>
		<label>이메일 : </label>
		<input type="text" name="mail" />
	</div>
	
	<button type="submit" >전송</button>
</form>

</body>
</html>