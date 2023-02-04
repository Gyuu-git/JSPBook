<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	// 시큐리티의 사용자명을 가져옴
	String username = request.getRemoteUser();
%>
<!-- JAVA세계의 변수 username의 값을 JSTL세계의 변수 username에 할당 -->
<c:set var="username" value="<%=username %>" />
<nav class="navbar navbar-expand navbar-dark bg-dark">
	<!-- container : 내 안에 내용 있다 -->
	<div class="container">
		<div class="navbar-header" style="width: 100%;">
			<div style="float: left;">
				<a class="navbar-brand" href="welcome.jsp">Home</a>
			</div>
			<div style="float: right">
				<span class="navbar-brand" style="color: white;">
					<!-- 로그인 했음 -->
					<c:if test="${fn:length(username) > 0}">
						${username}님 환영합니다. | 
						<a href="/logout.jsp" class="btn btn-sm btn-success pull-right">logout</a>
					</c:if>
					<!-- 로그인 안함 -->
					<c:if test="${fn:length(username) == 0}">
						<a href="addProduct.jsp">로그인해주세요.</a>
					</c:if>
				</span>
			</div>
		</div>
	</div>
</nav>