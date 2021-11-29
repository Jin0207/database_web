<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
	<table>
		<tr>
			<td>도서번호</td>
			<td>도서명</td>
			<td>출판사</td>
			<td>가격</td>
			<td>판매수</td>
			<td>Action</td>
		</tr>
	<%
		String sql = "select bookid, bookname, publisher, price, "
					+" (select count(saleprice) from orders o where b.bookid = o.bookid)"
					+" from book b";
		try{
			Connection conn = ConnectionProvider.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				int cnt = rs.getInt(5);
	%>
				<tr>
					<td><%=rs.getInt(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getInt(4) %></td>
					<td><%=cnt %></td>
					<td>
						<a href="updateBook.jsp?bookid=<%=rs.getInt(1) %>">수정</a> 
						
						<%
							if(cnt == 0){
						%>
							<a href="deleteBook.jsp?bookid=<%=rs.getInt(1) %>">삭제</a> 
						<%	
							}
						%>
					</td>
				</tr>	
	<%
			}
			ConnectionProvider.close(conn, stmt, rs);
		}catch(Exception e){
	%>
		예외발생: <%=e.getMessage() %>
	<%
		}
	%>
	</table>
	<hr>
	<a href="insertBook.jsp">도서등록</a>
</body>
</html>