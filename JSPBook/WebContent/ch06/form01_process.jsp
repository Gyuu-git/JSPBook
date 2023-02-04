<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String gender = request.getParameter("gender");
	String[] hobby = request.getParameterValues("hobby");	// 여러개의 값을 배열로 받자
	String city = request.getParameter("city");
	String food = request.getParameter("food");
%>
<!-- 표현문 -->
<p>id : <%=id%></p>
<p>passwd : <%=passwd%></p>
<p>name : <%=name%></p>
<p>phone : <%=phone%></p>
<p>gender : <%=gender%></p>
<p>hobby : <%
			if(hobby != null){
				for(int i = 0; i < hobby.length; i++){
					out.print(hobby[i] + " ");
				}
			}
			%></p>
<p>city : <%=city%></p>
<p>food : <%=food%></p>