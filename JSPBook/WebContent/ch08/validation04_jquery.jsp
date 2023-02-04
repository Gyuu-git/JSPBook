<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/js/jquery-3.6.3.min.js"></script>
<title>Validation04</title>
<script type="text/javascript">
$(function() {
	$('button').on('click', function () {
		let id = $('#id').val();
		let idLen = id.length;
		let passwd = $('#passwd').val();
		let passwdLen = passwd.length;
		
		console.log("id : " + id + ", idLen : " + idLen);
		console.log("passwd : " + passwd + ", passwdLen : " + passwdLen);
		
		if(id == ""){
			alert("아이디를 입력해주세요");
			$('#id').focus();
			return false;
		}else if(passwd == ""){
			alert("비밀번호를 입력해주세요");
			$('#passwd').focus();
			return false;
		}
		
		// 아이디는 영문 소문자만 입력 가능합니다.
		for(var i = 0; i < idLen; i++){
			let ch = id.charAt(i);
			
// 			if((ch < 'a' || ch > 'z') && (ch > 'A' || ch < 'Z') && (ch > '0' || ch < '9')){
			if((ch < 'a' || ch > 'z')){
				alert("아이디는 영문 소문자만 입력 가능합니다.");
				$('#id').select();
				return;	// 함수 종료
			}
		}// end for
		
		// 비밀번호는 숫자만 입력 가능합니다.
		if(isNaN(passwd)){	// 응(true)
			// 숫자 아님
			alert("비밀번호는 숫자만 입력 가능합니다");
			$('#passwd').select();
			return;	// 함수 종료
		}// end if
		
		$('#loginForm').submit();
	})// end function
})
</script>
</head>
<body>
	<!-- 기본 유효성 검사 > 숫자 여부 확인
		- 숫자 여부는 isNaN() 함수를 활용
		- is Not a Number => 그거 숫자 아니니?
			응, 숫자가 아니야.	=> true
			아닌데? 숫잔데. 	=> false
	 -->

	<form id="loginForm" action="validation03_process.jsp" method="post" name="loginForm">
		<!-- 폼 데이터 -->
		<p> 아이디 : <input type="text" id="id" name="id" /></p>
		<p> 비밀번호 : <input type="password" id="passwd" name="passwd" class="cls passwd" /></p>
		<!-- checkLogin() : 핸들러 함수 -->
		<p><button type="button">전송</button></p>
	</form>

</body>
</html>