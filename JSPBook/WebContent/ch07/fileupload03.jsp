<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>File Upload</title>
</head>
<body>
<!-- 
	commons-fileupload.jar 오픈 라이브러리
	- 서버(톰켓 컨테이너)의 메모리상에서 파일 처리가 가능하도록 지원해줌
	- (JSP)DiskFileUpload 객체
	- (SPRING)MultipartFile 객체
	- DiskFileUpload upload...
	-	upload.setRepositoryPath(경로) : 업로드된 파일을 임시로 저장할 디렉터리 설정
	-	upload.setSizeMax(long 최대 파일의 크기)
	-	upload.setSizeThreshold(int 메모리상의 저장 최대 크기)
	-	upload.parseRequest(HttpServletRequest 요청 파라미터를 담은 객체(req))
	-	parse : 구문분석/의미분석
	-			ex) 김대리 xml 파싱했나요 => xml의 구문과 의미를 분석하여 처리했나요?
 -->
	<!-- 폼페이지 -->
	<form action="fileupload03_process.jsp" method="post"
		enctype="multipart/form-data">
		<p>파일 : <input type="file" name="filename" /></p>
		<p><input type="submit" value="파일 올리기" /></p>
	</form>

</body>
</html>