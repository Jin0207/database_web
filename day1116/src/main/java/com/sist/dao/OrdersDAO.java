package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.sist.vo.OrdersVO;

public class OrdersDAO {
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:XE";
	private String user = "c##madang";
	private String password = "madang";
	
	//새로운 주문번호를 반환하는 메소드 정의
	public int getNextOrderId() {
		int orderid = 0;
		String sql = "select max(orderid) + 1 from orders";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				orderid = rs.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println("예외발생:" + e.getMessage());
		}finally {
			try {
				if(rs != null) rs.close();
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
			} catch (Exception e2) {
			}
		}
		
		return orderid;
	}
	
	public int insertOrders(OrdersVO o) {
		int re = -1;
		String sql = "insert into orders values(?, ?, ?, ?, sysdate)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			//driver를 메모리에 로드
			Class.forName(driver);
			//db서버에 연결
			conn = DriverManager.getConnection(url,user,password);
			//연결한 conn을 통해 sql을 실행할 수 있는 pstmt 객체생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNextOrderId());
			pstmt.setInt(2, o.getCustid());
			pstmt.setInt(3, o.getBookid());
			pstmt.setInt(4, o.getSaleprice());
			
			//?이 값이 설정되었으니 실행시킴
			re = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("예외발생:" + e.getMessage());
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
			}
		}
		return re;
	}
}
