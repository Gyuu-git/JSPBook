<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Security</title>
</head>
<body>
	<p>인증 성공했습니다.</p>
	<!-- 사용자명 : role1 -->
	<p>사용자명 : <%=request.getRemoteUser() %></p>
	<!-- 인증방법 : FORM -->
	<p>인증방법 : <%=request.getAuthType() %></p>
	<!-- 로그인 한 사용자가 role1이라는 role(권한)에 속해있는지 체킹
		true/false로 return 됨
		
		역할명 체킹 : true
	-->
<!-- <role rolename= -->
	<p>role1 역할명 체킹 : <%=request.isUserInRole("role1") %></p>
	<p>tomcat 역할명 체킹 : <%=request.isUserInRole("tomcat") %></p>
	<p>manager 역할명 체킹 : <%=request.isUserInRole("manager") %></p>
</body>
</html>