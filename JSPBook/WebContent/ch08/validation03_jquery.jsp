<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/js/jquery-3.6.3.min.js"></script>
<title>Validation03</title>
<script type="text/javascript">
$(function() {
	// button요소를 클릭하면 콜백함수 실행
	$('button').on("click", function () {
		let id = $('#id').val();
		let idLen = id.length;
		
		console.log("id : " + id + ", idLen : " + idLen);
		
		let passwd = $('#passwd').val();
		let passwdLen = passwd.length;
		
		console.log("passwd : " + passwd + ", passwdLen : " + passwdLen);
		
		if(idLen < 4 || idLen > 12){
			alert("아이디는 4-12자 이내로 입력 가능합니다.");
			$('#id').select();
			return false;
		}
		
		if(passwdLen < 4){
			alert("비밀번호는 4자 이상으로 입력해야 합니다.");
			$('#passwd').select();
			return false;
		}
		
		// 조건문을 무사히 통과했다면..
		$('#loginForm').submit();
	})
})
</script>
</head>
<body>
	<!-- 기본 유효성 검사 > 데이터 길이 확인
		- 아이디, 비밀번호 등과 같은 입력 데이터의 제한 길이를 검사
	 -->

	<form id="loginForm" action="validation03_process.jsp" method="post" name="loginForm">
		<!-- 폼 데이터 -->
		<p> 아이디 : <input type="text" name="id" id="id"/></p>
		<p> 비밀번호 : <input type="password" name="passwd" id="passwd" class="cls passwd" /></p>
		<!-- checkLogin() : 핸들러 함수 -->
		<p><button type="button">전송</button></p>
	</form>

</body>
</html>