<%@page import="dao_vo.BoardDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
    	
    //입력해서 전송된 데이터를 받아야 한다.
    String id = request.getParameter("id");
       
    //db전담하는 부품에서 db에 넣어달라고 할 예정.
    BoardDB db = new BoardDB();
    db.delete(id);
    
  
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/site.js"></script>
<script type="text/javascript">
site('삭제')
</script>
</head>
<body>

</body>
</html>