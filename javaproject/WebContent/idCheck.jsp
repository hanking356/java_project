<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
body{font-family: 'Jua', sans-serif;}
</style>
<script type="text/javascript">

function blankCheck(p){
	var id = p.id.value;
	id=id.trim();
	if(id.length<4){
		alert("아이디는 영어,숫자를 포함 4글자 이상 입력해 주세요");
		return false;
	}//if end
	return true;
} //end

function pValue() {
	
	document.getElementById("id").value = opener.document.join.id.value;
	
}
</script>

<meta charset="UTF-8">
<title>중복체크</title>

</head>
<body onload = "pValue()">
	<div style="text-align: center;">
		<h3>* 아이디 중복확인 *</h3>
		<form method="post"
		      action=" idCheckProc.jsp"
		      onsubmit="return blankCheck(this)">
		아이디: <input type="text" id="id" name="userid" maxlength="20" autofocus>
		<input type="submit" value="중복확인"><br>
		<span style="font-size:12px;"> ※아이디는 4~20자의 영문 대소문자와 숫자로만 입력</span>
		</form>
	</div>
</body>
</html>