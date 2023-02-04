<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Session</title>
</head>
<body>
<!-- 
	후보키(Candidate Key) : Not Null, No Duplicate
	기본키(Primary Key) : 후보키 중에 대표적인 속성을 1개 선택(Not Null, No Duplicate)
	대체키(Alternate Key) : 후보키 중에 기본키가 안된 속성들
	외래키(Foreign Key) : 부모 테이블의 기본키가 자식 테이블의 외래키로 전이(copy)됨.
						자식 테이블의 외래키는 부모 테이블의 기본키를 참조(reference)함
	복합키(Composite Key) : 테이블에 후보키가 없을 떄 2개 이상의 속성을 하나로 묶어 후보키 및 기본키로 설정
-->
<!-- 폼 페이지 
	요청 URL : session01_process.jsp
	요청 파라미터 : {"id" : "a001", "pw" : "java"}
-->
<form action="session01_process.jsp" method="post">
	<!-- 폼 데이터 -->
	<p>아이디 : <input type="text" name="id" required /></p>
	<p>비밀번호 : <input type="text" name="pw" required /></p>
	<p><input type="submit" value="전송" /></p>
</form>

</body>
</html>