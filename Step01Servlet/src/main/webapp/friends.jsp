<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<String> names=new ArrayList<>();
	names.add("정홍석");
	names.add("장희주");
	names.add("곽래희");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>webapp/friends.jsp</title>
</head>
<body>
	<h1>친구목록2</h1>
	<ul>
		<% 
            for (int i = 0; i < names.size(); i++) {
                out.print("<li>" + names.get(i) + "</li>");
            }
		%>
	</ul>
	<h2>친구목록3</h2>
	<ul>
		<% for (String tmp : names) {%>
			<li><%=tmp%></li>	
		<%}%>
    </ul>
</body>
</html>