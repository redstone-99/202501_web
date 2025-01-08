<%@page import="test.food.dao.FoodDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. GET 방식 파라미터로 전달되는 삭제할 맛집의 번호를 얻어온다.
	int num = Integer.parseInt(request.getParameter("num"));
	//2. MemberDao 객체를 이용해서 실제 DB 에서 삭제
	new FoodDao().delete(num);
	//3. 응답하기
	//특정 경로로 요청을 다시 하라는 리다이렉트 응답하기
	//list.jsp => delete.jsp => list.jsp 이런 이동이기 때문에 마치 새로 고침하는 듯한 느낌을 줄수 있다.
	
	//context path 는 HttpServletRequest 객체를 이용해서 얻어낸다음 사용해야 한다.
	String cPath=request.getContextPath();
	response.sendRedirect(cPath+"/food/list.jsp");
%>
