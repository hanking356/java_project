<%@page import="dao_vo.MemberDB"%>
<%@page import="dao_vo.MemberVO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
        	//입력해서 전송된 데이터를 받아야 한다.
        	String id = (String)session.getAttribute("id");
            String pw = request.getParameter("pw");
            String nickname = request.getParameter("nickname");
            String phone = request.getParameter("tel1") + request.getParameter("tel2") + request.getParameter("tel3");
            String address = request.getParameter("address");
            String email = request.getParameter("email");
            
            //1. 가방 만들기
            //2. 가방에 넣기
            MemberVO bag = new MemberVO();
            bag.setId(id);
            bag.setPw(pw);
            bag.setNickname(nickname);
            bag.setPhone(phone);
            bag.setAddress(address);
            bag.setEmail(email);
            
            //db전담하는 부품에서 db에 넣어달라고 할 예정.
            MemberDB db = new MemberDB();
            db.update(bag);
        %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정 완료</title>
<style>

@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
body{font-family: 'Jua', sans-serif;}

#wrap {
	width: 30%;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
	border : 3px solid black
}

table {
	border: 3px solid #DA81F5
}

td {
	border: 1px solid #DA81F5
}

#title {
	background-color: #DA81F5
}
</style>
</head>
<body>
<div id="wrap">
	<%= id %>님의 패스워드가 <%= pw %>,<br>
	<%= id %>님의 닉네임이 <%= nickname %>,<br>
	<%= id %>님의 전화번호가 <%= phone %>,<br>
	<%= id %>님의 주소가 <%= address %>,<br>
	<%= id %>님의 이메일이 <%= email %>,<br>
	로 변경되었습니다.
	<br>
	<a href=mainpage.jsp>메인페이지로 되돌아가기</a>
</div>
</body>
</html>