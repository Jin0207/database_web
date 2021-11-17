<%@page import="com.sist.vo.BookVO"%>
<%@page import="com.sist.vo.CustomerVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.dao.CustomerDAO"%>
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
	BookDAO bookDAO = new BookDAO();
	CustomerDAO customerDAO = new CustomerDAO();
	ArrayList<BookVO> bookList = bookDAO.listBook();
	ArrayList<CustomerVO> customerList = customerDAO.listCustomer();
%>
	<h2>�ֹ� ���</h2>
	<form action="insertOrdersOK.jsp" Method="post">
		�ֹ���ȣ: <input type="text" name="orderid"><br>
		����ȣ: <select name="custid">
					<%
						for(CustomerVO vo : customerList){
					%>		
						<option value="<%= vo.getCustid()%>"><%= vo.getName() %></option>
					<%		
						}
					%>
   				  </select>
		<br>
		������ȣ: <select name="bookid">
					<%
						for(BookVO vo : bookList){
					%>		
							<option value="<%= vo.getBookid()%>"><%= vo.getBookname() %>(<%= vo.getPrice() %>)</option>
					<%		
						}
					
					%>
			      </select>
		<br>
		���űݾ�: <input type="text" name="saleprice"><br>
		<input type="submit" value="���">
		<input type="reset" value="���">
	</form>
	
</body>
</html>