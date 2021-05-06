package dao_vo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MovieDB {

	public ArrayList<MovieVO> list() throws Exception {
		ArrayList<MovieVO> list = new ArrayList<>();
		Class.forName("com.mysql.jdbc.Driver");

		String url = "jdbc:mysql://localhost:3306/trip";
		Connection con = DriverManager.getConnection(url, "root", "1234");

		String sql = "select * from movie";
		PreparedStatement ps = con.prepareStatement(sql);

		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			MovieVO bag = new MovieVO();
			bag.setTitle(rs.getString("title"));
			bag.setActor(rs.getString("actor"));
			bag.setDirector(rs.getString("director"));
			bag.setGenre(rs.getString("genre"));
			list.add(bag);
		}
		return list;
	}


	public MovieVO read(String title) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");

		String url = "jdbc:mysql://localhost:3306/trip";
		Connection con = DriverManager.getConnection(url, "root", "1234");

		String sql = "select * from movie where title = ?";

		PreparedStatement ps = con.prepareStatement(sql);

		ps.setString(1, title);

		ResultSet rs = ps.executeQuery();

		MovieVO bag = new MovieVO();
		if (rs.next()) {

			String title2 = rs.getString("title");
			String actor2 = rs.getString("actor");
			String director2 = rs.getString("director");
			String genre2 = rs.getString("genre");

			bag.setTitle(title2);
			bag.setActor(actor2);
			bag.setDirector(director2);
			bag.setGenre(genre2);

		}
		System.out.println(bag);
		return bag;
	}

}
