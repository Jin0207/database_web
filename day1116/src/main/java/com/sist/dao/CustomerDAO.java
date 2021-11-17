package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.sist.vo.BookVO;
import com.sist.vo.CustomerVO;

public class CustomerDAO {
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:XE";
	private String user = "c##madang";
	private String password = "madang";
	
	public ArrayList<CustomerVO> listCustomer(){
		ArrayList<CustomerVO> list = new ArrayList<CustomerVO>();
		String sql = "select * from customer order by custid";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,user,password);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new CustomerVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4)));
			}
			
		} catch (Exception e) {
			System.out.println("예외발생:" + e.getMessage());
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return list;
	}
}
