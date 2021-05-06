<%@page import="dao_vo.BoardDB"%>
<%@page import="dao_vo.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//select와 word 값을 받아, BoardDB 클래스의 list1 메서드에 입력 
String select = request.getParameter("select");
String word = request.getParameter("word");
BoardDB db = new BoardDB();
ArrayList<BoardVO> list1 = db.list1(select,word);


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
	color: black;
	text-align: center;
	display: inline-block;
	font-size: 12px;
	margin: 10px;
	margin-left: 1050px;
}.button1 {
	background-color: #dddddddd;
	color: black;
	text-align: center;
	display: inline-block;
	font-size: 12px;
	margin: 10px;
	margin-left: 500px;
}
</style>
</head>
<body>
	<p style="margin-left: 950px; font-family: courier; font-size: 40px;">나의
		여행기</p>
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
						for (int i = 0; i < list1.size(); i++) {
						BoardVO bag2 = list1.get(i);
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
