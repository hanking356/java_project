<%@page import="dao_vo.MemberVO"%>
<%@page import="dao_vo.MemberDB"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	//입력해서 전송된 데이터를 받아야 한다.
        String id = (String)session.getAttribute("id");
        
        //db전담하는 부품에서 db에 넣어달라고 할 예정.
        MemberDB db = new MemberDB();
        //1.bag변수 미리 만들어두었다가
        //2.read한 결과를 만들어두었던 bag에 넣음.
        MemberVO bag = db.read(id);
        
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<style>

@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
body{font-family: 'Jua', sans-serif;}

#wrap {
	width: 700px;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
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
	<h2>회원 정보 조회 화면입니다.</h2>
	<hr color="#DA81F5">
	<div id="wrap">
		<br> <br> <b><font size="6" color="gray">회원정보</font></b> <br>
		<br> <br>
		<!-- form태그는 값을 입력하고 싶을 때 사용 -->
		<!-- 입력값들은 모두 form들어가야 한다. -->
		<!-- action: 입력값을 받아서 처리하는 다음 페이지를 지정 -->
		<form name="mypage" enctype="text/plain">
			<table align = center>
				<tr>
					<td id="title" width="180px" align="center">아이디</td>
					<td align="left"><input type="text" name="id" id="id" value = <%= bag.getId() %>
						 readonly> </td>
				</tr>
				<tr>
					<td id="title" align="center">비밀번호</td>
					<td align="left"><input type="password" name="pw" id="pw" value = <%= bag.getPw() %>
						 readonly> <br></td>
				</tr>
				<tr>
					<td id="title" align="center">이름</td>
					<td align="left"><input type="text" name="name" id="name" value = <%= bag.getName() %>
						 readonly ></td>
				</tr>
				<tr>
					<td id="title" align="center">닉네임</td>
					<td align="left"><input type="text" name="nickname" id="nickname" value = <%= bag.getNickname() %>
						id="nickname" readonly ></td>
				</tr>
				<tr>
					<td id="title" align="center">전화번호</td>
					<td align="left"><input type="text" name="phone" id="phone" value = <%= bag.getPhone() %>
						readonly></td>
				</tr>
				<tr>
					<td id="title" align="center">주소</td>
					<td align="left"><input type="text" name="address" id="address" value = <%= bag.getAddress() %> readonly>
					</td>
				</tr>
				<tr>
					<td id="title" align="center">이메일</td>
					<td align="left"><input type="text" name="email" id="email" value = <%= bag.getEmail() %>
						readonly></td>
				</tr>
			</table>
			<button type="submit" formaction="member_update.jsp">수정하기</button> / 
			<button type="submit" formaction="member_delete.jsp">탈퇴하기</button>
		</form>
	</div>
</body>
</html>