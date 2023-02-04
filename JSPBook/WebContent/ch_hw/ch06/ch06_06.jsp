<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>ch06 form_06</title>
</head>
<body>

<form action="ch06_06process.jsp" method="post">

	오렌지<input type="checkbox" class="fruits" name="fruits" value="Orange"/>
	사과<input type="checkbox" class="fruits" name="fruits" value="Apple"/>
	바나나<input type="checkbox" class="fruits" name="fruits" value="Banana"/>
	
	<input type="submit" value="전송" />
</form>

</body>
</html>