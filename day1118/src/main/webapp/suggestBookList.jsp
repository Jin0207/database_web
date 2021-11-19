<%@page import="com.sist.vo.BookVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.dao.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="suggestBookList.jsp">
		고객명: <select name="name">
					<%
						ArrayList<String> option = new BookDAO().getNameList();
						for(String s : option){
					%>
						<option><%= s %></option>
					<%		
						}
					%>
				</select>
		<input type="submit" value="검색">
		<input type="reset" value="취소">
	</form>
	<%
		request.setCharacterEncoding("euc-kr");
		if(request.getParameter("name") != null){
			String name = request.getParameter("name");
			BookDAO dao = new BookDAO();
			ArrayList<BookVO> list = dao.suggestList(name);
	%>
			<h3><%= name %>님께 추천합니다.</h3>
			<table border="1">
				<tr>
					<td>도서번호</td>
					<td>도서명</td>
					<td>출판사</td>
					<td>도서가격</td>
				</tr>
				<%
					for(BookVO v : list){
				%>		
					<tr>
						<td><%=v.getBookid() %></td>
						<td><%=v.getBookname() %></td>
						<td><%=v.getPublisher() %></td>
						<td><%=v.getPrice() %></td>
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