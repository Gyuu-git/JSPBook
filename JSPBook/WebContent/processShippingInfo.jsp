<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
	
	// 요청 파라미터 정보들을 쿠키에 넣음
	Cookie cartId = new Cookie("Shipping_cartId", request.getParameter("cartId"));
	Cookie name = new Cookie("Shipping_name", request.getParameter("name"));
	Cookie shippingDate = new Cookie("Shipping_shippingDate", request.getParameter("shippingDate"));
	Cookie country = new Cookie("Shipping_country", request.getParameter("country"));
	Cookie zipCode = new Cookie("Shipping_zipCode", request.getParameter("zipCode"));
	Cookie addressName = new Cookie("Shipping_addressName", request.getParameter("addressName"));
	
	// 유효기간을 1일로 설정(초단위)
	cartId.setMaxAge(24 * 60 * 60);
	name.setMaxAge(24 * 60 * 60);
	shippingDate.setMaxAge(24 * 60 * 60);
	country.setMaxAge(24 * 60 * 60);
	zipCode.setMaxAge(24 * 60 * 60);
	addressName.setMaxAge(24 * 60 * 60);
	
	// 생성된 쿠키를 등록
	response.addCookie(cartId);
	response.addCookie(name);
	response.addCookie(shippingDate);
	response.addCookie(country);
	response.addCookie(zipCode);
	response.addCookie(addressName);
	
	out.print("cartId : " + cartId.getValue() + "<br />");
	out.print("name : " + name.getValue() + "<br />");
	out.print("shippingDate : " + shippingDate.getValue() + "<br />");
	out.print("country : " + country.getValue() + "<br />");
	out.print("zipCode : " + zipCode.getValue() + "<br />");
	out.print("addressName : " + addressName.getValue() + "<br />");
	
	// 주문 정보 페이지로 이동
	response.sendRedirect("orderConfirmation.jsp");

%>