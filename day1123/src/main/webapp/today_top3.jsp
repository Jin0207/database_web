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
	<h2>오늘의 TOP3</h2>
	<table border="1" width="60%">
		<tr>
		<td>도서명</td>
		<td>판매수</td>
		</tr>
		<%
		BookDAO dao = new BookDAO();
		ArrayList<BookVO> list = dao.listTop3();
		for(BookVO b : list){
		%>
			<tr>
				<td><%= b.getBookname() %></td>
				<td><%= b.getCnt() %></td>
			</tr>
		
		<%
		}
		
		%>
	</table>
</body>
</html>