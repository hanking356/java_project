<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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

function idCheck(){
 	//아이디 중복화인
 	window.open("idCheck.jsp","idwin","width=400 height=350")
 }
	
function idcheck2(){
	document.join.idUncheck.value = "idCheck";
}

function validate() {
	
	var re = /^[a-zA-Z0-9]{4,20}$/ 
	// 아이디와 패스워드가 적합한지 검사할 정규식
	var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	// 이메일이 적합한지 검사할 정규식

	var id = document.getElementById("id");
	var pw = document.getElementById("pw");
	var pw2 = document.getElementById("pw2");
	var email = document.getElementById("email");
	var name = document.getElementById("name");
	var tel1 = document.getElementById("tel1");
	var tel2 = document.getElementById("tel2");
	var tel3 = document.getElementById("tel3");

	if (join.idUncheck.value != "idCheck"){
		alert("아이디 중복체크를 실행해주세요."); 
		return false;
	}
	
	if (!check(re, id, 
	"아이디는 4~20자의 영문 대소문자와 숫자로만 입력해주세요.")) {
		return false;
	}

	if (!check(re, pw,
	"패스워드는 4~20자의 영문 대소문자와 숫자로만 입력해주세요.")) {
		return false;
	}

	if (join.pw.value != join.pw2.value) {
		alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
		join.pw2.value = "";
		join.pw2.focus();
		return false;
	}

	if (join.name.value == "") {
		alert("이름을 입력해 주세요.");
		join.name.focus();
		return false;
	}
	
	if (join.nickname.value == "") {
		alert("닉네임을 입력해 주세요.");
		join.nickname.focus();
		return false;
	}
	
	if (tel1.value == "" || tel1.value.length != 3 || tel2.value =="" || tel2.value.length != 4 || tel3.value == "" || tel3.value.length != 4 )
	{
		alert("올바른 전화번호를 입력해주세요")
		tel1.focus();
		return false;
	}
	
	if (email.value == "") {
		alert("이메일을 입력해 주세요");
		email.focus();
		return false;
	}
	

	if (!check(re2, email, "적합하지 않은 이메일 형식입니다.")) {
		return false;
	}

	var sn1 = document.getElementById("sn1");
	var sn2 = document.getElementById("sn2");
	
	var yy = sn1.value.substring(0,2);
	var mm = sn1.value.substring(2,4);
	var dd = sn1.value.substring(4,6);
	var gender = sn2.value.substring(0,1);
	var ck=0;
	
	// 처음 7자 검사
	if (sn1.value.length != 6 || sn2.value.length != 7 || yy < 20 || mm < 1 || mm > 12 || dd < 0 || dd > 31 || gender > 2 || gender < 1) {
		alert("잘못된 주민등록번호입니다.");
		sn1.value = sn2.value = "";
		sn1.focus();
		return;
		}
	
	var total = sn1.value + sn2.value;
	for (i=0; i < 12; i++) {
	ck  += (i%8+2)*total.substring(i, i+1);
	}
	ck = (11-(ck%11))%10;
	if (parseInt(ck) != parseInt(total.substring(12, 13))) {
	alert("잘못된 주민등록번호입니다.")
	sn1.value=sn2.value="";
	sn1.focus();
	return;
	}
	alert("회원가입이 완료되었습니다.");
}

function sn_check() {
	
	var sn1 = document.getElementById("sn1");
	var sn2 = document.getElementById("sn2");
	
	var yy = sn1.value.substring(0,2);
	var mm = sn1.value.substring(2,4);
	var dd = sn1.value.substring(4,6);
	var gender = sn2.value.substring(0,1);
	var ck=0;
	
	// 처음 7자 검사
	if (sn1.value.length != 6 || sn2.value.length != 7 || yy < 20 || mm < 1 || mm > 12 || dd < 0 || dd > 31 || gender > 2 || gender < 1) {
		alert("잘못된 주민등록번호입니다.");
		sn1.value = sn2.value="";
		sn1.focus();
		return;
		}
	
	var total = sn1.value + sn2.value;
	for (i=0; i < 12; i++) {
	ck  += (i%8+2)*total.substring(i, i+1);
	}
	ck = (11-(ck%11))%10;
	if (parseInt(ck) != parseInt(total.substring(12, 13))) {
	alert("잘못된 주민등록번호입니다.")
	sn1.value=sn2.value="";
	sn1.focus();
	return;
	}
	alert("주민등록번호 정상확인 되었습니다.")
	}
	

	
