<%@page import="java.math.BigDecimal"%>
<%@page import="kr.or.ddit.vo.ProductVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<title>주문 정보</title>
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
	
	<!-- --------------------- 주문정보 시작 --------------------- -->
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문정보</h1>
		</div>
	</div>
	<div class="container col-8 alert alert-info">
		<div class="text-center">
			<h1>영수증</h1>
		</div>
		<!-- 고객 정보 시작 : cookie사용 -->
		<div class="row justify-content-between">
			<strong>배송 주소</strong>
			성명 : <%=Shipping_name%><br />
			우편번호 : <%=Shipping_zipCode%><br />
			주소 : <%=Shipping_addressName%>&nbsp;<%=Shipping_country%>
		</div>
		<div class="col-4" align="right">
			<p>
				<em>배송일 : <%=Shipping_shippingDate%></em>
			</p>
		</div>
		<!-- 고객 정보  끝  : cookie사용 -->
		<!-- 상품 정보 시작 : session 사용 -->
		<div>
			<table class="table table-hover">
				<tr>
					<th class="text-center">상품명</th>
					<th class="text-center">#</th>
					<th class="text-center">가격</th>
					<th class="text-center">소계</th>
				</tr>
				<%
					// 세션의 이름인 cartlist를 통해 ProductVO타입의 상품목록을 가져와보자
					ArrayList<ProductVO> cartList = (ArrayList<ProductVO>) session.getAttribute("cartlist");
					double sum = 0;
					
					// 상품 목록을 하나씩 출력해보자
					for(int i = 0; i < cartList.size(); i++){
						ProductVO product = cartList.get(i);
						// 얼마짜리를 몇 개 샀니? => 금액(가격 * 수량)
						double total = product.getUnitPrice() * product.getQuantity();
						sum += total;
						
						BigDecimal totalBig = new BigDecimal(total);
					%>
						<tr>
							<td class="text-center"><em><%=product.getPname() %></em></td>
							<td class="text-center"><%=product.getQuantity() %></td>
							<td class="text-center"><%=new BigDecimal(product.getUnitPrice()) %></td>
							<td class="text-center"><%=totalBig %></td>
						</tr>
					<%
					} // end for
				%>
				<tr>
					<td></td>
					<td></td>
					<td class="text-right"><strong>총액 : </strong></td>
					<td class="text-center text-danger"><strong><%=new BigDecimal(sum) %></strong></td>
				</tr>
			</table>
			<a href="shippingInfo.jsp?cartId=<%=Shipping_cartId %>" 
					class="btn btn-secondary" role="button">이전</a>
			<a href="thankCustomer.jsp" 
					class="btn btn-secondary" role="button">주문완료</a>
			<a href="checkOutCancelled.jsp" 
					class="btn btn-secondary" role="button">취소</a>
		</div>
		<!-- 상품 정보  끝  : session 사용 -->
	</div>
	<!-- --------------------- 주문정보  끝  --------------------- -->
	<jsp:include page="footer.jsp" />
</body>
</html>