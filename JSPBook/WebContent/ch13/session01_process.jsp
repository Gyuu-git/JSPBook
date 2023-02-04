<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Session</title>
</head>
<body>
<!-- 폼 페이지 
	요청 URL : session01_process.jsp
	요청 파라미터 : {"id" : "a001", "pw" : "java"}
-->
<%
	String user_id = request.getParameter("id");
	String user_pw = request.getParameter("pw");
	
	// JSP에는 session 기본 내장 객체가 있음(scope은 session영역)
	if("admin".equals(user_id) && "1234".equals(user_pw)){
		// jsp에서...
		session.setAttribute("userID", user_id);
		session.setAttribute("userPW", user_pw);
		session.setAttribute("userHP", "010-123-1234");
		
		// application 내장 객체. 웹브라우저에서 정보 공유
		application.setAttribute("userID", user_id);
		application.setAttribute("userPW", user_pw);
		
		// request 기본 객체의 getSession() 메소드를 사용하여 session 객체 생성 가능
		// 서블릿(java)에서..
// 		HttpSession httpSession = request.getSession();
// 		httpSession.setAttribute("userID", user_id);
// 		httpSession.setAttribute("userPW", user_pw);
		
		out.print("<h2>세션 설정이 성공했습니다.</h2>");
		out.print("<h5>" + user_id + "님 환영합니다.</h5>");
	}else{
		out.print("<h2>세션 설정이 실패했습니다.</h2>");
	}
%>
<p><a href="session02.jsp">세션 정보 확인하기</a></p>
</body>
</html>