</script>
<meta charset="UTF-8">
<title>회원 가입 화면</title>
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
	border: 3px solid navy
}

td {
	border: 1px solid navy
}

#title {
	background-color: navy
}
</style>
</head>
<body>
	<h2>회원 가입 화면입니다.</h2>
	<hr color="black">
	<div id="wrap">
		<br> <br> <b><font size="6" color="gray">회원가입</font></b> <br>
		<br> <br>
		<!-- form태그는 값을 입력하고 싶을 때 사용 -->
		<!-- 입력값들은 모두 form들어가야 한다. -->
		<!-- action: 입력값을 받아서 처리하는 다음 페이지를 지정 -->
		<form name="join" onsubmit="return validate();" action="member_joinDB연결.jsp">
			<table align = center>
				<tr>
					<td id="title" width="180px" align="center">
					<font color=white>아이디</font></td>
					<td align="left"><input type="text" name="id" id="id"maxlength="20" readonly>
					<input type="button" value="중복확인" onclick="idCheck()"><br> 
					<input type="hidden" name="idUncheck" value="idUncheck">
					<span style="font-size: 7px;">
					※아이디는 4~20자의 영문 대소문자와 숫자로만 입력</span></td>
				</tr>
				<tr>
					<td id="title" align="center"><font color=white>비밀번호</font></td>
					<td align="left"><input type="password" name="pw" id="pw"
						maxlength="20"><br> <span style="font-size: 7px;">※비밀번호는
							4~20자의 영문 대소문자와 숫자로만 입력</span></td>
				</tr>
				<tr>
					<td id="title" align="center"><font color=white>비밀번호 확인</font></td>
					<td align="left"><input type="password" name="pw2" id="pw2"
						maxlength="20"></td>
				</tr>
				<tr>
					<td id="title" align="center"><font color=white>이름</font></td>
					<td align="left"><input type="text" name="name" id="name"
						maxlength="20"></td>
				</tr>
				<tr>
					<td id="title" align="center"><font color=white>닉네임</font></td>
					<td align="left"><input type="text" name="nickname"
						id="nickname" maxlength="20"></td>
				</tr>
				<tr>
					<td id="title" align="center"><font color=white>주민등록번호</font></td>
					<td align="left"><input type="hidden" name="social_num">
						<input type="text" name="sn1" size="10" maxlength="6" id="sn1">
						- <input type="password" name="sn2" size="10" maxlength="7"
						id="sn2"> <input type="button" VALUE="실명 확인"
						onclick="sn_check()"></td>
				</tr>
				<tr>
					<td id="title" align="center"><font color=white>전화번호</font></td>
					<td align="left"><input type="hidden" name="phone" id="phone">
						<input type="text" name="tel1" id="tel1" size="1" maxlength="3">
						- <input type="text" name="tel2" id="tel2" size="3" maxlength="4">
						- <input type="text" name="tel3" id="tel3" size="3" maxlength="4">
					</td>
				</tr>
				<tr>
					<td id="title" align="center"><font color=white>주소</font></td>
					<td align="left"><input type="text" name="address"
						id="address" maxlength="20"></td>
				</tr>
				<tr>
					<td id="title" align="center"><font color=white>이메일</font></td>
					<td align="left"><input type="text" name="email" id="email"
						maxlength="30"></td>
				</tr>
			</table>
			<br> <input type="submit" value="가입신청">
		</form>
	</div>
</body>
</html>