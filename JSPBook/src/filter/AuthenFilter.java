package filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class AuthenFilter implements Filter {
	
	@Override
	public void init(FilterConfig FilterConfig) throws ServletException {
		System.out.println("Filter01 초기화..");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterchain)
			throws IOException, ServletException {
		System.out.println("Filter01.jsp 수행...");
		request.setCharacterEncoding("utf-8");
		
		// 요청 URI : /ch12/filter01_process.jsp?name=jsg
		String name = request.getParameter("name");
		
		if(name == null || "".equals(name)) {
			// 톰켓에서 크롬으로 응답해주는 response객체의 인코딩을 utf-8로 세팅
			// 한글을 보내기 위함
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			
			PrintWriter out = response.getWriter();
			String message = "입력된 name 값이 null입니다.";
			out.println(message);
			return;
		}
		filterchain.doFilter(request, response);
	}
	
	@Override
	public void destroy() {
		System.out.println("Filter01 해제...");
	}

}
