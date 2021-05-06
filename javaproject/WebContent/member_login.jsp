<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
body{font-family: 'Jua', sans-serif;}
form {
border: 3px solid #f1f1f1;
width: 500px;
margin-left:auto;
margin-right:auto;
}

input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

button:hover {
  opacity: 0.8;
}

.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
}

img.avatar {
  width: 40%;
  border-radius: 50%;
}

.container {
  padding: 16px;
}

span.psw {
  float: right;
  padding-top: 16px;
}

@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}
</style>
</head>
<body>

<h2 align="center">프로젝트 Login</h2>

<%if (session.getAttribute("id") == null) {%>
<form action="login_check.jsp">
  <div class="imgcontainer">
  </div>

  <div class="container">
    <label for="id"><b>아이디</b></label>
    <input type="text" placeholder="아이디를 입력하세요." name="id" id="id" required>

    <label for="pw"><b>패스워드</b></label>
    <input type="password" placeholder="비밀번호를 입력하세요." name="pw" id="pw" required>

    <button type="submit">로그인</button>
    <label>
      <input type="checkbox" checked="checked" name="remember"> 기억하기
    </label>
  </div>

  <div class="container" style="background-color:#f1f1f1">
    <button type="button" class="cancelbtn" onclick="location.href='mainpage.jsp'">취소하기</button>
    <span class="psw">비밀번호 <a href="#"> 찾기 </a></span>
  </div>
</form>
<%
		} else {
	%>
	<%=session.getAttribute("id")%>님 환영합니다
	<a href="logout.jsp">로그아웃</a>
	<%
		}
	%>

</body>
</html>
