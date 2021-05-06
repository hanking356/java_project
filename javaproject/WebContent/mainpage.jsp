<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>더 조은 관광지</title>
		<link rel="stylesheet" type="text/css" href="design.css">
	</head>
	<body>
	<% if(session.getAttribute("id") == null) { %>
		<div id="ip"><a href="member_login.jsp">로그인</a> / <a href="member_joinform.jsp">회원가입</a>
		</div>
		<%}else { session.getAttribute("id"); %>
		<div id="ip"><a href="member_mypage.jsp">개인정보</a> / <a href="member_logout.jsp">로그아웃</a>
		</div>
		<%} %>
		<div>
			<form action="search.jsp">
			<input type="text" name="search" style="text-align:center; width:800px; height:50px; font-size:30px;">
			<button style="text-align:center; width:80px; height:50px; font-size:20px;">검색</button> <br><br></form>
			<div id="tit"><a href="movie_main.jsp">영화</a> <a href="drama_main.jsp">드라마</a> <a href="book_main.jsp">소설</a> <a href="board_main.jsp">후기게시판</a>
			</div>
			<div id="cs">cs senter 1579-1234
			</div>
		</div>
	</body>
</html>