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
	<form action="booktest.jsp" method="post">
		고객 이름을 입력하세요 => <input type="text" name="name">
		<input type="submit" value="확인">
	</form>
	
	<%
		request.setCharacterEncoding("euc-kr");
		if( request.getParameter("name") != null ){
			String name = request.getParameter("name");
			BookDAO dao = new BookDAO();
			ArrayList<String> list = dao.getNotpuchased(name);
	%>
			<table border="1">
				<tr>
					<td>도서명</td>				
				</tr>
				<%
				for( String data : list){
					%>
						<tr>
							<td><%= data %></td>
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