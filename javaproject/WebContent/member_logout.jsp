<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    //session.removeAttribute("id"); 아이디만 끊김
    session.invalidate();
    
    out.println("<script>alert('로그아웃 되었습니다.');</script>");
	out.println("<script>location.href='mainpage.jsp';</script>");
	System.out.println("로그아웃 처리");;
    %>