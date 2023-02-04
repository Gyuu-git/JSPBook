<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ page errorPage="exception_error.jsp" %> --%>
<!DOCTYPE html>
<html>
<head>
<title>Exception</title>
</head>
<body>
	<!-- 요청URI : exception_process.jsp?num1=12&num2=6 
		request객체에 num=12&num2=6 들어있음.
	-->
	<%	//스크립틀릿
		String num1 = request.getParameter("num1");	//"12"
		String num2 = request.getParameter("num2");	//"6"
		String num3 = request.getParameter("num3").toString();	// 에러 발생용
		
		//문자를 숫자로 형변환
		int a = Integer.parseInt(num1); //12
		int b = Integer.parseInt(num2);	//6
		int c = a / b;	//12 / 6 => 2
		out.print(num1 + " / " + num2 + "=" + c);
	%>
</body>
</html>










