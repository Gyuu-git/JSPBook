<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Scripting Tag</title>
</head>
<body>
<%	// 스크립틀릿 태그
	for(int i = 0; i <= 10; i++){
		// 짝수인 경우에만 출력
		if(i % 2 == 0){
			out.print("<p>" + i + "</p>");
		}
	}
%>
</body>
</html>