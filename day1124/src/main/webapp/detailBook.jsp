<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>도서 상세</h2>
	<hr>
	<%	
		int bookid = Integer.parseInt(request.getParameter("bookid"));
		String sql = "select * from book where bookid =?";
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "c##madang";
		String pwd = "madang";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, pwd);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bookid);
			rs = pstmt.executeQuery();
			if(rs.next()){
	%>
			<table border="1" width="20%">
				<tr>
					<td>도서번호</td>
					<td><%=rs.getInt(1) %></td>
				</tr>
				<tr>
					<td>도서명</td>
					<td><%= rs.getString(2) %></td>
				</tr>
				<tr>
					<td>출판사</td>
					<td><%= rs.getString(3) %></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><%= rs.getInt(4) %></td>
				</tr>
			</table>		
	<%	
			}
			if(rs!=null) rs.close();			
			if(pstmt!=null) pstmt.close();			
			if(conn!=null) conn.close();			
			
		}catch(Exception e){
			System.out.println("예외발생:" + e.getMessage());	
		}
	%>
</body>
</html>