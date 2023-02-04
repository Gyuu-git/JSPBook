<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="kr.or.ddit.dao.ProductRepository"%>
<!-- 
   웹쇼핑몰의 상품정보를 등록하는 페이지
 -->
 <%
 	ProductRepository pr = ProductRepository.getInstance();
 	String p_id = pr.getNextProductId();
 %>
 <!-- scope(영역) : page(pageContext), request, session, applicaion -->
 <c:set var="productId" value="<%=p_id %>" scope="page" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/bootstrap.min.css" />
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="/ckeditor5/ckeditor.js"></script>
<script type="text/javascript" src="/js/jquery-3.6.3.min.js"></script>
<title>상품 등록</title>
<script type="text/javascript">
function checkAddProduct() {
	let prodId = $("input[name='productId']").val();
	let pname = $("input[name='pname']").val();
	let unitPrice = $("input[name='unitPrice']").val();
	let unitsInStock = $("input[name='unitsInStock']").val();
	// input type="file"
	let productImage = $("input[name='productImage']").val();
	
	// [0-9] 대신 \d
	let regExpProdId = /^P\d{4,11}$/;
	// + : 1 이상
	// ? : 아몰랑(있을 수도 있고, 없을 수도 있음)
	let regExpUnitPrice = /^\d+(?:[.]?[\d]?[\d])$/; // 소수점 둘째 자리
	
	// 상품 아이디 체크
	// 1) 첫 글자는 반드시 P로 시작하고 숫자를 조합하여 5~12자리까지 입력하세요.
	// 정규표현식.test(대상문자열)
	if(!regExpProdId.test(prodId)){
		alert("[상품 코드]\n첫 글자는 반드시 P로 시작하고 숫자를 조합하여 5~12자리까지 입력하세요.");
		$("input[name='productId']").focus();
		return false;
	}
	
	// 상품명 체크
	// 2) 최소 4자에서 최대 12자까지 입력하세요.
	if(pname.length < 4 || pname.length > 12){
		alert("[상품명]\n최소 4자에서 최대 12자까지 입력하세요.");
		$('input[name="pname"]').focus();
		return false;
	}
	
	// 상품 가격 체크
	// 3) 숫자만 입력하세요. 음수는 입력할 수 없습니다. 소수점 둘째 자리까지만 입력하세요.
	if(unitPrice.length == 0 || isNaN(unitPrice)){
		alert("[상품 가격]\n숫자만 입력하세요.");
		$('input[name="unitPrice"]').focus();
		return false;
	}
	if(unitPrice < 0){
		alert("[상품 가격]\n음수는 입력할 수 없습니다.");
		$('input[name="unitPrice"]').focus();
		return false;
	}
	if(!regExpUnitPrice.test(unitPrice)){
		alert("[상품 가격]\n소수점 둘째 자리까지만 입력하세요.");
		$('input[name="unitPrice"]').focus();
		return false;
	}
	
	// 재고 수 체크
	// 4) 숫자만 입력하세요.
	if(unitsInStock.length == 0 || isNaN(unitsInStock)){
		alert("[재고 수]\n숫자만 입력하세요.");
		$('input[name="unitsInStock"]').focus();
		return false;
	}
	
	// 파일 체크
	// 5) 파일을 선택하세요
	console.log("productImage : " + productImage);
	if(productImage == ""){
		alert("[상품 이미지]\n파일을 선택하세요.");
		return false;
	}
	
	$("#newProduct").submit();
}
</script>
</head>
<body>
<!-- URI : /addProduct.jsp?language=en
	요청 파라미터(param) : language=en
 -->
<fmt:setLocale value="${param.language }"/>
<fmt:bundle basename="bundle.message">

<!-- 액션 스크립트 -->
<jsp:include page="menu.jsp"></jsp:include>

<div class="jumbotron">
	<!-- 이 안에 내용 있다 -->
	<div class="container">
		<h1 class="display-3"><fmt:message key="title" /></h1>
	</div>
</div>

<!-- 이 안에 내용 있다 -->
<div class="container">
	<!-- 한/영 전환 -->
	<div class="text-right">
		<a href="/addProduct.jsp?language=ko">Korea</a> |
		<a href="/addProduct.jsp?language=en">English</a>
	</div>
	
	<!-- 폼페이지 시작 -->
	<form name="newProduct" id="newProduct" action="processAddProduct.jsp"
		class="form-horizontal" method="post" enctype="multipart/form-data">
		<!-- 가로방향 (행=로우=튜플=레코드) -->
		<div class="form-group row">
			<label class="col-sm-2"><fmt:message key="productId" /></label>
			<div class="col-sm-3">
				<input type="text" name="productId" class="form-control" value="${productId }" readonly />
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2"><fmt:message key="pname" /></label>
			<div class="col-sm-3">
				<input type="text" name="pname" class="form-control" required />
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2"><fmt:message key="unitPrice" /></label>
			<div class="col-sm-3">
				<input type="number" name="unitPrice" class="form-control" required />
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2"><fmt:message key="description" /></label>
			<!-- <div id="editor"></div> -->
			<div>
				<!-- 세로크기 : cols, 가로크기 : rows -->
				<textarea name="description" cols="100" rows="2" class="form-control"></textarea>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2"><fmt:message key="manufacturer" /></label>
			<div class="col-sm-3">
				<input type="text" name="manufacturer" class="form-control" />
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2"><fmt:message key="category" /></label>
			<div class="col-sm-3">
			<!-- 
				input type="checkbox" / "radio" => checked
			 -->
				<select id="category" name="category" class="form-control"
					aria-label="Default select example">
					<option selected><fmt:message key="categoryselect" /></option>
					<option value="Smart Phone">Smart Phone</option>
					<option value="Notebook">Notebook</option>
					<option value="Tablet">Tablet</option>
				</select>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2"><fmt:message key="unitsInStock" /></label>
			<div class="col-sm-3">
				<input type="number" name="unitsInStock" class="form-control" />
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2"><fmt:message key="condition" /></label>
			<div class="col-sm-5">
				<input type="radio" id="New" name="condition" value="New" checked />
				<label for="New"><fmt:message key="condition_New" /></label>
				<input type="radio" id="Old" name="condition" value="Old" />
				<label for="Old"><fmt:message key="condition_Old" /></label>
				<input type="radio" id="Refurbished" name="condition" value="Refurbished" />
				<label for="Refurbished"><fmt:message key="condition_Refurbished" /></label>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2"><fmt:message key="productImage" /></label>
			<div class="col-sm-5">
				<input type="file" name="productImage" class="form-control" />
			</div>
		</div>
		<div class="form-group row">
			<div class="col-sm-offset-2 col-sm-10">
				<!-- <button type="submit"...>등록</button> -->
				<!-- checkAddProduct() : 핸들러 함수 -->
				<input type="button" class="btn btn-primary" value='<fmt:message key="button" />' onclick="checkAddProduct()" />
				<input type="reset" class="btn btn-warning" value='<fmt:message key="init" />'  />
				<input type="button" class="btn btn-success" value='<fmt:message key="list" />' 
					onclick="javascript: location.href='products.jsp'" style="float:right;"/>
			</div>
		</div>
	</form>
	<!-- 폼페이지 끝 -->
</div>

<jsp:include page="footer.jsp"></jsp:include>
</fmt:bundle>

<script type="text/javascript">
	CKEDITOR.replace("description");
	// ClassicEditor.create(document.querySelector('#editor')).catch(error => {
	// 	console.error( error );
	// });
</script>
</body>
</html>