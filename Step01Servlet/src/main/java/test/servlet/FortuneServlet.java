package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
/*
 * 	1. context path 는 생략한다.
 * 	2. 반드시 / 로 시작한다.
 */
@WebServlet("/fortune")
public class FortuneServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//오늘의 운세를 어떤 로직에 의해서 얻어왔다고 가정하자
		String fortuneToday = "동쪽으로 가면 귀인을 만나요!";
		
		//응답 인코딩 설정
		request.setCharacterEncoding("utf-8");
		//응답 컨텐트 설정
		response.setContentType("text/html; charset=utf-8");
		//요청을 한 클라이언트에게 문자열을 출력할수 있는 객체
		response.getWriter().println("<!doctype html>");
		response.getWriter().println("<html>");
		response.getWriter().println("<head>");
		response.getWriter().println("<meta charset='utf-8'>");
		response.getWriter().println("<title>오늘의 운세 페이지</title>");
		response.getWriter().println("</head>");
		response.getWriter().println("<body>");
		response.getWriter().println("<p>오늘의 운세:<strong>"+fortuneToday+"</strong></p>");
		response.getWriter().println("</body>");
		response.getWriter().println("</html>");
		response.getWriter().close();
	}
}
