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
		�������� ���� ���� �˻��ϱ�
		<hr>
		���̸��� �Է��ϼ���=> <input type="text" name="name">
		<input type="submit" value="�˻�">
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
					<td>������</td>
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