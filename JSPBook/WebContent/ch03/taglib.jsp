<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 
taglib 디렉티브 : 표현 언어(Expression Language), JSTL 설정 시 사용
	- uri : 설정 정보를 가진 경로 주소
	- prefix : uri 대신 식별해주는 별칭
 -->
<!DOCTYPE html>
<html>
<head>
<title>Directives Tag</title>
</head>
<body>
	<!-- 
	JSTL 중에서 core 사용
	var : variable(변수)
	begin(잘 사용 안 함) : 시작 숫자
	end(잘 사용 안 함) : 종료 숫자
	step(잘 사용 안함) : 증가량
	1에서 10까지 1씩 증가되면서 k 변수에 값이 들어감
	 -->
	<c:forEach var="k" begin="1" end="10" step="1">
		<p><c:out value="${k}"/></p>
	</c:forEach>
</body>
</html>