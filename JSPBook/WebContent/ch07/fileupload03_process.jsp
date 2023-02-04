<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
/* FileItem의 메소드
	- *isFormField() : 폼데이터 맞니? 파일객체가 아닌거 맞아? 일반 데이터 맞지?
	- *getFieldName() : 요청 파라미터 이름을 String으로 리턴(filename)
	- *getString() : 요청 파라미터의 값을 얻어옴(일반 데이터의 경우 name=value에서 value)
	- *getName() : 파일의 이름을 가져옴(경로 포함) c:_upload_개똥이.jpg
	- *getSize() : 파일의 크기(개똥이.jpg의 크기)
	- get() : 업로드된 파일을 바이트 배열로 얻어옴
	- isInMemory() : 메모리에 저장되면 true, 임시 디렉토리에 저장되면 false
	- delete() : 파일 관련 자원 삭제
	- *write() : 파일을 저장
	- *getContenetType() : 파일의 컨텐츠 유형 반환(images/jpeg)
*/
	// 서버에 저장할 경로 설정
	String fileUploadPath = "C:\\upload";

	DiskFileUpload upload = new DiskFileUpload();
	// upload.paresRequest(HttpServletRequest 요청 파라미터를 담은 객체(req))
	// request 내장 객체 안에 <input type="file" name="filename" /> 객체가 들어있음
	List items = upload.parseRequest(request);
	
	// 열거형으로 데이터를 가져와보자
	Iterator params = items.iterator();
	// params.hasNext() : 폼 페이지에서 전송된 요청 파라미터가 더이상 없을때까지 반복
	while(params.hasNext()){
		// 폼페이지에서 전송된 요청 파라미터 오브젝트를 가져옴
		FileItem fileItem = (FileItem) params.next();
		// 일반 데이터 맞지?
		if(!fileItem.isFormField()){
			// 파일의 이름을 가져옴(경로 포함)
			String fileName = fileItem.getName();
			out.print("fileName(전) : " + fileName);
			// 파일의 경로를 제외한 순수 파일명만 추출하여 파일명만 변수에 저장
			fileName = fileName.substring(fileName.lastIndexOf("\\")+1);
			out.print("fileName(후) : " + fileName);
			// 파일 객체 생성(설계도) : 서버에 저장할 경로 및 파일명 설정
			File file = new File(fileUploadPath + "/" + fileName);
			// 파일 복사 실행(설계도 구현)
			fileItem.write(file);
		}
	}
%>