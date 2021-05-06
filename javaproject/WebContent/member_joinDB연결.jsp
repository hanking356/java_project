<%@page import="dao_vo.MemberDB"%>
<%@page import="dao_vo.MemberVO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

		<%
				//입력해서 전송된 데이터를 받아야 한다.
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String name = request.getParameter("name");
			String nickname = request.getParameter("nickname");
			String phone = request.getParameter("tel1") + request.getParameter("tel2") + request.getParameter("tel3");
			String address = request.getParameter("address");
			String email = request.getParameter("email");
			
			//1. 묶음(가방)을 만들어라!
			MemberVO bag = new MemberVO();
			//2. 가방에 넣어라!
			bag.setId(id);
			bag.setPw(pw);
			bag.setName(name);
			bag.setNickname(nickname);
			bag.setPhone(phone);
			bag.setAddress(address);
			bag.setEmail(email);
			
			//3. db전담하는 부품에서 db에 넣어달라고 할 예정.
			MemberDB db = new MemberDB();
			//4. db.create(id, pw, name, nickname, phone, address, email);
			//대신, 아래의 가방을 사용한다.
			db.create(bag);
		%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 완료</title>
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
<style>
@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
body{font-family: 'Jua', sans-serif;}
</style>
<body>
<div id="wrap">
	입력하신 정보로,
	<br> 회원 가입이 완료되었습니다.<br>
	<a href="login.jsp">로그인 하기</a><br>
	<a href="mainpage.jsp">메인 페이지로 이동</a>
</div>
</body>
</html>