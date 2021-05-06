<%@page import="dao_vo.BoardDB"%>
<%@page import="dao_vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//입력해서 전송된 데이터를 받아야 한다.
String id = request.getParameter("id");
String title = request.getParameter("title");
String writer = request.getParameter("writer");
String content = request.getParameter("content");
String local = request.getParameter("local");
String degree = request.getParameter("degree");

/*  db.create(id, pw, name, tel); */
//1.가방을 만들어라.
BoardVO bag = new BoardVO();
//가방에 넣어라!
bag.setId(id);
bag.setTitle(title);
bag.setWriter(writer);
bag.setContent(content);
bag.setLocal(local);
bag.setDegree(degree);

//db전담하는 부품에서 db에 넣어달라고 할 예정.
BoardDB db = new BoardDB();
db.update(bag);
/* response.sendRedirect("board_main.jsp"); */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/site.js"></script>
<script type="text/javascript">
	site('수정')
</script>
</head>
<body>

</body>
</html>