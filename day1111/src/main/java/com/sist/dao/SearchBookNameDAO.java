package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.sist.vo.SearchBookNameVO;

public class SearchBookNameDAO {
	
	
	public ArrayList<SearchBookNameVO> listBookName(String name){
		ArrayList<SearchBookNameVO> list = new ArrayList<SearchBookNameVO>();
		String sql = "select bookname from book where "
				+ "bookid not in(select bookid from orders "
				+ "where custid = (select custid from customer "
				+ "where name=?))";
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "c##madang";
		String pwd = "madang";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, pwd);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new SearchBookNameVO(rs.getString(1)));
				
			}
		}catch (Exception e) {
			System.out.println("예외발생:" + e.getMessage());
		}finally {
			try {
				if(rs != null) rs.close();
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return list;
	}
}
