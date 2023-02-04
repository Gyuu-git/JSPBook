<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/js/jquery-3.6.3.min.js"></script>
<title>Validation02</title>
</head>
<script type="text/javascript">
	function checkLogin() {
		// 폼 페이지를 J/S 객체로 할당
		let form = document.loginForm;
		if(form.id.value == ""){	// 아이디 값이 없음
			alert("아이디를 입력해주세요");
			form.id.focus();
			return false;
		}else if(form.passwd.value == ""){	// 비밀번호 값이 없음
			alert("비밀번호를 입력해주세요");
			form.passwd.focus();
			return false;
		}else{
			alert("정상입력");
		}
		$('#loginForm').submit();
	}
</script>
<body>
	<!-- 기본 유효성 검사
		- 입력한 데이터 값이 있니? 없니?
		- 데이터 길이, 숫자 등 기본적인 것이 맞는지 검사
	 -->
	
	<form id="loginForm" action="validation02_process.jsp" method="post" name="loginForm">
		<!-- 폼 데이터 -->
		<p> 아이디 : <input type="text" name="id" /></p>
		<p> 비밀번호 : <input type="password" name="passwd" class="cls passwd" /></p>
		<!-- checkLogin() : 핸들러 함수 -->
		<p><input type="button" value="전송" onclick="checkLogin()" /></p>
	</form>

</body>
<script type="text/javascript">
$(function() {
	$("input[type='button']").on("click", function () {
		// 아이디 입력란의 값을 가져옴
		let id = $("input[name='id']").val();
		let pw = $(".passwd").val();
		
		console.log("id : " + id + ", passwd : " + pw);
	})
})
</script>
</html>