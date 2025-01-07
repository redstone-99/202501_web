<%@ page import="test.member.dao.MemberDao" %>
<%@ page import="test.member.dto.MemberDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // 폼에서 전달된 파라미터를 받아오기
    String numStr = request.getParameter("num");
    String name = request.getParameter("name");
    String addr = request.getParameter("address");

    int num = Integer.parseInt(numStr);

    // MemberDto 객체 생성
    MemberDto member = new MemberDto();
    member.setNum(num);
    member.setName(name);
    member.setAddr(addr);

    // MemberDao 객체를 이용해 DB 업데이트 처리
    MemberDao dao = new MemberDao();
    boolean result = dao.update(member);

    if (result) {
        out.println("회원 정보가 수정되었습니다.");
    } else {
        out.println("회원 정보 수정에 실패했습니다.");
    }
%>
