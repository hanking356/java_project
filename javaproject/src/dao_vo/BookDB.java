package dao_vo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BookDB {

	public ArrayList<BookVO> list() throws Exception {
		ArrayList<BookVO> list = new ArrayList<>();
		Class.forName("com.mysql.jdbc.Driver");

		String url = "jdbc:mysql://localhost:3306/trip";
		Connection con = DriverManager.getConnection(url, "root", "1234");

		String sql = "select * from book";
		PreparedStatement ps = con.prepareStatement(sql);

		ResultSet rs = ps.executeQuery();

		while (rs.next()) {

			BookVO bag = new BookVO();

			bag.setTitle(rs.getString("title"));
			bag.setWriter(rs.getString("writer"));
			bag.setGenre(rs.getString("genre"));
			bag.setCompany(rs.getString("company"));
			list.add(bag);
		}
		return list;
	}

	public void create(BookVO bag) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		// PrintWriter out = new PrintWriter();

		String url = "jdbc:mysql://localhost:3306/trip";
		Connection con = DriverManager.getConnection(url, "root", "1234");

		String sql = "insert into book values(?, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, bag.getTitle());
		ps.setString(2, bag.getWriter());
		ps.setString(3, bag.getGenre());
		ps.setString(4, bag.getCompany());

		ps.executeUpdate();

	}

	public void update(BookVO bag) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");

		String url = "jdbc:mysql://localhost:3306/trip";
		Connection con = DriverManager.getConnection(url, "root", "1234");

		String sql = "update book set writer = ?, genre = ? where title = ?";
		PreparedStatement ps = con.prepareStatement(sql);

		ps.setString(1, bag.getWriter());
		ps.setString(2, bag.getGenre());
		ps.setString(3, bag.getTitle());

		ps.executeUpdate();

	}

	public void delete(String title) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		// PrintWriter out = new PrintWriter();

		String url = "jdbc:mysql://localhost:3306/trip";
		Connection con = DriverManager.getConnection(url, "root", "1234");

		String sql = "delete from book where title = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, title);

		ps.executeUpdate();

	}

	public BookVO read(String title) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");

		String url = "jdbc:mysql://localhost:3306/trip";
		Connection con = DriverManager.getConnection(url, "root", "1234");

		String sql = "select * from book where title = ?";

		PreparedStatement ps = con.prepareStatement(sql);

		ps.setString(1, title);

		ResultSet rs = ps.executeQuery();

		BookVO bag4 = new BookVO();
		if (rs.next()) {

			String title2 = rs.getString("title");
			String writer2 = rs.getString("writer");
			String genre2 = rs.getString("genre");
			String company2 = rs.getString("company");

			bag4.setTitle(title2);
			bag4.setWriter(writer2);
			bag4.setGenre(genre2);
			bag4.setCompany(company2);

		}
		System.out.println(bag4);
		return bag4;
	}

}
