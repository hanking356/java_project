<%@page import="dao_vo.MemberDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");

MemberDB db = new MemberDB();
boolean result = db.check(id, pw);
//세션이 유지되는 동안 쓸 수 있도록 해야함
if(result){
session.setAttribute("id", id);
out.println("<script>alert('로그인 성공. 환영합니다.');</script>");
out.println("<script>location.href='mainpage.jsp';</script>");
}
else{
	out.println("<script>alert('로그인 실패. ID와 비밀번호를 다시 확인해주세요.');</script>");
	out.println("<script>location.href='member_login.jsp';</script>");
	System.out.println("로그인 실패");
}
%>