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
		�����̸��� �Է��ϼ��� => <input type="text" name="name">
		�ٹ����� �Է��ϼ��� => <input type="text" name= "loc">
		<input type="submit" value="��ȸ">
	</form>
	<%
		request.setCharacterEncoding("euc-kr");
		if( request.getParameter("name") != null ){
			String name = request.getParameter("name");
			String loc = request.getParameter("loc");
			SearchWorkWithDAO dao = new SearchWorkWithDAO();
			ArrayList<String> list = dao.searchName(name, loc);
	%>
			<%= loc %>���� �ٹ��ϰų�			
			<%= name %>�԰� �Բ����ϴ� ��			
			<table border="1" width="400">
				<tr align="center">
					<th>�̸�</th>				
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