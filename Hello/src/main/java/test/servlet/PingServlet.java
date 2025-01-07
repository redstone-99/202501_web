package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
//Ping 요청을 처리 할 Servlet
//이 클래스로 생성된 객체가 tomcat 서버에서 /ping 요청이 오면 직접 응답을 하도록..

//클라이언트가 최초로 "/ping" 요청을 해오면 tomcat 서버가 new PingServlet() 해서 객체를 생성한후에 해당 객체의 service() 메소드를 알아서 호출해 준다.
//이후 다른 클라이언트가 "/ping" 요청을 다시해도 PringServlet 객체를 새로 생성하지 않고 기존에 생성되었던 객체를 다시 사용한다.
//3. 어떤 요청이 왔을때 이 클래스로 생성된 객체로 응답을 할지 정해야 한다
@WebServlet("/ping")	//contextpath 경로 X
public class PingServlet extends HttpServlet{//1. HttpServlet 클래스를 상속 받는다.
	
	//2. service() 메소드를 오버라이딩 한다.
	@Override
	//요청에 대한 정보를 가지고 있는 HttpServletRequest
	//응답에 관련된 정보를 가지고 있는 HttpServletResponse
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//클라이언트에게 문자열을 출력할수 있는 객체를 얻어낸다.
		PrintWriter pw=response.getWriter();
		//이 객체를 이용해서 출력하는 문자열은 요청을 한 클라이언트에게 출력된다.
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8'>");
		pw.println("<title>나의페이지</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<h1>pong!</h1>");
		pw.println("</body>");
		pw.println("</html>");
		//pw.println("pong!");
		pw.close();
	}
}
