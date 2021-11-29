<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.sist.db.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<ol>
	<%
		String sql = "select custid, name from customer";
		try{
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				%>
				<li><a href="updateAddr.jsp?custid=<%=rs.getInt(1)%>"><%= rs.getString(2) %></a></li>
				<%
			}
			ConnectionProvider.close(conn, pstmt, rs);
		}catch(Exception e){
			System.out.println("예외발생:" + e.getMessage());
		}
	%>
	</ol>
</body>
</html>