<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// 로그인 인증 실패 시 강제 이동
	// response 내장 객체
	// error=1 요청 파라미터
	response.sendRedirect("login.jsp?error=1");
%>