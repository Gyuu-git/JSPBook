<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// 파일 저장 path
	String path = "c:\\upload";
	
	DiskFileUpload upload = new DiskFileUpload();
	
	// long 최대 파일의 크기(1Mbytes);
	upload.setSizeMax(1000000);
	// int 메모리상의 저장 최대 크기
	upload.setSizeThreshold(4096);
	// 임시로 저장할 디렉터리 설정
	upload.setRepositoryPath(path);
	// 요청파라미터를 받음
	// name=개똥이&subject=소설
	// filename이라는 파일객체
	// parse : 구문/의미분석
	// items.size() => 3
	List items = upload.parseRequest(request);
	// items 리스트 객체를 Iterator(열거) 클래스로 변환
	Iterator params = items.iterator();
	// 요청 파라미터가 없을 때까지 반복(3회 반복)
	while(params.hasNext()){
		// FileItem : 1)일반데이터(name, subject)  2)파일(filename)
		FileItem item = (FileItem) params.next();
		
		if(item.isFormField()){ // 1)일반데이터 (name, subject)
			// ?name=개똥이&subject=소설
			String name = item.getFieldName();	// 파라미터의 name값 가져옴(name, subject)
			String value = item.getString("utf-8");	// 파라미터의 value값 가져옴(개똥이, 소설)
			
			out.print("<p>" + name + " = " + value + "</p>");
		}else{	// 파일(filename)
			String fileFieldName = item.getFieldName();	// 파라미터의 name값 가져옴(filename)
			String fileName = item.getName();	// 선택된 업로드할 파일명
			String contentType = item.getContentType();	// MIME 타입(만약 이미지 : imgae/jpeg)
			
			// 파일명만 추출(client쪽의 경로는 제외)
			// c:\\Users\\test\\Pictures\\개똥이.jpg
			// 마지막 \\의 위치를 찾아서 +1을 하면 "개"부터 끝까지 추출 => 개똥이.jpg
			fileName = fileName.substring(fileName.lastIndexOf("\\")+1);
			// 파일의 크기
			long fileSize = item.getSize();
			// c:\\upload\\개똥이.jpg로 복사해야함 => 계획
			File file = new File(path + "/" + fileName);
			// 파일 복사 실행
			item.write(file);
			
			out.print("=============<br />");
			out.print("요청 파라미터 이름 : " + fileFieldName + "<br />");
			out.print("저장 파일 이름 : " + fileName + "<br />");
			out.print("파일 콘텐츠 유형 : " + contentType + "<br />");
			out.print("파일 크기 : " + fileSize + "<br />");
		}
	}
%>