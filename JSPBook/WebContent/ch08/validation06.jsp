<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/js/jquery-3.6.3.min.js"></script>
<title>Validation</title>
<script type="text/javascript">
function checkForm() {
	// J/S
	let str = document.frm.name.value;
	console.log("str : " + str);
	
	// 정규식(이름은 숫자로 시작할 수 없습니다.)
	// | : or
	let regExp = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;	// 첫 글자가 문자이니?
	// 정규식.test(대상문자열) => true/false
	if(!regExp.test(str)){ // 첫 글자가 문자가 아니면
		alert("이름은 숫자로 시작할 수 없습니다.");
		return;	// 함수 종료
	}; // if문 끝
}; // checkForm() 끝
</script>
<script type="text/javascript">
$(function() {
	$("#btnJquery").on("click", function () {
		let str = $("input[name='name']").val();
		console.log("str : " + str);
		
		// 정규식(이름은 숫자로 시작할 수 없습니다.)
		// | : or
		let regExp = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;	// 첫 글자가 문자이니?
		// 정규식.test(대상문자열) => true/false
		if(!regExp.test(str)){ // 첫 글자가 문자가 아니면
			alert("이름은 숫자로 시작할 수 없습니다.");
			return;	// 함수 종료
		}; // if문 끝
	}); // btnJquery 이벤트 끝
}); // $(function) 끝
</script>
</head>
<body>

<!-- action이 생략되었다면? 
	action="현재jsp"
	method="get"
-->
<form name="frm">
	<p>이름 : <input type="text" name="name" /></p>
	<p>
		<input type="button" id="btn" value="전송" onclick="checkForm()" />
		<input type="button" id="btnJquery" value="전송2" />
	</p>
</form>

</body>
</html>