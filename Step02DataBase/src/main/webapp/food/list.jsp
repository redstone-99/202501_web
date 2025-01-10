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
<jsp:include page="/include/resource.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="food" name="current"/>
	</jsp:include>
	<div class="container">
		<a href="insertform.jsp">맛집추가</a>
		<br>
		<a href="/Step02DataBase/food/insertform.jsp">맛집추가2</a>
		<br>
		<a href="${pageContext.request.contextPath }/food/insertform.jsp">맛집추가3</a>
		<h1>맛집 목록입니다.</h1>
		<table class="table table-bordered">
			<thead class="table-dark">
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
						<td><a href="updateform.jsp?num=<%= tmp.getNum() %>">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
  								<path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
  								<path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/>
							</svg>
						</a></td>
						<td><a href="javascript: deleteConfirm(<%= tmp.getNum() %>)">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
  								<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0z"/>
  								<path d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4zM2.5 3h11V2h-11z"/>
							</svg>
						</a></td>
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