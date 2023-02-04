<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Filter</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
%>
<c:set var="id" value="<%=id %>" />
<c:set var="pw" value="<%=pw %>" />

<script type="text/javascript">
	// jstl의 변수들을 J/S의 변수들로 받아보자
	let id = "${id}";
	let pw = "${pw}";
	
	// json
	let data = {"id" : id, "pw" : pw};
// 	let dataJson = JSON.parse(data);
	
	// JSON.stringify(dataJson)형태로 ajax 통신이 가능
	console.log("dataJson : " + JSON.stringify(data));
</script>

<p>id : </p>
<p>pw : </p>
</body>
</html>