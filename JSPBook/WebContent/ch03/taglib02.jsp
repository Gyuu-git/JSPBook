<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.ddit.vo.FruitVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 
taglib 디렉티브 : 표현 언어(Expression Language), JSTL 설정 시 사용
	- uri : 설정 정보를 가진 경로 주소
	- prefix : uri 대신 식별해주는 별칭
 -->
 <%
 	// List : interface
 	List<FruitVO> fruitVOList = new ArrayList<FruitVO>();
 	
 	FruitVO fruitVO = new FruitVO("f01", "용과");
 	fruitVOList.add(fruitVO);
 	
 	fruitVO = new FruitVO("f02", "귤");
 	fruitVOList.add(fruitVO);
 	
 	fruitVO = new FruitVO("f03", "사과");
 	fruitVOList.add(fruitVO);
 	
 	fruitVO = new FruitVO("f04", "딸기");
 	fruitVOList.add(fruitVO);
 	
 	fruitVO = new FruitVO("f05", "바나나");
 	fruitVOList.add(fruitVO);
 %>
 <%=fruitVOList %>
<!DOCTYPE html>
<html>
<head>
<title>Directives Tag</title>
</head>
<body>
<hr />
	<!-- 자바 변수를 JSTL 변수로 변환 -->
	<c:set var="fruitVOList" value="<%=fruitVOList %>" />
<hr />
	<!-- 
	JSTL 중에서 core 사용
	var : variable(변수). 1행
	items(잘 사용함) : 전체 데이터(List, Array)
	varStatus(가끔씩 사용) : index(0부터 시작),
							 count(1부터 시작)
	 -->
	<c:forEach var="fruitVO" items="${fruitVOList}" varStatus="stat">
		<p>
			${fruitVO.fruitId} : ${fruitVO.fruitName}
		</p>
	</c:forEach>
</body>
</html>