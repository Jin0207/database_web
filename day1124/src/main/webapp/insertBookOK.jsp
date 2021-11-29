<%@page import="java.sql.PreparedStatement"%>
<%@page import="oracle.jdbc.proxy.annotation.Pre"%>
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
		
		String sql = "insert into book values(?,?,?,?)";
		
		try{
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bookid);
			pstmt.setString(2, bookname);
			pstmt.setString(3, publisher);
			pstmt.setInt(4, price);
			
			int re =pstmt.executeUpdate();
			if(re == 1){
				response.sendRedirect("listBookTest.jsp");
			}else{
				%>
					도서 등록에 실패하였습니다.<br>
					<a href="insertBook.jsp">도서등록</a>
				<%
			}
			ConnectionProvider.close(conn, pstmt, null);
		}catch(Exception e){
			%>
			예외발생: <%= e.getMessage() %>
			<%
		}
	%>
</body>
</html>