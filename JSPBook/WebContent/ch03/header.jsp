<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- <h4>헤더 페이지 영역입니다.</h4> -->
<%! // 선언문
	// 전역 변수 선언 및 0 할당. 초기화.
	int pageCount = 0;
	
	// 전역 메소드. 리턴 타입은 void이므로 리턴값 없음
	void addCount(){
		// 전역 변수의 값을 1 증가.
		pageCount++;
	}
%>
<%	// 스크립틀릿
	// 메서드 호출
	addCount();
%>
<!-- 표현문. 변수 pageCount의 값을 출력 -->
<p>이 사이트 방문은 <%=pageCount %>번째 입니다.</p>