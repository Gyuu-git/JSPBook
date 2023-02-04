<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Cookie</title>
</head>
<body>
<%
// name은 userID, value는 jsg
// Cookie cookie_id = new Cookie("userID", user_id);
// name은 userPW, value는 java
// Cookie cookie_pw = new Cookie("userPW", user_pw);

// request 객체에 들어있는 모든 쿠키 정보를 가져와보자
Cookie[] cookies = request.getCookies();
out.print("현재 설정된 쿠키의 개수 : " + cookies.length + "<br />");
out.print("<hr />");

for(int i = 0; i < cookies.length; i++){
	out.print("쿠키[" + i + "] : " + cookies[i] + "<br />");
	// 쿠키 속성 이름
	out.print("설정된 쿠키의 속성 이름 [" + i + "] : " + cookies[i].getName() + "<br />");
	// 쿠키 속성 값
	out.print("설정된 쿠키의 속성 값 [" + i + "] : " + cookies[i].getValue() + "<br />");
	
	out.print("------------------------<br />");
}
out.print("세션id : " + session.getId() + "<br />");
%>
</body>
</html>