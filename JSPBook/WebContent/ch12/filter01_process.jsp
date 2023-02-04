<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Filter</title>
</head>
<body>
<% 
	String name = request.getParameter("name");
%>
<p>입력된 name값 : <%=name %></p>

</body>
</html>