package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.sist.vo.CinemaVO;

public class CinemaDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String user = "c##sist";
	String pwd = "sist";
	
	public ArrayList<CinemaVO> infoCinema(String cinemaName) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<CinemaVO> list = new ArrayList<CinemaVO>();
		String sql = "select 상영관번호, 영화제목, 가격, 좌석수 from 상영관 "
				+ " where 극장번호 = (select 극장번호 from 극장  "
				+ "where 극장이름 = ?) and "
				+ " 상영관번호 in(select distinct 상영관번호 from 예약 where 날짜 = '2014/09/01')";
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, pwd);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cinemaName);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CinemaVO vo = new CinemaVO(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4));
				list.add(vo);
			}
		} catch (Exception e) {
			System.out.println("예외발생:" + e.getMessage());
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null)conn.close();
				if(rs != null)rs.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return list;
	}
	
	public int totalCinema(String cinemaName) {
		int tot = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select sum(가격*n) "
				+ "	from (select 상영관.극장번호, 상영관번호, 가격 "
				+ "	from 극장, 상영관 "
				+ "	where 극장.극장번호 = 상영관.극장번호 and "
				+ "	극장이름 = ?) a, (select 상영관.극장번호, 상영관.상영관번호, count(*) "
				+ "	from 극장,상영관, 예약 "
				+ "	where 극장.극장번호 = 상영관.극장번호 and "
				+ "	상영관.극장번호 = 예약.극장번호 and "
				+ "	상영관.상영관번호 = 예약.상영관번호 and "
				+ "	극장이름 = ? group by 상영관.극장번호, 상영관.상영관번호) "
				+ "	where a.극장번호 = b.극장번호 and "
				+ "	a.상영관번호 = b.상영관번호";
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, pwd);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cinemaName);
			pstmt.setString(2, cinemaName);
			rs = pstmt.executeQuery();
			tot = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("예외발생:" + e.getMessage());
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null)conn.close();
				if(rs != null)rs.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return tot;
	}
}
