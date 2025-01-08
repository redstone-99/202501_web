<%@page import="test.food.dao.FoodDao"%>
<%@page import="test.food.dto.FoodDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    //1. 폼에서 전송되는 수정할 맛집의 번호, 종류, 이름, 가격을 추출한다.
    int num = Integer.parseInt(request.getParameter("num"));
	String type = request.getParameter("type");
    String name = request.getParameter("name");
    int price = Integer.parseInt(request.getParameter("price"));

    //2. DB 에 수정 반영한다.
    FoodDto dto = new FoodDto(num, type, name, price);
    boolean isSuccess = new FoodDao().update(dto);
    
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
<title>/food/update.jsp</title>
</head>
<body>
	<div class="container">
		<h3>알림</h3>
		<%if(isSuccess){ %>
			<p>
				음식 정보를 수정 했습니다. 
				<a href="list.jsp">확인</a>
			</p>
		<%}else{ %>
			 <p>
			 	음식 정보 수정 실패!
			 	<a href="updateform.jsp?num=<%=num %>">다시 수정하러 가기</a>
			 </p>
		<%} %>
	</div>
</body>
</html>
