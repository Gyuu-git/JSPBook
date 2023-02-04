<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Validation02 process</title>
</head>
<body>

	<h3>입력에 성공했습니다.</h3>
	<%
		// validation02_process.jsp?id=a001&passwd=java
		// URL : validation02_process.jsp
		// 요청(http)파라미터(QueryString) : id=a001&passwd=java
		// 한글처리
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("passwd");
	%>
	<p>아이디 : <%=id %></p>
	<p>비밀번호 : <%=pw %></p>

</body>
</html>