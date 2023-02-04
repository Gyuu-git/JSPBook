package filter;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class LogFilter implements Filter {
	PrintWriter out;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("WebMarket 초기화..");
		
		// filename은 c:\\logs\\jsg.log
		String filename = filterConfig.getInitParameter("filename");	// 저장될 경로 및 파일명
		if(filename == null) throw new ServletException("로그 파일의 이름을 찾을 수 없습니다.");
		try {
			// new PrintWriter : 파일 객체 생성(true : 기존 버퍼를 비움)
			// new FileWriter : 생성된 파일에 연동(true : 누적됨(append))
			out = new PrintWriter(new FileWriter(filename, true), true);
		}catch (IOException e) {
			throw new ServletException("로그 파일을 열 수 없습니다.");
		}
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		out.println("접속한 클라이언트 IP : " + request.getRemoteAddr());
		long start = System.currentTimeMillis();
		out.println("접근한 URL 경로 : " + getURLPath(request));
		out.println("요청 처리 시작 시각 : " + getCurrentTime());
		
		// 필터가 연속적으로 있다면 다음 필터로 제어 및 요청/응답 정보를 넘겨줌
		chain.doFilter(request, response);
		
		// 시스템 현재시간(종료시간)
		long end = System.currentTimeMillis();
		out.println("요청 처리 종료 시각 : " + getCurrentTime());
		out.println("요청 처리 소요 시각 : " + (end - start) + "ms");	// 1000분의 1초 단위
		out.println("---------------------------------------");
	}
	
	// 필터가 종료되기 직전에 실행
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		out.close();
	}
	
	// 접근한 URL 경로
	private String getURLPath(ServletRequest request) {
		// ServletRequest(부모) -> HttpServletRequest(자식) : 더 많은 메소드를 사용하기 위함
		// HttpServletRequest는 ServletRequest를 상속
		HttpServletRequest req;
		
		// 요청된 URL경로 : http://localhost/ch12/filter03.jsp?name=개똥이
		String currentPath = "";
		// queryString : 요청 파라미터(HTTP파라미터) => name=개똥이
		String queryString = "";
		
		// instanceof : '레퍼런스'가 가리키는 객체가 해당 '클래스 타입'이면 true, 아니면 false로 처리
		// 객체 레퍼런스 instanceof 클래스 타입
		// 부모와 자식 관계인가?
		if(request instanceof HttpServletRequest) {
			req = (HttpServletRequest) request;
			// 현재 접속한 URL을 얻어옴
			currentPath = req.getRequestURI();
			out.println("currentPath(URI) : " + currentPath);
			out.println("URL : " + req.getRequestURL());
			queryString = req.getQueryString();
			out.println("queryString : " + queryString);
			
			queryString = (queryString == null) ? "" : "?" + queryString;
		}
		
		return currentPath + queryString;
	} // end getURLPath()
	
	// 현재 일시를 리턴해주는 메소드
	private String getCurrentTime() {
		DateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		// 날짜 객체 생성(싱글톤-주기억장치(ram)에 객체가 1회 생성. 전역변수처럼 공유되어 사용)
		Calendar calender = Calendar.getInstance();
		calender.setTimeInMillis(System.currentTimeMillis());
		// 현재 일시를 년/월/일 시:분:초 형식으로 바꿈(String 타입)
		return formatter.format(calender.getTime());
	}

}
