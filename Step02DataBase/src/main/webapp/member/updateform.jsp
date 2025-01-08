<%@ page import="test.member.dao.MemberDao" %>
<%@ page import="test.member.dto.MemberDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	// GET 방식 파라미터로 전달되는 회원 번호 추출 (updateform.jsp?num=x)
    // URL에서 전달된 num 값을 받아오기
    int num = Integer.parseInt(request.getParameter("num"));
	
	// num에 해당하는 회원정보를 MemberDao 객체를 이용해서 얻어온다.
    // num을 통해 회원 정보를 DB에서 가져오기
    MemberDto dto = new MemberDao().getData(num);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 수정</title>
</head>
<body>
	<div class="container">
	    <h1>회원 수정</h1>
	    <form action="${pageContext.request.contextPath }/member/update.jsp" method="post">
	    	<div>
		        <!-- 수정할 회원의 num 값을 hidden 필드로 전달 -->
		        <input type="hidden" name="num" value="<%= dto.getNum() %>">
		    </div>
		    <div>    
		        <label for="name">이름:</label>
		        <input type="text" id="name" name="name" value="<%= dto.getName() %>" required>
		        <br><br>
			</div>
			<div>	        
		        <label for="addr">주소:</label>
		        <input type="text" id="addr" name="addr" value="<%= dto.getAddr() %>" required>
		        <br><br>
	        </div>
	        <button type="submit">수정</button>
	        <button type="reset">취소</button>
	    </form>
    </div>
</body>
</html>
