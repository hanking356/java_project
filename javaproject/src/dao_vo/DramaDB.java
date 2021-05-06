package dao_vo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DramaDB {

	public ArrayList<DramaVO> list() throws Exception {
		ArrayList<DramaVO> list = new ArrayList<>();
		Class.forName("com.mysql.jdbc.Driver");

		String url = "jdbc:mysql://localhost:3306/trip";
		Connection con = DriverManager.getConnection(url, "root", "1234");

		String sql = "select * from drama";
		PreparedStatement ps = con.prepareStatement(sql);

		ResultSet rs = ps.executeQuery();

		while (rs.next()) {

			DramaVO bag = new DramaVO();

			bag.setTitle(rs.getString("title"));
			bag.setActor(rs.getString("actor"));
			bag.setWriter(rs.getString("writer"));
			bag.setCompany(rs.getString("company"));
			list.add(bag);
		}
		return list;
	}

//	public void create(DramaVO bag) throws Exception {
//		Class.forName("com.mysql.jdbc.Driver");
//		// PrintWriter out = new PrintWriter();
//
//		String url = "jdbc:mysql://localhost:3306/newtrip";
//		Connection con = DriverManager.getConnection(url, "root", "1234");
//
//		String sql = "insert into drama values(?, ?, ?, ?)";
//		PreparedStatement ps = con.prepareStatement(sql);
//		ps.setString(1, bag.getTitle());
//		ps.setString(2, bag.getActor());
//		ps.setString(3, bag.getGenre());
//		ps.setString(4, bag.getCompany());
//
//		ps.executeUpdate();
//
//	}
//
//	public void update(DramaVO bag) throws Exception {
//		Class.forName("com.mysql.jdbc.Driver");
//
//		String url = "jdbc:mysql://localhost:3306/newtrip";
//		Connection con = DriverManager.getConnection(url, "root", "1234");
//
//		String sql = "update drama set actor = ?, genre = ? where title = ?";
//		PreparedStatement ps = con.prepareStatement(sql);
//
//		ps.setString(1, bag.getActor());
//		ps.setString(2, bag.getGenre());
//		ps.setString(3, bag.getTitle());
//
//		ps.executeUpdate();
//
//	}
//
//	public void delete(String title) throws Exception {
//		Class.forName("com.mysql.jdbc.Driver");
//		// PrintWriter out = new PrintWriter();
//
//		String url = "jdbc:mysql://localhost:3306/newtrip";
//		Connection con = DriverManager.getConnection(url, "root", "1234");
//
//		String sql = "delete from drama where title = ?";
//		PreparedStatement ps = con.prepareStatement(sql);
//		ps.setString(1, title);
//
//		ps.executeUpdate();
//
//	}

	public DramaVO read(String title) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");

		String url = "jdbc:mysql://localhost:3306/trip";
		Connection con = DriverManager.getConnection(url, "root", "1234");

		String sql = "select * from drama where title = ?";

		PreparedStatement ps = con.prepareStatement(sql);

		ps.setString(1, title);

		ResultSet rs = ps.executeQuery();

		DramaVO bag3 = new DramaVO();
		if (rs.next()) {

			String title2 = rs.getString("title");
			String actor2 = rs.getString("actor");
			String writer2 = rs.getString("writer");
			String company2 = rs.getString("company");

			bag3.setTitle(title2);
			bag3.setActor(actor2);
			bag3.setWriter(writer2);
			bag3.setCompany(company2);

		}
		System.out.println(bag3);
		return bag3;
	}

}
