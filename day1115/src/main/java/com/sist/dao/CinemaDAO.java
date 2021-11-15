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
		String sql = "select �󿵰���ȣ, ��ȭ����, ����, �¼��� from �󿵰� "
				+ " where �����ȣ = (select �����ȣ from ����  "
				+ "where �����̸� = ?) and "
				+ " �󿵰���ȣ in(select distinct �󿵰���ȣ from ���� where ��¥ = '2014/09/01')";
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
			System.out.println("���ܹ߻�:" + e.getMessage());
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
		String sql = "select sum(����*n) "
				+ "	from (select �󿵰�.�����ȣ, �󿵰���ȣ, ���� "
				+ "	from ����, �󿵰� "
				+ "	where ����.�����ȣ = �󿵰�.�����ȣ and "
				+ "	�����̸� = ?) a, (select �󿵰�.�����ȣ, �󿵰�.�󿵰���ȣ, count(*) "
				+ "	from ����,�󿵰�, ���� "
				+ "	where ����.�����ȣ = �󿵰�.�����ȣ and "
				+ "	�󿵰�.�����ȣ = ����.�����ȣ and "
				+ "	�󿵰�.�󿵰���ȣ = ����.�󿵰���ȣ and "
				+ "	�����̸� = ? group by �󿵰�.�����ȣ, �󿵰�.�󿵰���ȣ) "
				+ "	where a.�����ȣ = b.�����ȣ and "
				+ "	a.�󿵰���ȣ = b.�󿵰���ȣ";
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, pwd);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cinemaName);
			pstmt.setString(2, cinemaName);
			rs = pstmt.executeQuery();
			tot = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("���ܹ߻�:" + e.getMessage());
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
