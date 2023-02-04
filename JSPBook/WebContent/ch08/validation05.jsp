<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Validation</title>
</head>
<body>

<!-- 유효성 겁사 > 데이터 형식 유효성 검사
	사용자가 폼 페이지의 입력 항목에 입력한 데이터 값이
	특정 형태에 적합한지 검사하기 위해 정규 표현식(regular expression)을 사용.
	1. Flag : /정규표현식/ 끝에 사용하며 생략 가능
	 (I aM flaG)
	- i(Ignore Case) : 대소문자 구별 없다 *
	- m(Multi Line) : 줄 바꿈 있는지 검출
	- g(Global) : 모든 패턴 검출
	
	2. 메소드
	- test() : 정규표현식.test(대상 문자열). true/false 리턴 *******
	- exec() : 정규표현식.exec(대상 문자열). 패턴에 맞는 문자열 추출.(select)
-->
	<form name="frm">
		<p>제목 : <input type="text" name="title" /></p>
		<!-- checkForm() : 핸들러 함수 -->
		<p><input type="button" value="전송" onclick="checkForm()" /></p>
	</form>
<script type="text/javascript">
function checkForm() {
	// 정규식(Regular Expression)
	// 정규식은 /로 시작해서 /로 끝남
	// i : 대/소문자 무시
	
	// 주어진 문자열에서 java를 검색
	let regExp = /Java/i;
	
	// 제목의 데이터를 가져옴
	let str = document.frm.title.value;
	let result = regExp.exec(str);
	console.log("result : " + result);
}
</script>

</body>
</html>