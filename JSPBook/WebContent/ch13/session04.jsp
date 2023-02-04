<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Session</title>
</head>
<body>

	<!-- session01.jsp와 session01_process.jsp를 먼저 수행 후 -->
	<!-- 
   session.setAttribute("userID", user_id);   // admin
   session.setAttribute("userPW", user_pw);   // 1234
   session.setAttribute("userHP", "010-123-1234");   // 010-123-1234
 -->
	<!-- P.430 -->
	<h4>-----세션 삭제 전-----</h4>
	<%	//스크립틀릿
// 	String user_id = (String)session.getAttribute("userID");   // admin
// 	String user_pw = (String)session.getAttribute("userPW");   // 1234
// 	String user_hp = (String)session.getAttribute("userHP");   // 010-123-1234

//    out.print("설정된 세션 이름 userID : " + user_id + "<br />");   // admin
//    out.print("설정된 세션 이름 userPW : " + user_pw + "<br />");   // 1234
//    out.print("설정된 세션 번호 userHP : " + user_hp + "<br />");   // 010-123-1234

	Enumeration en = session.getAttributeNames();
	while (en.hasMoreElements()) {
		String name = en.nextElement().toString();
		String value = (String) session.getAttribute(name);

		out.print("설정된 세션 이름 " + name + " : " + value + "<br />");
	}

	//잘 안씀
// 	session.removeAttribute("userHP");
	//**********
	// 로그아웃 : 세션의 모든 속성명 제거
	session.invalidate();
	%>
	<h4>-----세션 삭제 후-----</h4>
	<%
		//스크립틀릿
	// 	user_id = (String)session.getAttribute("userID");   // admin
	// 	user_pw = (String)session.getAttribute("userPW");   // 1234
	// 	user_hp = (String)session.getAttribute("userHP");   // 010-123-1234

	// 	out.print("설정된 세션 이름 userID : " + user_id + "<br />");   // admin
	// 	out.print("설정된 세션 이름 userPW : " + user_pw + "<br />");   // 1234
	// 	out.print("설정된 세션 번호 userHP : " + user_hp + "<br />");   // 010-123-1234

	// 세션의 모든 속성이 사라져서 에러발생
// 	en = session.getAttributeNames();
// 	while (en.hasMoreElements()) {
// 		String name = en.nextElement().toString();
// 		String value = (String) session.getAttribute(name);

// 		out.print("설정된 세션 이름 " + name + " : " + value + "<br />");
// 	}
	%>
	<script type="text/javascript">
	let a = function() {
		location.href="/ch13/session01.jsp";
	};
	// 5초 후에 이동
	setTimeout(a, 5000);
	</script>

</body>
</html>