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
			������ȣ�� �Է��ϼ��� => <input type="number" name="bookid">
			�������� �Է��ϼ��� => <input type="text" name="bookname">
			<br>
			���ǻ���� �Է��ϼ��� => <input type="text" name="publisher">
			���������� �Է��ϼ��� => <input type="number" name="price">
			<br>
			<input type="submit" value="�߰�">
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
				<td>������ȣ</td>
				<td>������</td>
				<td>���ǻ��</td>
				<td>��������</td>
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