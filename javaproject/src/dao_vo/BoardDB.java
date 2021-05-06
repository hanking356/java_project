package dao_vo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;



public class BoardDB {
	public ArrayList<BoardVO> list1(String select, String word) throws Exception {//BoardVO 묶을때  Arraylist 사용
		ArrayList<BoardVO> list1 = new ArrayList<>();
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/trip?useUnicode=true&characterEncoding=utf8";
		Connection con = DriverManager.getConnection(url, "root", "1234");
		//select가 title_content 일때
		if (select.equals("title_content")) {
			//title과 content에서 word를 포함한 게시글을 불러옴 
			String sql = "select * from board where title like ? or content like? order by id desc";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "%" + word + "%");
			ps.setString(2, "%" + word + "%");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				BoardVO bag = new BoardVO();
				bag.setId(rs.getString("id"));
				bag.setTitle(rs.getString("title"));
				bag.setWriter(rs.getString("writer"));
				bag.setDate(rs.getDate("birth"));
				bag.setClicks(rs.getString("clicks"));
				list1.add(bag);	
			}
			
		}//select가 writer일때
		else if (select.equals("writer")) {
			//word를  포함한 게시글을 불러옴 
			String sql = "select * from board where writer like ? order by id desc";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "%" + word + "%");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				BoardVO bag = new BoardVO();
				bag.setId(rs.getString("id"));
				bag.setTitle(rs.getString("title"));
				bag.setWriter(rs.getString("writer"));
				bag.setDate(rs.getDate("birth"));
				bag.setClicks(rs.getString("clicks"));
				list1.add(bag);				
			}
		}return list1;
	}		
		
	//게시물의 목록을 가져오는 메서드	
	public ArrayList<BoardVO> list() throws Exception {
		ArrayList<BoardVO> list = new ArrayList<>();
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/trip?useUnicode=true&characterEncoding=utf8";
		Connection con = DriverManager.getConnection(url, "root", "1234");
		//게시글 순번을 내림차순으로 정렬
		String sql = "select * from board order by id desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		//참조형 rs를 활용해 조건에 해당되는 검색 결과를 테이블 항목에서 꺼내옴
		while (rs.next()) {
			BoardVO bag = new BoardVO();
			bag.setId(rs.getString("id"));
			bag.setTitle(rs.getString("title"));
			bag.setWriter(rs.getString("writer"));
			bag.setDate(rs.getDate("birth"));
			bag.setClicks(rs.getString("clicks"));
			list.add(bag);
		}
		return list;
	}

	public void create(BoardVO bag) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/trip?useUnicode=true&characterEncoding=utf8";
		Connection con = DriverManager.getConnection(url, "root", "1234");
		//id와 clicks는 자동생성 되므로 따로 입력을 하지 않음, birth는 now()함수를 이용해 생성
		String sql = "insert into board(title, content, writer, birth, local, degree) values(?, ?, ?,now(), ?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, bag.getTitle());		
		ps.setString(2, bag.getContent());
		ps.setString(3, bag.getWriter());
		ps.setString(4, bag.getLocal());
		ps.setString(5, bag.getDegree());
		ps.executeUpdate();
	
	}

	public void update(BoardVO bag) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");/// jdbc까지가 pack, Driver가 class
		System.out.println("1. 커넥터 사용설정 성공.<br>");

		// 2.db연결해보자!-shop, root, 1234
		String url = "jdbc:mysql://localhost:3306/trip?useUnicode=true&characterEncoding=utf8";// 연결할 주소
		// jsp에서의 자동 import: 클릭후, 컨트롤 쉬프트
		Connection con = DriverManager.getConnection(url, "root", "1234");
		System.out.println("2. db연결 성공.<br>");

		// 3.sql문을 만든다 =>해당부품을 써서 sql으로 인식하게 해야함, 해당 클래스를 사용해야 함.
		String sql = "update board set title =?, content =?, degree =?, local =? where id = ?";// ps.executeUpdate를 이용해 mysql로 전송
		PreparedStatement ps = con.prepareStatement(sql);// sql 부품
		ps.setString(1, bag.getTitle());
		ps.setString(2, bag.getContent());
		ps.setString(3, bag.getDegree());
		ps.setString(4, bag.getLocal());
		ps.setString(5, bag.getId());
		System.out.println("3. SQL문을 만들기 성공.<br>");
		// 4.sql문을 mysql서버로 전송함.
		ps.executeUpdate();// 자바가 mysql로 전송만
		System.out.println("4.SQL문을 mySQL서버로 전송성공<br>");
	}

	public void delete(String id) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");/// jdbc까지가 pack, Driver가 class
		System.out.println("1. 커넥터 사용설정 성공.<br>");

		// 2.db연결해보자!-shop, root, 1234
		String url = "jdbc:mysql://localhost:3306/trip?useUnicode=true&characterEncoding=utf8";// 연결할 주소
		// jsp에서의 자동 import: 클릭후, 컨트롤 쉬프트
		Connection con = DriverManager.getConnection(url, "root", "1234");
		System.out.println("2. db연결 성공.<br>");

		// 3.sql문을 만든다 =>해당부품을 써서 sql으로 인식하게 해야함, 해당 클래스를 사용해야 함.
		String sql = "delete from board where id = ?";// ps.executeUpdate를 이용해 mysql로 전송
		PreparedStatement ps = con.prepareStatement(sql);// sql 부품
		ps.setString(1, id);
		System.out.println("3. SQL문을 만들기 성공.<br>");
		// 4.sql문을 mysql서버로 전송함.
		ps.executeUpdate();// 자바가 mysql로 전송만
		System.out.println("4.SQL문을 mySQL서버로 전송성공<br>");
	}

	public BoardVO read(String id) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/trip?useUnicode=true&characterEncoding=utf8";
		Connection con = DriverManager.getConnection(url, "root", "1234");
		//해당되는 id 항목의 row 데이터를 불러오는 sql문
		String sql = "select * from board where id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		//게시글 브라우저에 접속할때마다 조회수를 1씩 올리는 sql문 
		String sql1 = "update board set clicks = clicks +1 where id =?";
		PreparedStatement ps1 = con.prepareStatement(sql1);
		ps1.setString(1, id);
		ps1.executeUpdate();	
		ResultSet rs = ps.executeQuery();				
		BoardVO bag = new BoardVO();
		if (rs.next()) {
			bag.setId(rs.getString("id"));
			bag.setTitle(rs.getString("title"));
			bag.setContent(rs.getString("content"));
			bag.setWriter(rs.getString("writer"));
			bag.setLocal(rs.getString("local"));
			bag.setDegree(rs.getString("degree"));
		}
		return bag;
	}

}