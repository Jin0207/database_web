<%@page import="com.sist.vo.BookVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.dao.BookDAO"%>
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
		BookDAO dao = new BookDAO();
		ArrayList<BookVO> list = dao.detailBook(bookid);
		
	%>	
	<table border="1">
		<tr>
			<td>������ȣ</td>
			<td>������</td>
			<td>���ǻ��</td>
			<td>����</td>
		</tr>
		<tr>
		<%
			for(BookVO v : list){
		%>
				<td><%= v.getBookid() %></td>
				<td><%= v.getBookname()%></td>
				<td><%= v.getPublisher()%></td>
				<td><%= v.getPrice()%></td>
		<%		
			}
		%>
		</tr>
	</table>
</body>
</html>