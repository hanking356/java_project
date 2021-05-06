package dao_vo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MemberDB {
	public void create(MemberVO bag) throws Exception {

		// 1. 커넥터 사용을 설정
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("1. 커넥터 사용 설정 성공. <br>");

		// 2. db연결 trip, root, 1234
		String url = "jdbc:mysql://localhost:3306/trip?useUnicode=true&characterEncoding=utf8";
		Connection con = DriverManager.getConnection(url, "root", "1234");
		System.out.println("2. db연결 성공. <br>");

		// 3. SQL문 생성
		String sql = "insert into member values(?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, bag.getId());
		ps.setString(2, bag.getPw());
		ps.setString(3, bag.getName());
		ps.setString(4, bag.getNickname());
		ps.setString(5, bag.getPhone());
		ps.setString(6, bag.getAddress());
		ps.setString(7, bag.getEmail());
		System.out.println("3. SQL문 만들기 성공. <br>");
		System.out.println("여기까진 성공 <br>");

		// 4. SQL문을 mySQL서버로 전송함.
		ps.executeUpdate();
		System.out.println("4. SQL문을 mySQL서버로 전송 성공. <br>");

	}
	public void delete(String id) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("1. 커넥터 사용 설정 성공. <br>");

		String url = "jdbc:mysql://localhost:3306/trip?useUnicode=true&characterEncoding=utf8";
		Connection con = DriverManager.getConnection(url, "root", "1234");
		System.out.println("2. db연결 성공. <br>");

		String sql = "delete from member where id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);

		System.out.println("3. SQL문 만들기 성공. <br>");

		ps.executeUpdate();
		System.out.println("4. SQL문을 mySQL서버로 전송 성공. <br>");
		System.out.println("5. 회원 정보 삭제 완료. <br>");

	}
	public void update(MemberVO bag) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("1. 커넥터 사용 설정 성공. <br>");

		String url = "jdbc:mysql://localhost:3306/trip?useUnicode=true&characterEncoding=utf8";
		Connection con = DriverManager.getConnection(url, "root", "1234");
		System.out.println("2. db연결 성공. <br>");

		String sql = "update member set pw = ?, nickname = ?, phone = ?, address = ?, email = ? where id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, bag.getPw());
		ps.setString(2, bag.getNickname());
		ps.setString(3, bag.getPhone());
		ps.setString(4, bag.getAddress());
		ps.setString(5, bag.getEmail());
		ps.setString(6, bag.getId());
		System.out.println("3. SQL문 만들기 성공. <br>");

		// 4. SQL문을 mySQL서버로 전송함.
		ps.executeUpdate();
		System.out.println("4. SQL문을 mySQL서버로 전송 성공. <br>");

	}
	public MemberVO read(String id) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("1. 커넥터 사용 설정 성공. <br>");

		String url = "jdbc:mysql://localhost:3306/trip?useUnicode=true&characterEncoding=utf8";
		Connection con = DriverManager.getConnection(url, "root", "1234");
		System.out.println("2. db연결 성공. <br>");

		String sql = "select * from member where id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);

		System.out.println("3. SQL문 만들기 성공. <br>");

		ResultSet rs = ps.executeQuery();
		System.out.println("4. SQL문을 mySQL서버로 전송 성공. <br>");

		// 1. 검색결과가 있는지 체크 해야함.
		// System.out.println(rs.next());
		// 위 결과가 true면, 정상작동 < 검색결과 있음.
		// 2. 만약 결과가 있으면, 테이블에서 원하는 데이터항목을 꺼내줄 수 있음.

		MemberVO bag = new MemberVO();
		if (rs.next()) {
			// 꺼내주는 방법은 2가지, 1)항목명, 2)인덱스번호
			String id2 = rs.getString("id"); // 테스트
			String pw = rs.getString(2);
			String name = rs.getString(3);
			String nickname = rs.getString(4);
			String phone = rs.getString(5);
			String address = rs.getString(6);
			String email = rs.getString(7);

			bag.setId(id2);
			bag.setPw(pw);
			bag.setName(name);
			bag.setNickname(nickname);
			bag.setPhone(phone);
			bag.setAddress(address);
			bag.setEmail(email);
		}
		return bag;
	}
	public boolean check(String id, String pw) throws Exception {
		// 1. connector 설정
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("1. 커넥터 사용 설정 성공. <br>");

		// 2. db연결
		String url = "jdbc:mysql://localhost:3306/trip?useUnicode=true&characterEncoding=utf8";
		Connection con = DriverManager.getConnection(url, "root", "1234");

		System.out.println("2. db연결 성공. <br>");
		// 3. sql문 생성
		String sql = "select * from member where id = ? and pw = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, pw);
		System.out.println("3. SQL문을 만들기 성공. <br>");

		// 4. SQL문 전송
		ResultSet rs = ps.executeQuery();
		System.out.println("4. SQL문을 mySQL서버로 전송 성공. <br>");

		boolean result = false; // 로그인 되지 않은 상태를 의미.
		if (rs.next()) { // 입력된 결과(id,pw)가 있는지 체크해주는 메서드
			System.out.println("로그인 성공");
			result = true;
		} else {
			System.out.println("로그인 실패");
		}
		return result;
	}
	public ArrayList<MemberVO> list() throws Exception {
		ArrayList<MemberVO> list = new ArrayList<>();

		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("1. 커넥터 사용 설정 성공. <br>");

		String url = "jdbc:mysql://localhost:3306/trip?useUnicode=true&characterEncoding=utf8";
		Connection con = DriverManager.getConnection(url, "root", "1234");
		System.out.println("2. db연결 성공. <br>");

		String sql = "select * from member";
		PreparedStatement ps = con.prepareStatement(sql);
		System.out.println("3. SQL문 만들기 성공. <br>");

		ResultSet rs = ps.executeQuery();
		System.out.println("4. SQL문을 mySQL서버로 전송 성공. <br>");

		// 1. 검색결과가 있는지 체크 해야함.
		// System.out.println(rs.next());
		// 위 결과가 true면, 정상작동 < 검색결과 있음.
		// 2. 만약 결과가 있으면, 테이블에서 원하는 데이터항목을 꺼내줄 수 있음.

		while (rs.next()) {
			// rs.next()를 호출할 때마다 한 행씩 내려가서 그 행이 있는지를 체크: boolean
			// 있으면 true, 없으면 false
			// true이면 각 항목의 값들을 꺼내주어야 한다.
			// 꺼내주는 방법은 2가지, 1)항목명, 2)인덱스번호
			String id2 = rs.getString("id"); // 테스트
			String pw = rs.getString(2);
			String name = rs.getString(3);
			String nickname = rs.getString(4);
			String phone = rs.getString(5);
			String address = rs.getString(6);
			String email = rs.getString(7);

			// 가방을 만들어서 꺼내준 값들을 가방에 넣는다.
			MemberVO bag = new MemberVO();
			bag.setId(id2);
			bag.setPw(pw);
			bag.setName(name);
			bag.setNickname(nickname);
			bag.setPhone(phone);
			bag.setAddress(address);
			bag.setEmail(email);

			// 가방들을 컨테이너에 하나씩 넣어준다
			list.add(bag);
		}
		System.out.println(list.size() + "================");

		return list;
	}
	public int read(String id, String pw) throws Exception {
		int result = 0;
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("1. 커넥터 사용 설정 성공. <br>");

		String url = "jdbc:mysql://localhost:3306/trip?useUnicode=true&characterEncoding=utf8";
		Connection con = DriverManager.getConnection(url, "root", "1234");

		System.out.println("2. db연결 성공. <br>");

		String sql = "select * from member where id = ? and pw = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, pw);
		System.out.println("3. SQL문을 만들기 성공. <br>");

		ResultSet rs = ps.executeQuery();
		System.out.println("4. SQL문을 mySQL서버로 전송 성공. <br>");

		// 1. 검색결과가 있는지 체크해야한다.
		// System.out.println(rs.next());//true이면 있다라는 얘기
		// 2. 만약에 결과가 있으면, 테이블에서 원하는 데이터항목을 꺼내주면 됨.
		if (rs.next()) {
			result = 1;
		}
		return result;
	}
	public int duplecateID(String id) throws Exception {
		int cnt=0;
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("1. 커넥터 사용 설정 성공. <br>");
		
		String url = "jdbc:mysql://localhost:3306/trip?useUnicode=true&characterEncoding=utf8";
		Connection con = DriverManager.getConnection(url, "root", "1234");
		
		System.out.println("2. db연결 성공. <br>");
		
		String sql = "select count(id) as cnt from member where id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		
		System.out.println("3. SQL문 만들기 성공. <br>");
		
		ResultSet rs = ps.executeQuery();
		System.out.println("4. SQL문을 mySQL서버로 전송 성공. <br>");
		System.out.println("아이디 중복체크 성공 <br>");
		if (rs.next()) {
			cnt=rs.getInt("cnt");
		}
		return cnt;
	}
}
