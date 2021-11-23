package com.sist.exam;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class BookList {
	Connection conn;
	public BookList() {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String userid = "c##madang";
		String pwd = "madang";
		
		try {
			Class.forName(driver);
			System.out.println("드라이버를 메모리에 로드했다.");
			conn = DriverManager.getConnection(url, userid, pwd);
			System.out.println("DB서버에 연결했다.");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void sqlRun() {
		String sql = "select * from book";
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			System.out.println("BOOK NO\tBOOK NAME\t\tPUBLISHER\tPRICE");
			
			while(rs.next()) {
				System.out.print(rs.getInt(1) + "\t");
				System.out.print(rs.getString(2) + "\t\t");
				System.out.print(rs.getString(3) + "\t");
				System.out.print(rs.getInt(4));
				System.out.println();
			}
			
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	public static void main(String[] args) {
		
		BookList so = new BookList();
		so.sqlRun();
		
	}

}
