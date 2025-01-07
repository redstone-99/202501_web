<%@ page import="test.member.dao.MemberDao" %>
<%@ page import="test.member.dto.MemberDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // URL에서 전달된 num 값을 받아오기
    String numStr = request.getParameter("num");
    int num = Integer.parseInt(numStr);

    // num을 통해 회원 정보를 DB에서 가져오기
    MemberDao dao = new MemberDao();
    MemberDto member = dao.getMemberById(num);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 수정</title>
</head>
<body>
    <h1>회원 수정</h1>
    <form action="${pageContext.request.contextPath }/member/update.jsp" method="post">
        <!-- 수정할 회원의 num 값을 hidden 필드로 전달 -->
        <input type="hidden" name="num" value="<%= member.getNum() %>">
        
        <label for="name">이름:</label>
        <input type="text" id="name" name="name" value="<%= member.getName() %>" required>
        <br><br>
        
        <label for="address">주소:</label>
        <input type="text" id="address" name="address" value="<%= member.getAddr() %>" required>
        <br><br>
        
        <input type="submit" value="수정">
    </form>
</body>
</html>
