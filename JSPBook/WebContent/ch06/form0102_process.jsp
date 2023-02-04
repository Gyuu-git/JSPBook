<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/header.jsp"></jsp:include>

<!------------------ body 시작 ---------------->
<%
	request.setCharacterEncoding("utf-8");

	String memName = request.getParameter("memName");
	String memInfo = request.getParameter("memInfo");
	String bookName = request.getParameter("bookName");
	String bookComment =request.getParameter("bookComment");
	String bookCategory = request.getParameter("bookCategory");
	String writer = request.getParameter("writer");
	String sale = request.getParameter("sale");
	String[] position = request.getParameterValues("position");
	String bookType = request.getParameter("bookType");
	String payBeft = request.getParameter("payBeft");
	String[] relCategory = request.getParameterValues("relCategory");
%>
<!-- disabled 때문에 널값으로 찍힘 -->
<p>memName : <%=memName %></p>

<p>memInfo : <%=memInfo %></p>
<p>bookName : <%=bookName %></p>
<p>bookComment : <%=bookComment %></p>
<p>bookCategory : <%=bookCategory %></p>
<p>writer : <%=writer %></p>
<p>sale : <%=sale %></p>
<p>position : <%=Arrays.toString(position) %></p>

<!-- value값이 없어서 선택해도 on으로 찍힘 -->
<p>bookType : <%=bookType %></p>

<p>payBeft : <%=payBeft %></p>
<p>relCategory : <%=Arrays.toString(relCategory) %></p>
<!------------------ body  끝  ---------------->

<jsp:include page="/bottom.jsp"></jsp:include>