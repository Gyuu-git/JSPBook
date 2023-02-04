<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Validation03</title>
<script type="text/javascript">
	function checkLogin() {
		// 폼페이지가 J/S 오브젝트 변수로 할당
		let form = document.loginForm;
		
		// 아이디 입력값의 길이
		let idLen = form.id.value.length;
		// 비밀번호 입력값의 길이
		let pwLen = form.passwd.value.length;
		
		console.log("idLen : " + idLen + ",  pwLen : " + pwLen);
		
		if(idLen < 4 || idLen > 12){
			alert("아이디는 4-12자 이내로 입력 가능합니다.");
			form.id.select();
			return false;
		}
		
		
		if(pwLen < 4){
			alert("비밀번호는 4자 이상으로 입력해야 합니다.");
			form.passwd.select();
			return false;
		}
		
		// 조건문을 무사히 통과했다면..
		form.submit();
	}
</script>
</head>
<body>
	<!-- 기본 유효성 검사 > 데이터 길이 확인
		- 아이디, 비밀번호 등과 같은 입력 데이터의 제한 길이를 검사
	 -->

	<form id="loginForm" action="validation03_process.jsp" method="post" name="loginForm">
		<!-- 폼 데이터 -->
		<p> 아이디 : <input type="text" name="id" /></p>
		<p> 비밀번호 : <input type="password" name="passwd" class="cls passwd" /></p>
		<!-- checkLogin() : 핸들러 함수 -->
		<p><input type="button" value="전송" onclick="checkLogin()" /></p>
	</form>

</body>
</html>