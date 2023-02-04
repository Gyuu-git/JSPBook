<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/js/jquery-3.6.3.min.js"></script>
<title>Validation</title>
</head>
<script type="text/javascript">
function checkform(){
	// 아이디 값
	let id = document.loginForm.id.value;
	let pw = document.loginForm.passwd.value;
	
	console.log("아이디: " + id);
	console.log("비밀번호: " + pw);
}
</script>
<body>
	<!-- 유효성 검사(Validation)
		- 사용자가 폼 페이지에서 입력한 데이터 값이 톰켓서버로 전송되기 전에
			특정 규칭에 맞게 입력되었는지 검증하는 것
		
		- 1) 기본 유효성 검사
			- 입력된 데이터 값의 존재 유무를 검사. 했니? 안했니?
			
		- 2) 데이터 형식 유효성 검사
			- 입력된 데이터 값이 특정 패턴에 적합한지 여부를 검사(정규 표현식=정규식 사용)
	 -->
	
	<!-- 폼페이지 -->
	<form action="" name="loginForm">
		<!-- 폼 데이터 -->
		<p> 아이디 : <input type="text" name="id" /></p>
		<p> 비밀번호 : <input type="password" name="passwd" /></p>
		<!-- checkform() : 핸들러 함수 -->
		<p><input type="button" value="전송" onclick="checkform()" /></p>
	</form>

</body>
</html>