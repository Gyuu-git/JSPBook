<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Exception</title>
</head>
<body>

<!-- tryCatch_process.jsp
	dispatcher.forward(request, response);
	전달받은 request객체를 사용할 수 있음
-->
<p>잘못된 데이터가 입력되었습니다.</p>
<p>숫자1 : <%=request.getParameter("num1") %></p>
<p>숫자2 : <%=request.getParameter("num2") %></p>

</body>
</html>