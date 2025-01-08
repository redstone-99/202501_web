<%@page import="test.food.dto.FoodDto"%>
<%@page import="test.food.dao.FoodDao"%>
<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//FoodDao 객체를 이용해서 맛집 목록 얻어오기
	FoodDao dao = new FoodDao();
	List<FoodDto> list=dao.getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/list.jsp</title>
</head>
<body>
	<div class="container">
		<a href="insertform.jsp">맛집추가</a>
		<br>
		<a href="/Step02DataBase/food/insertform.jsp">맛집추가2</a>
		<br>
		<a href="${pageContext.request.contextPath }/food/insertform.jsp">맛집추가3</a>
		<h1>맛집 목록입니다.</h1>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>종류</th>
					<th>이름</th>
					<th>가격</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<% for(FoodDto tmp : list) {%>
					<tr>
						<td><%= tmp.getNum() %></td>
						<td><%= tmp.getType() %></td>
						<td><%= tmp.getName() %></td>
						<td><%= tmp.getPrice() %></td>
						<td><a href="updateform.jsp?num=<%= tmp.getNum() %>">수정</a></td>
						<td><a href="javascript: deleteConfirm(<%= tmp.getNum() %>)">삭제</a></td>
					</tr> 
				<%}%>
			</tbody>
		</table>
	</div>
	<script>
		function deleteConfirm(num){
			const isDelete = confirm("삭제할까요?");
			//확인을 눌렀을때만 delete.jsp 페이지로 이동하도록 한다.
			if(isDelete){
				// javascript 를 이용해서 페이지 이동
				location.href = "delete.jsp?num="+num;
			}
		}
	</script>
</body>
</html>