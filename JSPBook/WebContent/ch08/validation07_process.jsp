<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Validation</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("passwd");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone1") + "-"
					+ request.getParameter("phone2") + "-"
					+ request.getParameter("phone3");
	String mail = request.getParameter("email");
%>

<p>아이디 : <%=id %></p>
<p>비밀번호 : <%=pw %></p>
<p>이름 : <%=name %></p>
<p>연락처 : <%=phone %></p>
<p>이메일 : <%=mail %></p>

</body>
</html>