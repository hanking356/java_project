<%@page import="dao_vo.BoardDB"%>
<%@page import="dao_vo.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	BoardDB db = new BoardDB();
ArrayList<BoardVO> list = db.list();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
tr:nth-child(even) {
	background-color: #dddddddd;
}
a, a:hover{
	color:black;
	text-decoration:none;
}
.button {
	background-color: #dddddddd;
	border: 1px;
	color: black;
	padding: 10px 20px;
	text-align: center;
	display: inline-block;
	font-size: 12px;
	margin: 10px;
	margin-left: 1050px;
}
</style>
</head>
<body>
	<p style="margin-left: 950px; font-family: courier; font-size: 40px;">나의 여행기</p>
	<!--제목/내용 또는 작성자 검색, select는 검색 분류 값, word는 입력 값 -->
	<form action="board_main_search.jsp">
	<select name = "select" style="margin-left: 550px;">
		<option value="title_content">제목/내용</option>
		<option value="writer">작성자</option>
	</select>
	<input type="text" name="word" size="30">
	<input type="submit" value="검색버튼">
	
       </form>   	
	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; width: 800px; height: 100px; margin: auto; text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th
							style="background-color: #eeee; text-align: center; font-size: 20px;">번호</th>
						<th
							style="background-color: #eeee; text-align: center; font-size: 20px;">제목</th>
						<th
							style="background-color: #eeee; text-align: center; font-size: 20px;">작성자</th>
						<th
							style="background-color: #eeee; text-align: center; font-size: 20px;">날짜</th>
						<th
							style="background-color: #eeee; text-align: center; font-size: 20px;">조회수</th>
					</tr>
				</thead> 
				<tbody>
					<%
						for (int i = 0; i < list.size(); i++) {
						BoardVO bag2 = list.get(i);
					%>
					<tr>
						<td><%=bag2.getId()%></td>
						<td><a href="board_read_db.jsp?id=<%=bag2.getId()%>"><%=bag2.getTitle()%></a></td>
						<td><%=bag2.getWriter()%></td>
						<td><%=bag2.getDate()%></td>
						<td><%=bag2.getClicks()%></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
	</div>
	<a href="board_create.jsp">
		<button type="button" class="button">게시글 작성</button>
	</a>
	<a href="mainpage.jsp">
		<button type="button" class="button">메인페이지로</button>
	</a>
</body>
</html>
