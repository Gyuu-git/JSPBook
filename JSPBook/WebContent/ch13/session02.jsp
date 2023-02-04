<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Session</title>
</head>
<body>
<%
	// session.setAttribute("userID", "admin");
	// session.setAttribute("userPW", "1234");
	
	// session은 동일한 웹브라우저 내에서 정보가 공유됨
	// getAttribute()메소드의 리턴타입은 Object
	String user_id = (String) session.getAttribute("userID");
	String user_pw = (String) session.getAttribute("userPW");

	// application은 웹브라우저 내에서 정보가 공유됨
	// getAttribute()메소드의 리턴타입은 Object
	String user_id2 = (String) application.getAttribute("userID");
	String user_pw2 = (String) application.getAttribute("userPW");
	
	out.print("<p>설정된 세션의 속성 값 [1] : " + user_id + "</p>");
	out.print("<p>설정된 세션의 속성 값 [2] : " + user_pw + "</p>");
	out.print("<hr />");
	out.print("<p>설정된 세션의 속성 값 [1] : " + user_id2 + "</p>");
	out.print("<p>설정된 세션의 속성 값 [2] : " + user_pw2 + "</p>");
%>
</body>
</html>