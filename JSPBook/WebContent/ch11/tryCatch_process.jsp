<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ page errorPage="exception_error.jsp" %> --%>
<!DOCTYPE html>
<html>
<head>
<title>Exception</title>
</head>
<body>
	<!-- 3) try-catch-finally를 이용한 예외 처리
		- 자바의 예외 처리 구문으로
		- try 구문 : 예외가 발생할 수도 있는 코드를 작성
		- catch 구문 : 오류가 발생할 수도 있는 예외 사항을 예측하여
					오류를 처리하는 코드를 작성
		- finally : try 구문이 실행된 후 실행할 코드를 작성 (생략 가능)
	 -->

	<!-- 요청URI : tryCatch_process.jsp?num1=12&num2=6 
		request객체에 num=12&num2=6 들어있음.
	-->
	<%	//스크립틀릿
	try{	// 먼저 실행 됨. 만약 예외 발생 시 실행을 중단하고, 예외와 일치하는 catch블록의 내용을 실행
		String num1 = request.getParameter("num1");	// "12"
		String num2 = request.getParameter("num2");	// "0"
// 		String num3 = request.getParameter("num3").toString();	// 에러 발생용
		
		// 문자를 숫자로 형변환
		int a = Integer.parseInt(num1); // 12
		int b = Integer.parseInt(num2);	// 0
		int c = a / b;	//12 / 6 => 2
		out.print(num1 + " / " + num2 + "=" + c);
	}catch(ArithmeticException e){
		// 오류가 발생하면 tryCatch_error.jsp로 포워딩.
		/*
			1) forwarding : jsp해석 -> 컴파일 -> html 리턴받음. 데이터를 전달할 수 있음.
			2) redirect : URL을 재요청. 데이터를 전달하기 어려움.
		*/
		// request객체와 response객체를 전달함
		// tryCatch_error.jsp에서도 요청 파라미터인 ?num1-12&num2=0을 사용할 수 있음
		RequestDispatcher dispatcher = request.getRequestDispatcher("tryCatch_error.jsp");
		dispatcher.forward(request, response);
	}
	%>
</body>
</html>










