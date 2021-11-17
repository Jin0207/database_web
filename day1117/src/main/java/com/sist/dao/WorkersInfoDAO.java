package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.sist.vo.WorkersInfoVO;

public class WorkersInfoDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String user = "c##madang";
	String pwd = "madang";
	
	
	public ArrayList<WorkersInfoVO> getList(String mName, int months){
		ArrayList<WorkersInfoVO> list = new ArrayList<WorkersInfoVO>();
		String sql = "select e.eno, e.ename, to_char(e.hirdate, 'yyyy/mm/dd'), (e.salary + e.comm) *12,  rpad(substr(e.jumin,1,8),14,'*') jumin, substr(e.email, 1,instr(e.email,'@')-1) 아이디 "
				+ "from emp e, emp m "
				+ "where e.mgr = m.eno and "
				+ "m.ename = ? and "
				+ "months_between(sysdate, e.hirdate) > ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, pwd);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mName);
			pstmt.setInt(2, months);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new WorkersInfoVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6)));
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
