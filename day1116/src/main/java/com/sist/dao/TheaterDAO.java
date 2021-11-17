package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.sist.vo.TheaterVO;

public class TheaterDAO {
	
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:XE";
	private String user = "c##sist";
	private String password = "sist";
	
	//극장이름을 매개변수로 전달받아 해당 극장의 금일 총수익을 반환하는 메소드
	public int getTotalByCinemaName(String cinemaName) {
		int total = 0;
		String sql = "select sum(count(*) * (select 가격 from 상영관  "
				+ "where 예약.극장번호 = 상영관.극장번호 and  "
				+ "예약.상영관번호 = 상영관.상영관번호)) total "
				+ "from 예약 "
				+ "where to_char(날짜,'yyyy/mm/dd') = to_char(sysdate, 'yyyy/mm/dd') and "
				+ "극장번호 = (select 극장번호 from 극장 where 극장이름 = ?) "
				+ "group by 극장번호, 상영관번호 "
				+ "order by 극장번호, 상영관번호";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,user,password);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cinemaName);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				total = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("예외발생:" + e.getMessage());
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null)conn.close();
			} catch (Exception e2) {
			}
		}
		return total;
	}
	
	
	
	//극장이름을 매개변수로 전달받아 그 극장에서 오늘 날짜에 상영하는 상영관 정보들을 ArrayList에 담아 반환하는 메소드정의
	public ArrayList<TheaterVO> listTheater(String cinemaName){
		ArrayList<TheaterVO> list = new ArrayList<TheaterVO>();
		String sql = "select 상영관.극장번호, 상영관번호, 영화제목, 가격, 좌석수 from 상영관, 극장 "
				+ "		where (극장.극장번호, 상영관번호) in (select distinct 극장번호, 상영관번호 from 예약 "
				+ "		where to_char(날짜,'yyyy/mm/dd') = to_char(sysdate, 'yyyy/mm/dd')) and "
				+ "		상영관.극장번호 = 극장.극장번호 and "
				+ "		극장이름 = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cinemaName);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new TheaterVO(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getInt(5)));
			}
		} catch (Exception e) {
			System.out.println("예외발생:" + e.getMessage());
		}finally {
			try {
				if(rs != null)rs.close();
				if(pstmt != null)pstmt.close();
				if(conn != null)conn.close();
			} catch (Exception e2) {
			}
		}
		
		
		
		return list;
	}
}















