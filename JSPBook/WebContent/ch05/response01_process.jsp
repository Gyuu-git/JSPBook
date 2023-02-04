<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Implicit Objects</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	// userid값이 a001이면서 동시에 pw 값이 java인 경우
	if(id.equals("a001") && pw.equals("java")){
		//		response01_success.jsp로 강제 재요청
		response.sendRedirect("response01_success.jsp");
	}else{	// 그렇지 않다면	
		//		response01_failed.jsp로 강제 재요청
		response.sendRedirect("response01_failed.jsp");
	}
%>
</body>
</html>