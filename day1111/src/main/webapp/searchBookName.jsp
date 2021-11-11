<%@page import="com.sist.dao.SearchBookNameDAO"%>
<%@page import="com.sist.vo.SearchBookNameVO"%>
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
	<form action="searchBookName.jsp" method="post">
		구입하지 않은 도서 검색하기
		<hr>
		고객이름을 입력하세요=> <input type="text" name="name">
		<input type="submit" value="검색">
	</form>
	<%	
		request.setCharacterEncoding("euc-kr");
		if(request.getParameter("name") != null){
			String name = request.getParameter("name");
			SearchBookNameDAO dao = new SearchBookNameDAO();
			ArrayList<SearchBookNameVO> list = dao.listBookName(name);
	%>
			<table border="1">
				<tr>
					<td>도서명</td>
				</tr>
				<%for(SearchBookNameVO vo : list){
				%>
				<tr>
					<td><%= vo.getBookname()%></td>
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