<%@page import="java.math.BigDecimal"%>
<%@page import="kr.or.ddit.vo.ProductVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<title>주문 완료</title>
</head>
<body>
<%
	String Shipping_name = "";
	String Shipping_zipCode = "";
	String Shipping_country = "";
	String Shipping_addressName = "";
	String Shipping_shippingDate = "";
	String Shipping_cartId = "";
	
	Cookie[] cookies = request.getCookies();
	// 쿠키의 개수만큼 반복
	for(int i = 0; i < cookies.length; i++){
		Cookie thisCookie = cookies[i];
		
		if(thisCookie.getName().equals("Shipping_name")){
	         Shipping_name = thisCookie.getValue();
		}
		if(thisCookie.getName().equals("Shipping_zipCode")){
		   Shipping_zipCode = thisCookie.getValue();
		}
		if(thisCookie.getName().equals("Shipping_country")){
		   Shipping_country = thisCookie.getValue();
		}
		if(thisCookie.getName().equals("Shipping_addressName")){
		   Shipping_addressName = thisCookie.getValue();
		}
		if(thisCookie.getName().equals("Shipping_shippingDate")){
		   Shipping_shippingDate = thisCookie.getValue();
		}
		if(thisCookie.getName().equals("Shipping_cartId")){
		   Shipping_cartId = thisCookie.getValue();
		}
	}
%>
	<!-- include 액션 태그 -->
	<jsp:include page="/menu.jsp" />
	
	<!-- --------------------- 주문완료 시작 --------------------- -->
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문완료</h1>
		</div>
	</div>
	
	<div class="container">
		<h2 class="alert alert-danger">주문해주셔서 감사합니다.</h2>
		<p>주문은 <%=Shipping_shippingDate %>에 배송될 예정입니다.</p>
		<p>주문번호 : <%=Shipping_cartId %></p>
	</div>
	
	<div class="container">
		<p><a href="products.jsp" class="btn btn-secondary">&laquo;상품 목록</a></p>
	</div>
	<!-- --------------------- 주문완료  끝  --------------------- -->
	<jsp:include page="footer.jsp" />
	
<%
	// 세션의 정보를 제거
	// 	session.invalidate();
	session.removeAttribute("cartlist");

	// 쿠키의 유효기간을 0으로 설정
	for (int i = 0; i < cookies.length; i++) {
		Cookie thisCookie = cookies[i];
		//쿠키 이름 가져옴
// 		out.print(thisCookie.getName() + "<br />");
		//쿠키 값 가져옴
// 		out.print(thisCookie.getValue()+"<br />");

		//유효기간을 0으로 설정 => 쿠키 정보 삭제
		if (thisCookie.getName().equals("Shipping_name")) {
			thisCookie.setMaxAge(0);
		}
		if (thisCookie.getName().equals("Shipping_zipCode")) {
			thisCookie.setMaxAge(0);
		}
		if (thisCookie.getName().equals("Shipping_country")) {
			thisCookie.setMaxAge(0);
		}
		if (thisCookie.getName().equals("Shipping_addressName")) {
			thisCookie.setMaxAge(0);
		}
		if (thisCookie.getName().equals("Shipping_shippingDate")) {
			thisCookie.setMaxAge(0);
		}
		if (thisCookie.getName().equals("Shipping_cartId")) {
			thisCookie.setMaxAge(0);
		}

		response.addCookie(thisCookie);
	}
%>
</body>
</html>