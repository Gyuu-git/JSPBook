<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<title>상품 아이디 오류</title>
</head>
<body>
	<!-- include 액션 태그 -->
	<jsp:include page="/menu.jsp" />
	
	<!-- -------------------- 예외 처리 시작 --------------------- -->
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">해당 상품이 존재하지 않습니다.</h1>
		</div>
	</div>
	
	<div class="container">
		<!-- 
			request.getRequestURL() : 해당 오류 페이지의 주소
			request.getQueryString() : 요청 파라미터 정보
		-->
		<p><%=request.getRequestURL() %>?<%=request.getQueryString() %></p>
		<p><a href="products.jsp" class="btn btn-secondary">상품 목록&raquo;</a></p>
	</div>
	
	<jsp:include page="footer.jsp" />
</body>
</html>