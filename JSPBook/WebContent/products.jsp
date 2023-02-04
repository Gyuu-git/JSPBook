<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="kr.or.ddit.dao.ProductRepository"%>
<%@ page import="kr.or.ddit.vo.ProductVO"%>
<%@ page import="java.util.List"%>
<%	// 스크립틀릿
	// ProductRepository() 생성자
	// 기본 생성자. 3개의 상품 정보를 가져옴
	// 그런 후 ProductVO 객체 타입의 List인 listOfProducts 변수에 저장
	ProductRepository productDAO = ProductRepository.getInstance();
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/bootstrap.min.css" />
<title>상품 목록</title>
</head>
<body>
	<!-- include 액션 태그 -->
	<jsp:include page="menu.jsp" />

	<!-- ------------ 상품 목록 시작 ------------ -->
	<div class="jumbotron">
		<!-- container : 이 안에 내용있다. -->
		<div class="container">
			<h1 class="display-3">상품 목록</h1>
		</div>
	</div>
	<!-- ------------ 상품 목록 끝 ------------ -->
	<%	// 스크립틀릿
		List<ProductVO> listOfProducts = productDAO.getAllProducts();
		
// 		out.print("listOfProducts : " + listOfProducts);
	%>
	<!-- 표현문 -->
	<c:set var="listOfProducts" value="<%=listOfProducts %>" />
	
	<div class="container">
		<!-- 행 별 처리 -->
		<div class="row" align="center">
			<!-- 1칸씩 반복 -->
			<c:forEach var="productVO" items="${listOfProducts}">
				<div class="col-md-4">
					<img src="/images/${productVO.filename}" style="width:100%;" alt="${productVO.pname}" title="${productVO.pname}" />
					<h3>${productVO.pname}</h3>
					<p>${productVO.description}</p>
					<p>${productVO.unitPrice}</p>
					<p><a href="product.jsp?id=${productVO.productId}" 
					class="btn btn-secondary" role="button">상세정보&raquo;</a></p>
				</div>
			</c:forEach>
		</div>
		<%
		// admin 권한을 가지고 있는 사용자만 등록 버튼이 보이도록 처리
		if(request.isUserInRole("admin")){
		%>
		<div class="form-group row">
			<div class="col-sm-offset-2 col-sm-10">
				<a href="addProduct.jsp" class="btn btn-primary" >등록</a>
			</div>
		</div>
		<%
		}
		%>
	</div>
	<!-- footer -->
	<jsp:include page="footer.jsp" />
</body>
</html>