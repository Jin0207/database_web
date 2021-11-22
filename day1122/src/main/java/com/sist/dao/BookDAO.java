package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.sist.vo.BookVO;

public class BookDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String user = "c##madang";
	String password = "madang";
	
	public ArrayList<BookVO> getSalesRacnkingList(){
		ArrayList<BookVO> list = new ArrayList<BookVO>();
		String sql ="select A.bookid, bookname, publisher, price, cnt from (select bookid, count(bookid) cnt from orders group by bookid) A, book b "
				+ "where cnt >= (select cnt from (select rownum n, cnt from (select count(*) cnt from orders group by bookid order by count(*) desc) "
				+ "where rownum <=3) where n = 3) "
				+ "and A.bookid = b.bookid";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				list.add(new BookVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5)));
			}
			
		} catch (Exception e) {
			System.out.println("예외발생:" +e.getMessage());
		}finally {
			try {
				
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
		return list;
	}
}
