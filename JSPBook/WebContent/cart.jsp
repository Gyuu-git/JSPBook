<%@page import="java.text.DecimalFormat"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="kr.or.ddit.vo.ProductVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<title>장바구니</title>
</head>
<body>
<%
	// 세션의 고유 아이디(장바구니 번호)
	String cartId = session.getId();
%>
	<!-- include 액션 태그 -->
	<jsp:include page="/menu.jsp" />
	
	<!-- --------------------- 장바구니 시작 --------------------- -->
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">장바구니</h1>
		</div>
	</div>
	<!-- 장바구니 상세 내역 시작 -->
	<div class="container">
		<div class="row">
			<table width="100%">
				<tr>
					<td align="left">
						<a href="deleteCart.jsp?cartId=<%=cartId %>" class="btn btn-danger">삭제하기</a>
					</td>
					<td align="right">
						<a href="shippingInfoCart.jsp?cartId=<%=cartId %>" class="btn btn-success">주문하기</a>
					</td>
				</tr>
			</table>
		</div>
		
		<!-- 장바구니 출력 시작 -->
		<!-- padding-top : 영역의 위쪽 여백 50픽셀 -->
		<div style="padding-top:50px;">
			<table class="table table-hover">
				<tr>
					<th>상품</th><th>가격</th><th>수량</th><th>금액</th><th>비고</th>
				</tr>
				<%
					ArrayList<ProductVO> cartList = 
							(ArrayList<ProductVO>) session.getAttribute("cartlist");
					// 금액을 누적하는 변수
					double sum = 0;
					
					DecimalFormat df = new DecimalFormat("###,###");
					
					if(cartList == null){
						%>
						<tr style="text-align:center;">
							<td colspan="5" style="text-align:center;">장바구니에 상품이 없습니다.</td>
						</tr>
						<%
					}else{
						// 상품목록(List<ProductVO>)에서 하나씩(ProductVO) 꺼냄
						for(ProductVO product : cartList){
							// 금액 = 가격 * 수량
							double total = product.getUnitPrice() * product.getQuantity();
							// 실수 -> 정수
							BigDecimal priceBig = new BigDecimal(product.getUnitPrice());
							BigDecimal totalBig = new BigDecimal(total);
							
							// 금액 누적
							sum += total;
							%>
							<tr>
								<td><%=product.getProductId() %>-<%=product.getPname() %></td>
								<td><%=df.format(priceBig) %></td>
								<td><%=product.getQuantity() %></td>
								<td><%=df.format(totalBig) %></td>
								<td>삭제</td>
							</tr>
							<%
						} // end for
						// 총액 : 금액의 누적 합계
						BigDecimal sumBig = new BigDecimal(sum);
						%>
						<tr>
							<th></th>
							<th></th>
							<th>총액</th>
							<th><%=df.format(sumBig) %></th>
							<th></th>
						</tr>
						<%
					} // end if
				%>
			</table>
			<a href="products.jsp" class="btn btn-secondary">&laquo;쇼핑 계속하기</a>
		</div>
	</div>
	<!-- --------------------- 장바구니  끝  --------------------- -->

	<jsp:include page="footer.jsp" />
</body>
</html>