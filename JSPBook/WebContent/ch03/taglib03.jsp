<%@page import="kr.or.ddit.vo.AnsicityVO"%>
<%@page import="java.util.ArrayList"%>
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
 	List<AnsicityVO> ansicityVOList = new ArrayList<AnsicityVO>();
 	
 	AnsicityVO ansicityVO = new AnsicityVO(1, "고영경", "양갱");
 	ansicityVOList.add(ansicityVO);
 	
 	ansicityVO = new AnsicityVO(2, "김세윤", "세도리");
 	ansicityVOList.add(ansicityVO);
 	
 	ansicityVO = new AnsicityVO(3, "김소민", "솜솜");
 	ansicityVOList.add(ansicityVO);
 	
 	ansicityVO = new AnsicityVO(4, "김희연", "히그미");
 	ansicityVOList.add(ansicityVO);
 	
 	ansicityVO = new AnsicityVO(5, "박설아", "햄끼");
 	ansicityVOList.add(ansicityVO);
 %>
 <%=ansicityVOList %>
<!DOCTYPE html>
<html>
<head>
<title>Directives Tag</title>
</head>
<body>
<hr />
	<!-- 자바 변수를 JSTL 변수로 변환 -->
	<c:set var="ansicityVOList" value="<%=ansicityVOList %>" />
<hr />
	<!-- 
	JSTL 중에서 core 사용
	var : variable(변수). 1행
	items(잘 사용함) : 전체 데이터(List, Array)
	varStatus(가끔씩 사용) : index(0부터 시작),
							 count(1부터 시작)
	 -->
	<c:forEach var="ansicityVO" items="${ansicityVOList}" varStatus="stat">
		<p <c:if test="${stat.index%2==0}"> style='background: blue; color: white;' </c:if> >
			${stat.index} : ${stat.count} : 
			${ansicityVO.memId} : ${ansicityVO.memName} : ${ansicityVO.memAlias}
		</p>
	</c:forEach>
</body>
</html>