<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/js/jquery-3.6.3.min.js"></script>
<title>Validation</title>
</head>
<script type="text/javascript">
	function checkMember() {
		// 정규 표현식
		let regExpId = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;	// 아이디는 문자로 시작해주세요
		let regExpPw = /^[0-9]*$/;	// 비밀번호는 숫자만 입력해주세요
		let regExpName = /^[가-힣]*$/;	// 이름은 한글만 입력해주세요. + : 1이상, * : 0이상
		let regExpPhone = /^\d{3}-\d{3,4}-\d{4}$/;	// 연락처 형식을 확인해주세요
		// 이메일 형식을 확인해주세요. i : 대소문자 구별 안함
		let regExpMail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		// J/S
		let form = document.Member;
		let id = form.id.value;
		let pw = form.passwd.value;
		let name = form.name.value;
		let phone = form.phone1.value + "-"
					+ form.phone2.value + "-"
					+ form.phone3.value;
		let mail = form.email.value;
		console.log("id : " + id + ", pw : " + pw + ", name : " + name
					+ ", phone : " + phone + ", mail : " + mail);
		
		// 정규식.test(대상 문자열)
		// 1)아이디는 문자로 시작해주세요
		if(!regExpId.test(id)){
			alert("아이디는 문자로 시작해주세요");
			form.id.select();
			return;
		}
		// 2) 이름은 한글만 입력해주세요
		if(!regExpName.test(name)){
			alert("이름은 한글만 입력해주세요");
			form.name.select();
			return;
		}
		// 3) 비밀번호는 숫자만 입력해주세요
		if(!regExpPw.test(pw)){
			alert("비밀번호는 숫자만 입력해주세요");
			form.passwd.select();
			return;
		}
		// 4) 연락처 형식을 확인해주세요
		if(!regExpPhone.test(phone)){
			alert("연락처 형식을 확인해주세요");
			form.phone2.select();
			return;
		}
		// 5) 이메일 형식을 확인해주세요
		if(!regExpMail.test(mail)){
			alert("이메일 형식을 확인해주세요");
			form.email.select();
			return;
		}
		
		//if를 모두 통과했다면..
		form.submit();
	}
</script>
<script type="text/javascript">
$(function() {
	$('.btn-primary').click(function() {
		// 정규 표현식
		let regExpId = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;	// 아이디는 문자로 시작해주세요
		let regExpPw = /^[0-9]*$/;	// 비밀번호는 숫자만 입력해주세요
		let regExpName = /^[가-힣]*$/;	// 이름은 한글만 입력해주세요. + : 1이상, * : 0이상
		let regExpPhone = /^\d{3}-\d{3,4}-\d{4}$/;	// 연락처 형식을 확인해주세요
		// 이메일 형식을 확인해주세요. i : 대소문자 구별 안함
		let regExpMail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		// JQuery
		let id = $('#id').val();
		let pw = $('#pw').val();
		let name = $('#name').val();
		let phone = $(':selected').val() + "-"
					+ $('#phone2').val() + "-"
					+ $('#phone3').val()
		let mail = $('#email').val();
		console.log("id : " + id + ", pw : " + pw + ", name : " + name
					+ ", phone : " + phone + ", mail : " + mail);
		
		// 정규식.test(대상 문자열)
		// 1)아이디는 문자로 시작해주세요
		if(!regExpId.test(id)){
			alert("아이디는 문자로 시작해주세요");
			$('#id').select();
			return;
		}
		// 2) 이름은 한글만 입력해주세요
		if(!regExpName.test(name)){
			alert("이름은 한글만 입력해주세요");
			$('#name').select();
			return;
		}
		// 3) 비밀번호는 숫자만 입력해주세요
		if(!regExpPw.test(pw)){
			alert("비밀번호는 숫자만 입력해주세요");
			$('#pw').select();
			return;
		}
		// 4) 연락처 형식을 확인해주세요
		if(!regExpPhone.test(phone)){
			alert("연락처 형식을 확인해주세요");
			$('#phone2').select();
			return;
		}
		// 5) 이메일 형식을 확인해주세요
		if(!regExpMail.test(mail)){
			alert("이메일 형식을 확인해주세요");
			$('#email').select();
			return;
		}
		
		//if를 모두 통과했다면..
		$("form").submit();
	})
	
	// 연락처의 첫번째 번호가 바뀌면 이벤트 처리
	$("select").on("change", function() {
		$(":selected").css("background-color", "blue");
		console.log($(":selected").val());
	});
})
</script>
<body>

<h3>회원 가입</h3>

<!-- 폼페이지 -->
<form action="validation07_process.jsp" id="member" name="Member" method="post">
	<p>아이디 : <input type="text" id="id" name="id" /></p>
	<p>비밀번호 : <input type="password" id="pw" name="passwd" /></p>
	<p>이름 : <input type="text" id="name" name="name" /></p>
	<p>연락처 : 
		<select id="phone1" name="phone1">
			<option value="010">010</option>
			<option value="011">011</option>
			<option value="016">016</option>
			<option value="017">017</option>
			<option value="019">019</option>
		</select> - 
		<input type="text" maxlength="4" size="4" id="phone2" name="phone2" /> -
		<input type="text" maxlength="4" size="4" id="phone3" name="phone3" />
	</p>
	<p>이메일 : <input type="text" id="email" name="email" /></p>
	<p><input type="button" value="가입하기" onclick="checkMember()" /></p>
	<p><input type="button" value="가입하기2" class="btn btn-primary" /></p>
</form>

</body>
</html>