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
		출판사명을 입력해주세요 ==> <input type="text" name="publisher">
		<input type="submit" value="검색">
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
						<td>도서번호</td>
						<td>도서명</td>
						<td>출판사</td>
						<td>가격</td>
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