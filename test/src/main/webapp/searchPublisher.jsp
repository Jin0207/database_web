<%@page import="com.sist.dao.BookDAO"%>
<%@page import="com.sist.vo.BookVO"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="searchPublisher.jsp" method="post">
		���ǻ���� �Է����ּ��� ==> <input type="text" name="publisher">
		<input type="submit" value="�˻�">
	</form>
		<%
			request.setCharacterEncoding("EUC-KR");
			if(request.getParameter("publisher") != null){
				String publisher = request.getParameter("publisher");
				BookDAO dao = new BookDAO();
				ArrayList<BookVO> list = dao.searchPublisher(publisher);
				%>
				<table border="1">
					<tr>
						<td>������ȣ</td>
						<td>������</td>
						<td>���ǻ�</td>
						<td>����</td>
					</tr>
				<% for( BookVO vo : list){
					%>
					<tr>
						<td><%= vo.getBookid() %></td>
						<td><%= vo.getBookname() %></td>
						<td><%= vo.getPublisher() %></td>
						<td><%= vo.getPrice() %></td>
					</tr>
					<%
				}
				%>
				</table>
				<%
				
			}
		
		
		%>
</body>
</html>