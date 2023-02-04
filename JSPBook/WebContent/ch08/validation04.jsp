<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Validation04</title>
<script type="text/javascript">
	function checkLogin() {
		let form = document.loginForm;
		let id = form.id.value;
		let idLen = id.length;
		let passwd = form.passwd.value;
		let passwdLen = passwd.length;
		
		console.log("id : " + id + ", idLen : " + idLen);
		console.log("passwd : " + passwd + ", passwdLen : " + passwdLen);
		
		if(form.id.value==""){
			alert("아이디를 입력해주세요");
			form.id.focus();
			return false;
		}else if(form.passwd.value==""){
			alert("비밀번호를 입력해주세요");
			form.passwd.focus();
			return false;
		}
		
		// 아이디는 영문 소문자만 입력 가능합니다.
		for(var i = 0; i < idLen; i++){
			// java -> 한 글자씩 끄집어내보자..
			let ch = id.charAt(i);
			
			// 소문자인지 따져보자
// 			if((ch < 'a' || ch > 'z') && (ch > 'A' || ch < 'Z') && (ch > '0' || ch < '9')){
			if((ch < 'a' || ch > 'z')){
				alert("아이디는 영문 소문자만 입력 가능합니다.");
				// name = "id" 인 요소에 focus를 줌
				form.id.select();
				return;	// 함수 종료
			}
		}// end for
		
		// 비밀번호는 숫자만 입력 가능합니다.
		// 숫자가 아니니? 응 -> 숫자아님
		// 숫자가 아니니? 아니 -> 숫자
		if(isNaN(passwd)){	// 응(true)
			// 숫자 아님
			alert("비밀번호는 숫자만 입력 가능합니다");
			form.passwd.select();
			return;	// 함수 종료
		}// end if
		
		form.submit();
	}// end function
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
		<p> 아이디 : <input type="text" name="id" /></p>
		<p> 비밀번호 : <input type="password" name="passwd" class="cls passwd" /></p>
		<!-- checkLogin() : 핸들러 함수 -->
		<p><input type="button" value="전송" onclick="checkLogin()" /></p>
	</form>

</body>
</html>