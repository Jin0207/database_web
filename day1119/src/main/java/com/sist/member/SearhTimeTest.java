package com.sist.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class SearhTimeTest {

	public static void main(String[] args) {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "c##madang";
		String password = "madang";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user,password);
			pstmt = conn.prepareStatement("select * from member100 where name = '이뿹킔'");
			
			long start = System.currentTimeMillis();
			rs = pstmt.executeQuery();
			String id = "";
			String pwd = "";
			String name = "";
			if(rs.next()) {
				id = rs.getString(1);
				pwd = rs.getString(2);
				name = rs.getString(3);
				System.out.println(id + "/" + pwd + "/" + name);
			}
			long end = System.currentTimeMillis();
			System.out.println("걸린시간:" + (end - start));
		} catch (Exception e) {
			System.out.println("예외발생:" + e.getMessage());
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
}
//인덱스 생성 전
//걸린시간:126
// 생성 후
//걸린시간:72
//걸린시간:54
