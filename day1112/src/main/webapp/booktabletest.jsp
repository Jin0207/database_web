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
	<form action="booktabletest.jsp" method="post">
			도서번호를 입력하세요 => <input type="number" name="bookid">
			도서명을 입력하세요 => <input type="text" name="bookname">
			<br>
			출판사명을 입력하세요 => <input type="text" name="publisher">
			도서가격을 입력하세요 => <input type="number" name="price">
			<br>
			<input type="submit" value="추가">
	</form>
	<%
		BookDAO dao = new BookDAO();
		request.setCharacterEncoding("euc-kr");
		if(request.getParameter("bookid") != null && request.getParameter("bookname") != null && request.getParameter("publisher") != null && request.getParameter("price") != null ){
			int bookid = Integer.parseInt(request.getParameter("bookid"));
			String bookname = request.getParameter("bookname");
			String publisher = request.getParameter("publisher");
			int price = Integer.parseInt(request.getParameter("price"));
			dao.addBook(bookid, bookname, publisher, price);

		}
		ArrayList<BookVO> list = dao.printBookList();
	%>
		<table border="1">
			<tr>
				<td>도서번호</td>
				<td>도서명</td>
				<td>출판사명</td>
				<td>도서가격</td>
			</tr>
		<%
			for(BookVO vo : list){
		%>
				<tr>
					<td><%= vo.getBookid() %> </td>
					<td><%= vo.getBookname() %> </td>
					<td><%= vo.getPublisher() %> </td>
					<td><%= vo.getPrice() %> </td>
				</tr>
	<%
		}
	%>
		</table>			
</body>
</html>