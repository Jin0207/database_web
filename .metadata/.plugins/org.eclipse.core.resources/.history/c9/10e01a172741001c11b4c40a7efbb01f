package com.sist.book;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class OrdersDAO {
	//Driver클래스 이름
	String driver = "oracle.jdbc.driver.OracleDriver";
	
	//연결할 DB서버의 주소
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	
	//DB에 연결할 사용자이름
	String userName = "c##madang";
	String passWord = "madang";
	
	//고객번호를 매개변수로 전달받아 그 고객의 모든 주문내열을 ArrayList로 반환하는 메소드 정의
	public ArrayList<OrdersVO> searchOrders(int custid){
		
		ArrayList<OrdersVO> list = new ArrayList<OrdersVO>();
		String sql = "select * from orders where custid=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		//검색한 결과를 담을 변수
		ResultSet rs = null;
		
		try {
			// driver을 메모리에 로드
			Class.forName(driver);
			// DB서버에 연결을해 Connection 객체 생성
			conn = DriverManager.getConnection(url, userName, passWord);
			//데이터베이스명령을 실행시켜주는 기능을가지고 있는 객체 생성
			pstmt = conn.prepareStatement(sql);
			// ? 에 설정하고자하는 값을 설정
			//   ?의 위치, 설정할 값
			pstmt.setInt(1, custid);
			//레코드의 헤더를 가리키고 있다. --> rowNames
			rs = pstmt.executeQuery();
			//레코드의 커서를 한행씩 움직여 가리키고있다
			while(rs.next()) {
				//현재 커서가 가리키고있는 각 컬럼의 값들을 가져와서 OrdersVO로 포장해서 ArrayList에 추가시켜준다
				list.add(new OrdersVO(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getDate(5)));
			}
			
		}catch (Exception e) {
			System.out.println("예외발생:" + e.getMessage());
		}finally {
			try {
				//만약에 오류가 발생하면 rs를 생성할 수 없기때문에 열지도 않은걸 닫을 수는 없으니
				// null이 아니라면 닫아준다.
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
			}
		}
		
		
		return list;
	}
}
