<%@page import="dao_vo.MemberDB"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
        	//입력해서 전송된 데이터를 받아야 한다.
            String id = request.getParameter("id");

            
            //db전담하는 부품에서 db에 넣어달라고 할 예정.
            MemberDB db = new MemberDB();
            db.delete(id);
            
            session.invalidate();
            out.println("<script>alert('회원정보가 삭제되었습니다.');</script>");
        	out.println("<script>location.href='mainpage.jsp';</script>");
            
    %>
   