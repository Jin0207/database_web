package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.sist.vo.ReserveVO;

public class ReserveDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String user = "c##sist";
	String pwd = "sist";
	public ArrayList<String> getName(){
		ArrayList<String> list = new ArrayList<String>();
		String sql = "select 이름 from 고객 order by 이름";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, pwd);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(rs.getString(1));
			}
		} catch (Exception e) {
			System.out.println("예외발생:" + e.getMessage());
		}finally {
			try {
				if(rs != null)rs.close();
				if(pstmt != null)pstmt.close();
				if(conn != null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
		return list;
	}
	public ArrayList<ReserveVO> getReserveList(String name){
		ArrayList<ReserveVO> list = new ArrayList<ReserveVO>();
		String sql ="select 극장이름, 상영관.상영관번호, 영화제목, 날짜, 좌석번호, 가격 "
				+ "from 예약, 상영관, 극장 "
				+ "where 예약.극장번호 = 상영관.극장번호 and "
				+ "예약.상영관번호 = 상영관.상영관번호 and "
				+ "극장.극장번호 = 상영관.극장번호 and "
				+ "to_char(날짜, 'yyyy/mm/dd') = to_char(sysdate, 'yyyy/mm/dd') and "
				+ "고객번호 = (select 고객번호 from 고객 where 이름 = ?)";
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
				list.add(new ReserveVO(rs.getString(1), rs.getInt(2), rs.getString(3), rs.getDate(4), rs.getInt(5), rs.getInt(6)));
			}
		} catch (Exception e) {
			System.out.println("예외발생:" + e.getMessage());
		}finally {
			try {
				
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return list;
	}
}
