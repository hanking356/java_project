<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%

String id = (String)session.getAttribute("id");
String pw = request.getParameter("pw");
String nickname = request.getParameter("nickname");
String phone = request.getParameter("phone");
String address = request.getParameter("address");
String email = request.getParameter("email");

%>

<script type="text/javascript">

function check(re, what, message) {
	if (re.test(what.value)) {
		return true;
	}
	alert(message);
	what.value = "";
	what.focus();
	// return false;
}

function validate() {
	
	var re = /^[a-zA-Z0-9]{4,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
	var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	// 이메일이 적합한지 검사할 정규식

	var upw = document.getElementById("upw");
	var upw2 = document.getElementById("upw2");
	var unickname = document.getElementById("unickname");
	var utel1 = document.getElementById("utel1");
	var utel2 = document.getElementById("utel2");
	var utel3 = document.getElementById("utel3");
	var uemail = document.getElementById("uemail");

	
	if (!check(re, upw, "패스워드는 4~12자의 영문 대소문자와 숫자로만 입력해주세요.")) {
		return false;
	}

	if (update.upw.value != update.upw2.value) {
		alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
		update.upw2.value = "";
		update.upw2.focus();
		return false;
	}
		
	if (utel1.value == "" || utel1.value.length != 3 || utel2.value =="" || utel2.value.length != 4 || utel3.value == "" || utel3.value.length != 4 )
	{
		alert("올바른 전화번호를 입력해주세요")
		tel1.focus();
		return false;
	}
	
		if (!check(re2, uemail, "적합하지 않은 이메일 형식입니다.")) {
		return false;
	}

	
	alert("회원정보 수정이 완료되었습니다.");
}

</script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 수정</title>
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
	<h2>회원 정보 수정 화면입니다.</h2>
	<hr color="#DA81F5">
	<div id="wrap">
		<br> <br> <b><font size="6" color="gray">정보수정</font></b> <br>
		<br> <br>
		<!-- form태그는 값을 입력하고 싶을 때 사용 -->
		<!-- 입력값들은 모두 form들어가야 한다. -->
		<!-- action: 입력값을 받아서 처리하는 다음 페이지를 지정 -->
		<form name="update" onsubmit = "return validate();" action = member_updateDB.jsp>
			<table align = center>
				<tr>
					<td id="title" width="180px" height="50px" align="center">아이디*<br>
					<span style="font-size: 7px;">※(수정불가)</span></td>
					<td align="left">
					<input type="text" name="id" id="uid" value="<%= id%>" readonly>
					</td>
				</tr>
				<tr>
					<td id="title" align="center" >비밀번호</td>
					<td align="left"><input type="password" name="pw" id="upw" maxlength = 20 value=<%= pw%> required >
					<br><span style="font-size: 7px;">※비밀번호는 4~20자의 영문 대소문자와 숫자로만 입력</span>
					</td>
				</tr>
				<tr>
					<td id="title" align="center">비밀번호 확인</td>
					<td align="left"><input type="password" name="pw2" id="upw2" maxlength = 20 value=<%= pw%> required >
					</td>
				</tr>
				<tr>
					<td id="title" align="center">닉네임</td>
					<td align="left"><input type="text" name="nickname" id="unickname" value=<%= nickname%> maxlength = 20 required >
						</td>
				</tr>
				<tr>
					<td id="title" align="center">전화번호</td>
					<td align="left"><input type="hidden" name="phone" id="uphone">
						<input type="text" name="tel1" id="utel1" size="1" maxlength="3" value="" required>
						- <input type="text" name="tel2" id="utel2" size="3" maxlength="4" value="" required >
						- <input type="text" name="tel3" id="utel3" size="3" maxlength="4" value="" required >
					</td>
				</tr>
				<tr>
					<td id="title" align="center">주소</td>
					<td align="left"><input type="text" name="address" id="uaddress" value=<%= address%> maxlength = 20 required >
					</td>
				</tr>
				<tr>
					<td id="title" align="center">이메일</td>
					<td align="left"><input type="text" name="email" id="uemail" value=<%= email%> maxlength = 20 required >
					</td>
				</tr>
			</table>
			<br> <input type="submit" value="수정완료"></a>  /  
			<a href="member_mypage.jsp"><input type="button" value="되돌아가기"></a>
		</form>
	</div>
</body>
</html>