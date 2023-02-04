<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>Internationalization</title>
</head>
<body>

<p>------------ 기본(한글) 로케일 ------------</p>
<fmt:setLocale value="ko"/>
<fmt:bundle basename="bundle.myBundle">
	<p>제목 : <fmt:message key="title" /></p>
	<p>이름 : <fmt:message key="username" /></p>
	<fmt:message key="password" />
</fmt:bundle>

<p>------------ 영문 로케일 ------------</p>
<fmt:setLocale value="en"/>
<fmt:bundle basename="bundle.myBundle">
	<p>제목 : <fmt:message key="title" /></p>
	<p>이름 : <fmt:message key="username" /></p>
	<fmt:message key="password" />
</fmt:bundle>

<hr />
<fmt:setBundle basename="bundle.myBundle" var="resourceBundle" />
<p>제목 : <fmt:message key="title" bundle="${resourceBundle}" /></p>
<fmt:message key="username" bundle="${resourceBundle}" var="username" />
<p>이름 : ${username}</p>

</body>
</html>