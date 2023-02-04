<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/js/jquery-3.6.3.min.js"></script>
<link rel="stylesheet" href="/css/bootstrap.min.css">
<title>form 연습</title>
<script type="text/javascript">
// 1) submit시 fn_check() 함수 실행 후 true일 때 submit 됨
function fn_check() {
	var pw = $('#password').val();
	var id = $('#memId').val();

	// 2) 비밀번호는 6자리 이상이어야 함
	// 3) 아이디는 3자리 이상이어야 함
	if(id.length >= 3 && pw.length >= 6){
		return true;
	}else{
		alert("아이디 및 비밀번호 길이를 확인해주세요.");
		return false;
	}
};
// 4) form0101_process.jsp로 폼 데이터를 전송하면
//		request 객체에 들어있는 memId, password, remember-me name에 매핑된 value를 받아서
//		화면에 출력해보자

</script>
</head>
<body>

<div class="card" style="width: 18rem; margin: 20px;">
	<div class="card-body">
		<div class="bd-example">
			<form action="form0101_process.jsp" method="post" onsubmit="return fn_check()">
				<div class="mb-3">
					<label for="memId" class="form-label">아이디</label>
					<input type="text" class="form-control" 
						id="memId" name="memId" aria-describedby="idHelp"
						placeholder="아이디를 입력해주세요" required/>
				</div>
				<div class="mb-3">
					<label for="password" class="form-label">비밀번호</label>
					<input type="password" class="form-control"
					   id="password" name="password" placeholder="비밀번호를 입력해주세요" required/>
				</div>
				<div class="mb-3 form-check">
					<input type="checkbox" class="form-check-input" id="remember-me" name="remember-me">
					<label class="form-check-label" for="remember-me">자동 로그인</label>
				</div>
				<button type="submit" class="btn btn-primary">로그인</button>
			</form>
		</div>
	</div>
</div>

</body>
</html>