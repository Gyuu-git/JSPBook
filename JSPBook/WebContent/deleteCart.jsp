<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// 요청 URI : /deleteCart.jsp?cartId=A3707E7ED15F85C5ACB916F08B43BDB6
	// 요청 파라미터 : cartId=A3707E7ED15F85C5ACB916F08B43BDB6
	
	String id = request.getParameter("cartId");
	// cartId가 없네? => cart.jsp로 이동
	if(id == null || id.trim().equals("")){
		response.sendRedirect("cart.jsp");
		return;
	}
	
	// 장바구니 비우기
	session.removeAttribute("cartlist");	// 세션 한 건만 삭제
	// session.invalidate();	// 모든 세션을 삭제(로그아웃)
	
	// cart.jsp로 이동
	response.sendRedirect("cart.jsp");
%>