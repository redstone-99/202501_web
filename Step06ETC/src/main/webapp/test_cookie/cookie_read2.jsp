<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//HttpServletRequest 객체를 이용해서 요청과 함께 전달된 쿠키 읽어내기
	Cookie[] cooks=request.getCookies();
	//"saveMsg" 라는 키값으로 저장된 문자열을 저장할 변수
	String saveMsg=null;
	for(Cookie tmp:cooks){
		String key=tmp.getName();
		//만일 우리가 찾는 키값이라면
		if(key.equals("saveMsg")){
			//해당 키값으로 저장된 value 를 읽어온다.
			saveMsg=tmp.getValue();
		}
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test_cookie/cookie_read2.jsp</title>
</head>
<body>
	<p>saveMsg 라는 키값으로 저장된 문자열 : <%=saveMsg %></p>
	<%-- EL 을 활용하면 아래와 같다 --%>
	<p>saveMsg 라는 키값으로 저장된 문자열 : ${cookie.saveMsg.value }</p>
	<a href="cookie_form.jsp">다시 테스트</a>
	<br />
	<a href="cookie_delete.jsp">쿠키 삭제</a>
</body>
</html>