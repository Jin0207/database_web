<%@page import="com.sist.dao.BookDAO"%>
<%@page import="com.sist.vo.BookVO"%>
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
 
 BookVO b = new BookVO(bookid, bookname, publisher, price);
 BookDAO dao = new BookDAO();
 int re = dao.insertBook(b);
 if(re == 1){
	 %>
	   도서등록에 성공하였습니다.
	 <%
	 
 }else{
	 %>
	   도서등록에 실패하였습니다.
	 <%
 }
%>
</body>
</html>