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
		String sql = "select �̸� from �� order by �̸�";
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
			System.out.println("���ܹ߻�:" + e.getMessage());
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
		String sql ="select �����̸�, �󿵰�.�󿵰���ȣ, ��ȭ����, ��¥, �¼���ȣ, ���� "
				+ "from ����, �󿵰�, ���� "
				+ "where ����.�����ȣ = �󿵰�.�����ȣ and "
				+ "����.�󿵰���ȣ = �󿵰�.�󿵰���ȣ and "
				+ "����.�����ȣ = �󿵰�.�����ȣ and "
				+ "to_char(��¥, 'yyyy/mm/dd') = to_char(sysdate, 'yyyy/mm/dd') and "
				+ "����ȣ = (select ����ȣ from �� where �̸� = ?)";
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
			System.out.println("���ܹ߻�:" + e.getMessage());
		}finally {
			try {
				
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return list;
	}
}
