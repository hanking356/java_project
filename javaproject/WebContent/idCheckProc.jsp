<%@page import="dao_vo.MemberDB"%>
<%@page import="dao_vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복체크</title>
</head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
body{font-family: 'Jua', sans-serif;}
</style>
<body>
	<div style="text-align: center;">
		<h3>* 아이디 중복확인 결과 *</h3>
<%
	MemberVO bag = new MemberVO();
	MemberDB db = new MemberDB();
	
	String id = request.getParameter("userid");
	int cnt = db.duplecateID(id);
	out.println("입력 ID : <strong>"+id+"</strong>");
	if(cnt==0){
		out.println("<p>사용 가능한 아이디 입니다!!</p>");
		out.println("<a href='javascript:apply(\"" +id+ "\");sendidCheck();'>[적용]</a>");
%>
	<script type="text/javascript">
	function apply(id) {
		//중복확인된 id를 부모창에 적용
		//부모창 opener
		opener.document.join.id.value = id;
		window.close(); //창닫기
	}//apply () end
	
	function sendidCheck() {
		
		opener.document.join.idUncheck.value="idCheck";
		//아이디 중복체크 실행했음을 확인<< join.form 으로 전송
	}
	</script>
	
<% 
	}else{
		out.println("<p style='color:red'>해당 아이디는 사용할 수 없습니다.</p>");
	}
%>	
	<hr>
	<a href="javascript:history.back()">[다시검색]</a>
	&nbsp;&nbsp;
	<a href="javascript:window.close()">[창닫기]</a>
	
	
	</div>
</body>
</html>