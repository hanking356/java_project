<%@page import="java.util.ArrayList"%>
<%@page import="dao_vo.BoardVO"%>
<%@page import="dao_vo.BoardDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//입력해서 전송된 데이터를 받아야 한다.
String id = request.getParameter("id");

//db전담하는 부품에서 db에 넣어달라고 할 예정.
BoardDB db = new BoardDB();
BoardVO bag = db.read(id);
ArrayList<BoardVO> list = db.list();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
tr:nth-child(even) {
	background-color: #dddddd;
}

.button {
	background-color: #dddddddd;
	border: 1px;
	color: black;
	padding: 10px 20px;
	text-align: center;
	display: inline-block;
	font-size: 12px;

}



</style>
</head>
<body>
	<p style="margin-left: 1000px; font-family: courier; font-size: 40px;">여행 후기</p>
	
	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; width: 800px; height: 100px; margin: auto; text-align: center border: 1px solid #dddddd">
				<thead>
				<tr>
						<th colspan="3" style="text-align: left; font-size: 30px;">
						<!--현제 게시글이 2번째 부터 이전글이 보이도록 설정  -->
						<%if(Integer.parseInt(bag.getId())>1) {%>
															<!--연산을 위해 bag.getId()를 정수로 바꾼 후 다시 String으로 변환 -->
							<a href="board_read_db.jsp?id=<%=Integer.toString(Integer.parseInt(bag.getId())-1)%>">
								<button type="button" class="button">이전글</button>
							</a> <%
 							}
							 %>
						<!-- n-1 page까지 다음 글이 보이도록  설정  -->
						<%if(list.size()>Integer.parseInt(bag.getId())) {%>
							<a href="board_read_db.jsp?id=<%=Integer.toString(Integer.parseInt(bag.getId())+1)%>">
								<button type="button" class="button">다음글</button>
							</a> <%
		 				}
		 %>				</th>
					</tr>
					<tr>
						<th colspan="3"
							style="background-color: #eeee; text-align: left; font-size: 30px;"><%=bag.getTitle()%></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">대륙</td>
						<td><%=bag.getLocal()%></td>
					</tr>
					<tr>
						<td>만족도</td>
						<td><%=bag.getDegree()%></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><%=bag.getWriter()%></td>
					</tr>
					<tr>
						<td>본문</td>
						<td
							style="text-align: left; display: inline-block; height: 400px;"><%=bag.getContent()%>
						</td>
					</tr>

					<tr>
						<td colspan="2">
							<%
							String id1 = (String)session.getAttribute("id");
							if (bag.getWriter().equals(id1)) {
							%> <a href="board_update.jsp?id=<%=bag.getId()%>">
								<button type="button" class="button">수정</button>
						</a> <a href="board_delete_db.jsp?id=<%=bag.getId()%>">
								<button type="button" class="button">삭제</button>
						</a> <%
 								}
							 %>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>



