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
	<%
	
		int bookid = Integer.parseInt(request.getParameter("bookid"));
		String sql = "delete book where bookid=?";
		try{
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bookid);
			int re = pstmt.executeUpdate();
			if(re==1){
				response.sendRedirect("listBookTest.jsp");
			}else{
				%>
				도서삭제에 실패하였습니다.<br>
				<a href="delecteBook.jsp?bookid=<%=bookid %>">삭제</a>
			<%
			}
		}catch(Exception e){
			%>
			예외발생: <%=e.getMessage()%>
			<%
		}
	%>
</body>
</html>