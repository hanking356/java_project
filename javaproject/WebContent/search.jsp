<%@page import="dao_vo.BookVO"%>
<%@page import="dao_vo.BookDB"%>
<%@page import="dao_vo.DramaVO"%>
<%@page import="dao_vo.DramaDB"%>
<%@page import="dao_vo.MovieDB"%>
<%@page import="dao_vo.MovieVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String search = request.getParameter("search");

MovieDB mdb = new MovieDB();
MovieVO bag2 = mdb.read(search);
DramaDB ddb = new DramaDB();
DramaVO bag3 = ddb.read(search);
BookDB bdb = new BookDB();
BookVO bag4 = bdb.read(search);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>더 조은 관광지</title>
<link rel="stylesheet" type="text/css" href="design.css">
</head>
<body>
	<%
		if (session.getAttribute("id") == null) {
	%>
	<div id="ip">
		<a href="login.jsp">로그인</a> / <a href="signup.jsp">회원가입</a>
	</div>
	<%
		} else {
	%>
	<div id="ip">
		<a href="read.jsp">개인정보</a> / <a href="logout.jsp">로그아웃</a>
	</div>
	<%
		}
	%>
	<div>
		<form action="search.jsp">
			<input type="text" name="search"
				style="text-align: center; width: 800px; height: 50px; font-size: 30px;">
			<button
				style="text-align: center; width: 80px; height: 50px; font-size: 20px;">검색</button>
			<br>
			<br>
		</form>
		<div id="tit">
			<a href="movie_main.jsp">영화</a> <a href="drama_main.jsp">드라마</a> <a
				href="book_main.jsp">소설</a> <a href="board_main.jsp">후기게시판</a>
		</div>
	</div>

<% if(bag2.getTitle() == null) { %>
<br>영화에서는 검색되지 않았습니다
<%} else {%>
	<a href="page.jsp?title=<%=search%>"
		title="<%=search%>"><img
		src="pic/<%=search%>_pic.jpg" width=300 height="300"></a>
<%} %>
<% if(bag3.getTitle() == null) { %>
<br>드라마에서는 검색되지 않았습니다
<%} else {%>
	<a href="page2.jsp?title=<%=search%>"
		title="<%=search%>"><img
		src="pic/<%=search%>_pic.jpg" width=300 height="300"></a>
<%} %>
<% if(bag4.getTitle() == null) { %>
<br>소설에서는 검색되지 않았습니다
<%} else {%>
	<a href="page3.jsp?title=<%=search%>"
		title="<%=search%>"><img
		src="pic/<%=search%>_pic.jpg" width=300 height="300"></a>
<%} %>
	<div>
		<div id="cs">cs senter 1579-1234</div>
	</div>
</body>
</html>