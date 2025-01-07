package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/friends")
public class FriendsServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//DB 에서 읽어온 친구 목록이라고 가정하자
		List<String> names=new ArrayList<>();
		names.add("정홍석");
		names.add("정이선");
		names.add("이승민");
		
		//names 객체에 들어 있는 친구목록을 ul , li 요소를 이용해서 출력해 보세요.
		
		//응답 인코딩 설정
		request.setCharacterEncoding("utf-8");
		//응답 컨텐트 설정
		response.setContentType("text/html; charset=utf-8");
		//요청을 한 클라이언트에게 문자열을 출력할수 있는 객체
		PrintWriter pw = response.getWriter();
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8'>");
		pw.println("<title></title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<h1>친구목록1</h1>");
		pw.println("<ul>");
		for (String tmp : names) {
			pw.println("<li>" + tmp + "</li>");
        }
		pw.println("</ul>");
		
		pw.println("<h1>친구목록2</h1>");
		pw.println("<ul>");
		for (int i=0; i < names.size(); i++) {
			pw.println("<li>" + names.get(i) + "</li>");
        }
		pw.println("</ul>");
		
		pw.println("</body>");
		pw.println("</html>");
		pw.close();
	}
}
