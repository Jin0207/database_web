package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.sist.vo.BookVO;

public class BookDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String user = "c##madang";
	String password = "madang";
	
	// ���̸��� �Ű������� ���޹޾� �� ���� �ֹ����� �ʴ� �����̸����� ��ȯ�ϴ� �޼ҵ�
	public ArrayList<String> getNotpuchased(String name){
		ArrayList<String> list = new ArrayList<String>();
		String sql = "select bookname from book "
				+ "where bookid not in(select bookid from orders "
				+ "where custid =(select custid from customer "
				+ "where name = ?))";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(rs.getString(1));
			}
			
		} catch (Exception e) {
			System.out.println("���ܹ߻�:" + e.getMessage());
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
			}
		}
		return list;
	}
	
	//���ڵ带 �߰��ϴ� �޼ҵ�
	public void addBook(int bookid, String bookname, String publisher, int price) {
		String sql = "insert into book values(?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bookid);
			pstmt.setString(2, bookname);
			pstmt.setString(3, publisher);
			pstmt.setInt(4, price);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("���ܹ߻�:" + e.getMessage());
		}finally {
			try {
				if(pstmt != null) pstmt.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}//add
	
	//ȭ�鿡 ����ϴ� �޼ҵ�
	public ArrayList<BookVO> printBookList() {
		ArrayList<BookVO> list = new ArrayList<BookVO>();
		String sql = "select * from book order by bookid";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				list.add(new BookVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4)));
			}
		} catch (Exception e) {
			System.out.println("���ܹ߻�:" + e.getMessage());
		}finally {
			try {
				
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
		return list;
	}
}
