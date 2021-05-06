package dao_vo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;



public class BoardDB {
	public ArrayList<BoardVO> list1(String select, String word) throws Exception {//BoardVO ������  Arraylist ���
		ArrayList<BoardVO> list1 = new ArrayList<>();
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/trip?useUnicode=true&characterEncoding=utf8";
		Connection con = DriverManager.getConnection(url, "root", "1234");
		//select�� title_content �϶�
		if (select.equals("title_content")) {
			//title�� content���� word�� ������ �Խñ��� �ҷ��� 
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
			
		}//select�� writer�϶�
		else if (select.equals("writer")) {
			//word��  ������ �Խñ��� �ҷ��� 
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
		
	//�Խù��� ����� �������� �޼���	
	public ArrayList<BoardVO> list() throws Exception {
		ArrayList<BoardVO> list = new ArrayList<>();
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/trip?useUnicode=true&characterEncoding=utf8";
		Connection con = DriverManager.getConnection(url, "root", "1234");
		//�Խñ� ������ ������������ ����
		String sql = "select * from board order by id desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		//������ rs�� Ȱ���� ���ǿ� �ش�Ǵ� �˻� ����� ���̺� �׸񿡼� ������
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
		//id�� clicks�� �ڵ����� �ǹǷ� ���� �Է��� ���� ����, birth�� now()�Լ��� �̿��� ����
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
		Class.forName("com.mysql.jdbc.Driver");/// jdbc������ pack, Driver�� class
		System.out.println("1. Ŀ���� ��뼳�� ����.<br>");

		// 2.db�����غ���!-shop, root, 1234
		String url = "jdbc:mysql://localhost:3306/trip?useUnicode=true&characterEncoding=utf8";// ������ �ּ�
		// jsp������ �ڵ� import: Ŭ����, ��Ʈ�� ����Ʈ
		Connection con = DriverManager.getConnection(url, "root", "1234");
		System.out.println("2. db���� ����.<br>");

		// 3.sql���� ����� =>�ش��ǰ�� �Ἥ sql���� �ν��ϰ� �ؾ���, �ش� Ŭ������ ����ؾ� ��.
		String sql = "update board set title =?, content =?, degree =?, local =? where id = ?";// ps.executeUpdate�� �̿��� mysql�� ����
		PreparedStatement ps = con.prepareStatement(sql);// sql ��ǰ
		ps.setString(1, bag.getTitle());
		ps.setString(2, bag.getContent());
		ps.setString(3, bag.getDegree());
		ps.setString(4, bag.getLocal());
		ps.setString(5, bag.getId());
		System.out.println("3. SQL���� ����� ����.<br>");
		// 4.sql���� mysql������ ������.
		ps.executeUpdate();// �ڹٰ� mysql�� ���۸�
		System.out.println("4.SQL���� mySQL������ ���ۼ���<br>");
	}

	public void delete(String id) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");/// jdbc������ pack, Driver�� class
		System.out.println("1. Ŀ���� ��뼳�� ����.<br>");

		// 2.db�����غ���!-shop, root, 1234
		String url = "jdbc:mysql://localhost:3306/trip?useUnicode=true&characterEncoding=utf8";// ������ �ּ�
		// jsp������ �ڵ� import: Ŭ����, ��Ʈ�� ����Ʈ
		Connection con = DriverManager.getConnection(url, "root", "1234");
		System.out.println("2. db���� ����.<br>");

		// 3.sql���� ����� =>�ش��ǰ�� �Ἥ sql���� �ν��ϰ� �ؾ���, �ش� Ŭ������ ����ؾ� ��.
		String sql = "delete from board where id = ?";// ps.executeUpdate�� �̿��� mysql�� ����
		PreparedStatement ps = con.prepareStatement(sql);// sql ��ǰ
		ps.setString(1, id);
		System.out.println("3. SQL���� ����� ����.<br>");
		// 4.sql���� mysql������ ������.
		ps.executeUpdate();// �ڹٰ� mysql�� ���۸�
		System.out.println("4.SQL���� mySQL������ ���ۼ���<br>");
	}

	public BoardVO read(String id) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/trip?useUnicode=true&characterEncoding=utf8";
		Connection con = DriverManager.getConnection(url, "root", "1234");
		//�ش�Ǵ� id �׸��� row �����͸� �ҷ����� sql��
		String sql = "select * from board where id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		//�Խñ� �������� �����Ҷ����� ��ȸ���� 1�� �ø��� sql�� 
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