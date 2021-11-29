<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.sist.db.ConnectionProvider"%>
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
	<%
	request.setCharacterEncoding("euc-kr");
	int custid = Integer.parseInt(request.getParameter("custid"));
	String address = request.getParameter("address");
	String sql = "update customer set address=? where custid=?";
	
	try{
		Connection conn = ConnectionProvider.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, address);
		pstmt.setInt(2, custid);
		int re = pstmt.executeUpdate();
		
		if(re == 1){
			%>
				회원의 주소를 수정하였습니다.
			<%
		}else{
			%>
				회원 주소 수정에 실패하였습니다.
			<%
		}
		ConnectionProvider.close(conn, pstmt, null);
	}catch(Exception e){
		System.out.println("예외발생:" + e.getMessage());
	}
	%>
	<hr>
	<a href="listCustomer.jsp"> 회원목록</a>
</body>
</html>