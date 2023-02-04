<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Scripting Tag</title>
</head>
<body>
	<h2>Scripting Tag</h2>
<%!	// 선언문 태그 -> 전역변수, 전역 메소드 선언
	int count = 3;

	// 전역 메서드 선언
	// String : 리턴 타입(반환 타입) 메서드명(자료형 매개변수)
	// String data : 파라미터(인수)를 받아들이는 매개변수
	// 접근제한자 생략 시 open범위는? 동일 패키지
	String makeItLower(String data){
		// 영문 소문자로 변환하여 리턴
		return data.toLowerCase();
	}
%>

<%	// 스크립틀릿 태그(자바로직 코드 작성)
	// 지역변수 i를 사용하고 1부터 3까지 1씩 증가
	for(int i = 1; i <= count; i++){
		// out : JSP의 기본 객체(화면에 출력 대상 문자열을 출력)
		out.print("Java Server Page : " + i + "<br/>개똥이<br/>");
	}
%>
<!-- 표현문 태그.(선언문의 메소드를 호출 -> 소문자로 변환하여 리턴받음) -->
<%=makeItLower("Hello World") %>
</body>
</html>