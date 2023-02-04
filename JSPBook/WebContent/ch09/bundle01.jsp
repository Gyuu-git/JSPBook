<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>Internationalization</title>
</head>
<body>

<!-- 리소스 번들
	리소스번들은 메시지 처리 태그에서 사용하는 파일로 메시지 번들이라고도 함
	java.util.Properties 클래스에 정의된 방법으로 메시지를 읽어옴.
	- 확장자가 properties 파일
	- 알파벳, 숫자, 라틴 문자 이외의 언어를 유니코드 값으로 표현
-->

<!-- value
	1) 한글(ko) => message_ko.properties
	2) 영어(en) => message_en.properties
-->
<fmt:setLocale value="ko"/>
<!-- bundle 시작 -->
<fmt:bundle basename="resourceBundle.message">
	
	<p><fmt:message key="name" /></p>
	<p><fmt:message key="hello" /></p>
	
<!-- bundle 끝 -->
</fmt:bundle>

</body>
</html>