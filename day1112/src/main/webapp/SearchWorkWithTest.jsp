<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.dao.SearchWorkWithDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="SearchWorkWithTest.jsp" Method="post">
		직원이름을 입력하세요 => <input type="text" name="name">
		근무지를 입력하세요 => <input type="text" name= "loc">
		<input type="submit" value="조회">
	</form>
	<%
		request.setCharacterEncoding("euc-kr");
		if( request.getParameter("name") != null ){
			String name = request.getParameter("name");
			String loc = request.getParameter("loc");
			SearchWorkWithDAO dao = new SearchWorkWithDAO();
			ArrayList<String> list = dao.searchName(name, loc);
	%>
			<%= loc %>에서 근무하거나			
			<%= name %>님과 함께일하는 분			
			<table border="1" width="400">
				<tr align="center">
					<th>이름</th>				
				</tr>
				<%
				for( String data : list){
					%>
						<tr align="center">
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