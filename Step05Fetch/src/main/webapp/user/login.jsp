<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- /user/login.jsp --%>
<%
	//요청 파라미터 추출
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	//아이디 비밀번호가 유효한지 여부
	boolean isValid = false;
	//아이디는 hong 비밀번호는 1234 가 유효한 정보라고 가정하자
	if(id.equals("hong") && pwd.equals("1234")){
		isValid=true;
	}
%>
{"isSuccess": <%=isValid %>}