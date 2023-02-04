<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Session</title>
</head>
<body>

<%
	String session_id = session.getId();
	// 새로고침할 때마다 변함
	long last_time = session.getLastAccessedTime();
	// 세션이 생성된 시간은 새로고침해도 변하지 않음
	// 웹 브라우저를 모두 닫고 다시 열어야 변함
	// 1970년 1월 1일 0시 0분 0초부터 현재 세션이 생성된 시간까지 경과한 시간을
	// 1/1000초 값으로 반환
	long start_time = session.getCreationTime();
	start_time *= 1000;	// 초
	long used_time = (last_time - start_time)/6000;
%>
<p>세션 아이디 : <%=session_id %></p>
<p>요청 마지막 시간 : <%=last_time %></p>
<p>요청 시작 시간 : <%=start_time %></p>
<p>웹 사이트에 머문 시간 : <%=used_time %></p>

</body>
</html>