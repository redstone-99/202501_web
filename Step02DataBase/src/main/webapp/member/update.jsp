<%@ page import="test.member.dao.MemberDao" %>
<%@ page import="test.member.dto.MemberDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    //1. 폼에서 전송되는 수정할 회원의 번호, 이름, 주소를 추출한다.
    int num = Integer.parseInt(request.getParameter("num"));
    String name = request.getParameter("name");
    String addr = request.getParameter("addr");

    //2. DB 에 수정 반영한다.
    MemberDto dto = new MemberDto(num, name, addr);
    boolean isSuccess = new MemberDao().update(dto);
    
    //3. MemberDao 객체를 이용해 DB 업데이트 처리
   /*  MemberDao dao = new MemberDao();
    boolean result = dao.update(dto); */

    /* if (isSuccess) {
        out.println("회원 정보가 수정되었습니다.");
    } else {
        out.println("회원 정보 수정에 실패했습니다.");
    } */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/update.jsp</title>
</head>
<body>
	<script>
		<%if(isSuccess) {%>
			//알림창을 띄우고
	        alert("회원 정보가 수정되었습니다.");
			//list.jsp 페이지로 이동한다.
	        location.href="list.jsp"
	    <%}else {%>
			//알림창을 띄우고
	    	alert("회원 정보 수정에 실패했습니다.");
			//updateform.jsp 페이지로 이동하면서 num 이라는 파라미터명으로 수정할 회원의 번호를 가지고 간다.
	    	location.href="updateform.jsp?num=<%=num%>";
	    <%}%>
	</script>
</body>
</html>
