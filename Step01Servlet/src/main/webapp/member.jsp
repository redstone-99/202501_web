<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="test.dto.MemberDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//DB 에서 읽어온 회원 목록이라고 가정하자
	MemberDto dto = new MemberDto(1, "정홍석", "수원");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p> 번호 <strong><%=dto.getNum() %></strong></p>
	<p> 번호 <strong><%=dto.getName() %></strong></p>
	<p> 번호 <strong><%=dto.getAddr() %></strong></p>
</body>
</html>