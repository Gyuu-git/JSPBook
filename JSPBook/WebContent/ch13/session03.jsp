<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Session</title>
</head>
<body>
<%
	/*	다중 세션 정보 얻기
		- session.getAttributeNames()
		- 세션에 저장된 여러 개의 세션 속성 이름들을 Enumeration 객체 타입으로 리턴해줌
	*/
	Enumeration en = session.getAttributeNames();

	String name = "";
	String value = "";

	out.print("<p>en : " + en + "</p>");

	// session.setAttribute("userID", user_id);
	// session.setAttribute("userPW", user_pw);
	// hasMoreElements() : 세션 속성 이름이 있을때까지만 반복
	while(en.hasMoreElements()){
		// 세션 속성 이름
		name = en.nextElement().toString();
		out.print("<p>name : " + name + "</p>");
		// 그 속성 이름에 매핑되어 있는 값
// 		value = (String) session.getAttribute(name);
		value = session.getAttribute(name).toString();
		out.print("<p>value : " + value + "</p>");
	}
%>
</body>
</html>