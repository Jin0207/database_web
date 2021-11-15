package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.sist.vo.BookVO;

public class BookDAO {
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String user = "c##madang";
	
	String password = "madang";
	
	//�߰��� ������ ������ BookVO�� �Ű������� ���޹޾�
	//�����ͺ��̽� ���̺� book�� insert�� �����ϴ� �޼ҵ� ����
	//�޼ҵ尡 �����ߴ����� ������ ���� int�� ��ȯ
	public int insertBook(BookVO b ) {
		int re = -1;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
			pstmt = conn.prepareStatement("insert into book values(?,?,?,?)");
			pstmt.setInt(1, b.getBookid());
			pstmt.setString(2, b.getBookname());
			pstmt.setString(3, b.getPublisher());
			pstmt.setInt(4, b.getPrice());
			re = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("���ܹ߻�:" + e.getMessage());
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
		return re;
	}
}
