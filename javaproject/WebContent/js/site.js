/**
 * 
 */
function site(name) {
	if(name == "삭제"){
		alert('삭제되었습니다')
		location.href = "board_main.jsp"
	}else if(name == "등록"){
		alert('작성완료되었습니다')
		location.href = "board_main.jsp"
	}else if(name == "수정")  {
		alert('수정되었습니다')
		location.href = "board_main.jsp"
	}
}