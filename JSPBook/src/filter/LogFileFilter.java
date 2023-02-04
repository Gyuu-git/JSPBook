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

public class LogFileFilter implements Filter {
	
	// jsp에서 메시지를 보여야 하므로 선언.
	PrintWriter out;
	
	// web.xml의 init-param에 {"filename" : "저장될경로"}를 넣어서
	// filterConfig 매개변수로 던짐
	/* 윈도우즈의 폴더 경로는 \\로 구분
	 <init-param>
	 	<param-name>filename</param-name>
	 	<param-value>c:\\logs\\jsg.log</param-value>
	 </init-param>
	 */
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
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
		// s : 문자열 / n : 다음줄로 이동
		out.printf("현재 일시 : %s %n", getCurrentTime());
		// 접속한 클라이언트 IP
		String clientAddr = request.getRemoteAddr();
		out.printf("클라이언트 주소 : %s %n", clientAddr);
		
		// 다음 필터에 request, response객체를 넘겨줌
		// 필터가 연속적으로 있다면 다음 필터로 제어 및 요청/응답 정보를 넘겨줌
		// 필터를 리소스에 적용
		chain.doFilter(request, response);
		
		// 문서의 콘텐츠 유형(MINE 타입)
		String contentType = response.getContentType();
		out.printf("문서의 컨텐츠 유형 : %s %n", contentType);
		out.print("------------------------------------------");
	}
	
	@Override
	public void destroy() {
		// 객체를 메모리에서 제거
		out.close();
	}
	
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
