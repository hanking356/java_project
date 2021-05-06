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
	margin: 10px;
	margin-left: 1100px;
}
</style>
</head>
<body>
	<p style="margin-left:900px; font-family: courier; font-size: 40px;">여행
		후기 수정</p>
	<form action="board_update_db.jsp">
	<input type="hidden" name="id" value="<%= id %>">
		<div class="container">
			<div class="row">
				<table class="table table-striped"
					style="text-align: center; width: 800px; height: 100px; margin: auto; text-align: center border: 1px solid #dddddd">
					<tr>
						<td style="width: 20%;">지역</td>
						<td><select name="local">
								<option value="유럽">유럽</option>
								<option value="아프리카">아프리카</option>
								<option value="아시아">아시아</option>
								<option value="북아메리카">북아메리카</option>
								<option value="남아메리카">남아메리카</option>
						</select></td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input value="<%= bag.getTitle()%>" name="title" size="95"></td>
					</tr>
					<tr>
						<td>만족도</td>
						<td><input type="radio" value="추천" name="degree">추천 <input
							type="radio" value="보통" name="degree">보통 <input
							type="radio" value="비추천" name="degree">비추천</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><input name="writer"
							value="<%=session.getAttribute("id")%>" readonly="readonly"></td>
					</tr>
					<tr>
						<td>본문</td> 
						<td><textarea rows="20" cols="97" name="content"><%= bag.getContent()%></textarea></td>
					</tr>
					</tbody>
				</table>
			</div>
		</div>
			<button class="button">작성완료</button>
	</form>
</body>
</html>