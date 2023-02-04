<%@page import="java.util.Enumeration"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.ddit.vo.ProductVO"%>
<%@page import="kr.or.ddit.dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// 요청 URI : addCart.jsp?id=P1234
	// 요청 파라미터 : id=P1234
	
	String id = request.getParameter("id");

	out.print("<p>id : " + id + "</p>");
	// 요청 파라미터가 없을 때 처리..hjttp://localhost/addCart.jsp
	if(id==null){
		// redirect : 요청 URI를 재요청 => 주소 표시줄의 주소가 바뀜
		response.sendRedirect("products.jsp");
		// 다음줄부터 실행 안함
		return;
	}
	
	// 기본키가 P1234 코드의 상품을 찾아보자(상품 저장소에 있을것임)
	// 싱글톤 패턴으로 객체를 메모리에 1회 생성
	ProductRepository dao = ProductRepository.getInstance();
	
	// select * from ProductRepository
	// where id = 'P1234'
	// 상품코드를 파라미터로 던지면 해당되는 상품을 1행(productVO) 가져옴
	ProductVO productVO = dao.getProductById(id);
	
	out.print("<p>productVO : " + productVO + "</p>");
	
	// 상품 결과가 없다면..
	if(productVO == null){
		// [상품이 없음]예외처리 페이지로 이동
		response.sendRedirect("exceptionNoProductId.jsp");
		return;
	}else{
		
	}
	
	// 장바구니(세션). 하나의 장바구니에 하나의 세션. 세션명: cartlist라고 해보자
	// cartlist장바구니 하나에 여러개의 상품이 들어있다.
	ArrayList<ProductVO> list = (ArrayList<ProductVO>) session.getAttribute("cartlist");
	
	// 장바구니가 없다면(null) 장바구니를 생성
	if(list == null){
		// list는 null이므로 여기서 리스트(장바구니)를 생성해줘야 함
		list = new ArrayList<ProductVO>();
		
		// cartlist라는 세션 속성명에 list를 매핑
		session.setAttribute("cartlist", list);
	}
	
	Enumeration en = session.getAttributeNames();
	String name = en.nextElement().toString();
	out.print("<p>name : " + name + "</p>"); // cartlist
	
	// 장바구니가 있다면 다음을 실행
	// 1) 장바구니에 P1234 상품이 이미 들어있는 경우
	//	private int quantity;	// 상품을 장바구니에 담은 개수
	//	quantity의 값을 1 증가
	// 2) 장바구니에 P1234 상품이 없는 경우
	//	장바구니에 상품을 넣어주고
	//	quantity의 값을 1로 처리
	
	// list : 장바구니에 들어있는 상품 목록
	// list.size() : 상품의 종류 수
	// list : List<ProductVO>
	int cnt = 0;
	for(int i = 0; i < list.size(); i++){
		// list는 장바구니(P1234, P1235, P1236)
		// (P1234-list.get(0), P1235-list.get(1), P1236-list.get(2)) 상품이 이미 있다고 하면..
		// list.get(0).getProductId().equals("P1234")
		if(list.get(i).getProductId().equals(id)){	// 담을 상품을 list에서 찾음
			cnt++;
			// 장바구니에 상품이 이미 들어있다면 장바구니에 담은 개수만 1 증가
			list.get(i).setQuantity(list.get(i).getQuantity() + 1);
		}
	}
	
	// 장바구니에 해당 상품이 없다면(cnt = 0)
	if(cnt == 0){
		productVO.setQuantity(1);
		// 최종목표 : 장바구니(list)에 상품을 추가
		list.add(productVO);
	}
	
	// 장바구니를 확인
	// List<ProductVO> list
	for(ProductVO vo : list){
		out.print("<p>" + vo.toString() + "</p>");
	}
	
	// 상품상세 페이지로 되돌아 가자
	response.sendRedirect("product.jsp?id=" + id);
%>