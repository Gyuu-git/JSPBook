<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/js/jquery-3.6.3.min.js"></script>
<title>Form Processing</title>
<script type="text/javascript">
function fn_chk() {
	let phone1 = $("input[name='phone1']").val();
	let phone2 = $("input[name='phone2']").val();
	let phone3 = $("input[name='phone3']").val();
	
	let phone = phone1 + "-" + phone2 + "-" + phone3;
	console.log("phone : " + phone);
	
	$("#phone").val(phone);
	
	// false : form01_process.jsp로 요청이 안됨
	return true;
}
</script>
</head>
<body>
	<h3>회원 가입</h3>
	<!-- 폼 태그 -->
	<!-- 서브밋(submit) 할 때(on) => onSubmit -->
	<form action="form01_process.jsp" name="member" method="post" onsubmit="return fn_chk()">
		<p>
			아이디 : <input type="text" name="id" required/>
			<input type="button" value="아이디 중복 검사" />
		</p>
		<p>비밀번호 : <input type="password" name="passwd" required/></p>
		<p>이름 : <input type="text" name="name" required></p>
		<p>
			<!-- J/S의 phone변수에 담긴 결과값을 phone요소의 value로 넣어보자 -->
		    <input type="hidden" name="phone" id="phone" value="">
			연락처 : <input type="text" maxlength="4" size="4" name="phone1">
				   - <input type="text" maxlength="4" size="4" name="phone2">
				   - <input type="text" maxlength="4" size="4" name="phone3">
		</p>
		<p>
			성별 : <input type="radio" name="gender" value="male" checked>남성
					<input type="radio" name="gender" value="female">여성
		</p>
		<p>
			취미 : 독서<input type="checkbox" name="hobby" value="독서" checked>
					운동<input type="checkbox" name="hobby" value="운동">
					영화<input type="checkbox" name="hobby" value="영화">
		</p>
		<p>
			<!-- size 속성 : 해당 개수대로 미리 보여줌 -->
			<select name="city" size="3">
				<option value="대전" selected>대전</option>
				<option value="서울">서울</option>
				<option value="경기">경기</option>
				<option value="인천">인천</option>
				<option value="충청">충청</option>
				<option value="전라">전라</option>
				<option value="경상">경상</option>
			</select>
		</p>
		<p>
			<select name="food">
				<optgroup label="분식류">
					<option value="ddeukboki" selected>떡볶이</option>
					<option value="sundai">순대</option>
					<option value="tyigim">튀김</option>
				</optgroup>
				<optgroup label="안주류">
					<option value="ddarkbal">닭발</option>
					<option value="golbaengi">골뱅이</option>
				</optgroup>
				<optgroup label="찌개류">
					<option value="kimchi">김치찌개</option>
					<option value="sundubu">순두부찌개</option>
				</optgroup>
			</select>
		</p>
		<p>
			<input type="submit" value="가입하기">
			<input type="reset" value="다시 쓰기">
		</p>
	</form>
</body>
</html>