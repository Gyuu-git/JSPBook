<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Welcome</title>
<link rel="stylesheet" href="/css/bootstrap.min.css"/>
</head>
<body>
	<%@ include file="menu.jsp" %>
	
	<%!	// 선언문
		// 전역변수
		String greeting = "Welcome to JSG's Web Shopping Mall";
		String tagLine = "Welcome to Web Market.";
	%>
	<!-- 표현문 -->
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"><%=greeting %></h1>
		</div>
	</div>
	<main role="main">
		<div class="container">
			<div class="text-center">
				<h3><%=tagLine %></h3>
				<%	// 스크립틀릿
					// 1초마다 페이지를 갱신(새로고침)
					response.setIntHeader("Refresh", 1);
					Date day = new Date();
					String am_pm;
					int hour = day.getHours();		// 시
					int minute = day.getMinutes();	// 분
					int second = day.getSeconds();	// 초
					
					if(hour / 12 == 0){
						am_pm = "am";
					}
					else{
						am_pm = "pm";
						if(hour != 12)
							hour -= 12;
					}
					
					String ct = am_pm + " " + hour + " : " + minute + " : " + second;
					out.print("현재 접속 시각 : " + ct + "<br />");
				%>
			</div>
		</div>
	</main>

	<%@ include file="footer.jsp" %>
</body>
</html>