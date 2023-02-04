package filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class InitParamFilter implements Filter {
	// 멤버변수
	private FilterConfig filterConfig = null;

	// web.xml에서 파라미터로 넘어온 파라미터들을 filterConfig 매개변수로 받음
	// filterConfig : { "param1" : "admin", "param2" : "1234" }
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("Filter02 초기화..");
		
		this.filterConfig = filterConfig;
	}

	// 크롬(내장객체.request, response) -> request(요청) -> 톰캣
	// 크롬 							<- response(응답) <- 톰캣
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("filter02 수행...");
		request.setCharacterEncoding("utf-8");
		
		// filter02.jsp에서 filter02_process.jsp를 post방식으로 요청 시
		// <input type="text" name="id" />
		// <input type="text" name="pw" />
		// filter02_process.jsp?id=admin&pw="1234"
		String id = request.getParameter("id");		// admin
		String pw = request.getParameter("pw");		// 1234
		
		// web.xml의 init-param 태그로 넘어온 파라미터와 비교해보자
		String param1 = filterConfig.getInitParameter("param1");	// admin
		String param2 = filterConfig.getInitParameter("param2");	// 1234
		
		String message = "";
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		// 서로 비교해보자
		// param1과 param2는 web.xml에서 넘어온 값들(DB)
		// id와 pw는 request객체에 있던 값들(사용자 입력값들)
		if(param1.equals(id) && param2.equals(pw)) {
			message = "로그인 성공했습니다.";
		}else {
			message = "로그인 실패했습니다.";
		}
		out.print(message);
		// 필터가 여러개이면 다음 필터로 request/response객체를 전달해줌
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		System.out.println("Filter02 해제...");
	}
}
