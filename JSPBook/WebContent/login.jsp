<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/bootstrap.min.css" />
<title>Login</title>
</head>
<body>
	<!-- include 액션 태그 -->
	<jsp:include page="menu.jsp" />
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="dispay-3">로그인</h1>
		</div>
	</div>
	
	<div class="container" align="center">
		<div class="col-me-4 col-md-offset-4">
			<!-- ?error=1 요청 파라미터(param) -->
			<c:if test="${param.error=='1'}">
				<h3 class="form-signin-heading">아이디 / 비밀번호를 확인해주세요</h3>
			</c:if>
			<c:if test="${param.error != '1'}">
				<h3 class="form-signin-heading">Please Sign In</h3>
			</c:if>
			<!-- /ch10/security01.jsp에 접근 시 통과해야 할 관문 -->
			<form class="form-signin" name="LoginForm" action="j_security_check" method="post">
				<div class="form-group">
					<label for="inputUserName" class="sr-only">User Name</label>
					<input type="text" name="j_username" class="form-control" placeholder="ID" required autofocus />
				</div>
				<div class="form-group">
					<label for="inputPassword" class="sr-only">Password</label>
					<input type="password" name="j_password" class="form-control" placeholder="Password" required />
				</div>
				
				<p><input type="submit" class="btn btn-lg btn-success btn-block" value="로그인" /></p>
			</form>
		</div>
	</div>
	
	
	<!-- footer -->
	<jsp:include page="footer.jsp" />
</body>
</html>