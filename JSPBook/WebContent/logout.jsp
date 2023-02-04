<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// 로그인 인증을 할 때 웹 브라우저에 저장된 모든 사용자를 삭제
	session.invalidate();
	
	// 로그인 페이지로 강제 이동
	// login.jsp로 바로 보내지 않는 이유는 login.jsp의 action은 
	//		목적지에 갈 수 있는지에 대한 check용도이므로.
	response.sendRedirect("/addProduct.jsp");
%>