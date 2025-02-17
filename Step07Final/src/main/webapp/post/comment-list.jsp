<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="test.post.dao.CommentDao"%>
<%@page import="java.util.List"%>
<%@page import="test.post.dto.CommentDto"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// /post/comment-list./jsp  
	
	//댓글의 페이지 번호
	int pageNum=Integer.parseInt(request.getParameter("pageNum"));
	//원글의 글번호
	long postNum=Long.parseLong(request.getParameter("postNum"));
	
	CommentDto dto=new CommentDto();
	dto.setPostNum(postNum);
	/*
	[ 댓글 페이징 처리에 관련된 로직 ]
	*/
	//한 페이지에 댓글을 몇개씩 표시할 것인지
	final int PAGE_ROW_COUNT=10;
	
	//보여줄 페이지의 시작 ROWNUM
	int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
	//보여줄 페이지의 끝 ROWNUM
	int endRowNum=pageNum*PAGE_ROW_COUNT;
	//계산된 값을 dto 에 담는다
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	
	//전체 댓글의 갯수
	int totalRow=CommentDao.getInstance().getCount(postNum);
	//전체 페이지의 갯수 구하기
	int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	
	//pageNum 에 해당하는 댓글 목록을 얻어낸다.
	List<CommentDto> list=CommentDao.getInstance().getList(dto);
	//Gson 객체에 전달할 Map 객체를 구성한다.
	Map<String, Object> map=new HashMap<>();
	map.put("list", list);
	map.put("totalPageCount", totalPageCount);
	
	Gson gson=new Gson();
%>    
<%=gson.toJson(map) %>