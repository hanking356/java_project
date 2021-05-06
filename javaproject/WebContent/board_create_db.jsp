<%@page import="dao_vo.BoardVO"%>
<%@page import="dao_vo.BoardDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
    	//입력해서 전송된 데이터를 받아야 한다.
        String local = request.getParameter("local");
    	String title = request.getParameter("title");     
        String content = request.getParameter("content");
        String writer = request.getParameter("writer");
        String degree = request.getParameter("degree");
      
        /*  db.create(id, pw, name, tel); */ 
        //가방을 만들어라.
        BoardVO bag = new BoardVO();
        //가방에 넣어라!
        bag.setTitle(title);
        bag.setContent(content);
        bag.setWriter(writer);
        bag.setLocal(local);
        bag.setDegree(degree);
       
        //db전담하는 부품에서 db에 넣어달라고 할 예정.
        BoardDB db = new BoardDB();
        db.create(bag);
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/site.js"></script>
<script type="text/javascript">
site('등록')
</script>
</head>
<body>

</body>
</html>
