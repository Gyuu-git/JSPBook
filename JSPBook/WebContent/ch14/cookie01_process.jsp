<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Cookie</title>
</head>
<body>
<%
	// 요청 URI : cookie01_process.jsp?id=jsg&pw=java
	String user_id = request.getParameter("id");	// jsg
	String user_pw = request.getParameter("pw");	// java
	
	// 아이디가 jsg, 비밀번호 java라면
	if(user_id.equals("jsg") && user_pw.equals("java")){
		// Cookie객체를 생성
		// name은 userID, value는 jsg
		Cookie cookie_id = new Cookie("userID", user_id);
		// name은 userPW, value는 java
		Cookie cookie_pw = new Cookie("userPW", user_pw);
		// 서버에서 쿠키가 생성되어 응답 시
		// response 내장 객체를 통해 쿠키를 클라이언트가 리턴받음
		response.addCookie(cookie_id);
		response.addCookie(cookie_pw);
		out.print("<p>쿠키 설정 성공!</p>");
		out.print("<p>" + user_id + "님 환영!</p>");
	}else{
		out.print("<p>쿠키 설정 실패!</p>");
	}
%>
</body>
</html>