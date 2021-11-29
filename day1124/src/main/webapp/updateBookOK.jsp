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
	int bookid = Integer.parseInt(request.getParameter("bookid"));
	String bookname = request.getParameter("bookname");
	String publisher = request.getParameter("publisher");
	int price = Integer.parseInt(request.getParameter("price"));
	
	String sql = "update book set bookname=?,publisher=?,price=? where bookid=?";
	try{
		Connection conn = ConnectionProvider.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bookname);
		pstmt.setString(2,publisher);
		pstmt.setInt(3,price);
		pstmt.setInt(4,bookid);
		int re = pstmt.executeUpdate();
		ConnectionProvider.close(conn, pstmt, null);
		if(re > 1){
			response.sendRedirect("listBookTest.jsp");
		}else{
			%>
				도서수정에 실패하였습니다.<br>
				<a href="updateBook.jsp?bookid=<%=bookid %>">수정</a>
			<%
		}
	}catch(Exception e){
		System.out.println("예외발생:" + e.getMessage());
	}
%>
</body>
</html>