<%@page import="dao_vo.MovieDB"%>
<%@page import="dao_vo.MovieVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	MovieDB db = new MovieDB();
	ArrayList<MovieVO> list = db.list();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>더 조은 영화</title>
<link rel="stylesheet" type="text/css" href="design.css">
</head>
<body>
<% if(session.getAttribute("id") == null) { %>
		<div id="ip"><a href="member_login.jsp">로그인</a> / <a href="member_joinform">회원가입</a>
		</div>
		<%}else { %>
		<div id="ip"><a href="read.jsp">개인정보</a> / <a href="logout.jsp">로그아웃</a>
		</div>
		<%} %>
		<div>
			<input type="text" name="search" style="text-align:center; width:800px; height:50px; font-size:30px;">
			<button style="text-align:center; width:80px; height:50px; font-size:20px;">검색</button> <br><br>
			<div id="tit"><a href="movie_main.jsp">영화</a> <a href="drama_main.jsp">드라마</a> <a href="book_main.jsp">소설</a> <a href="board_main.jsp">후기게시판</a>
			</div></div>
	<%
for (int i = 0; i < list.size(); i++) {
   MovieVO bag2 = list.get(i);
%>
			<a href="page.jsp?title=<%=bag2.getTitle() %>" title="<%= bag2.getTitle() %>"><img src="pic/<%= bag2.getTitle() %>_pic.jpg" width=300 height="300"></a>

<% } %>
<div>
			<div id="cs">cs senter 1579-1234
			</div>
		</div>
</body>
</html>