<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.dao.SearchInfoDAO"%>
<%@page import="com.sist.vo.SearchInfoVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="SearchLocation.jsp" method="post"	>
		������ �Է��ϼ��� ==> <input type="text" name="dloc">
		<input type="submit" value="�˻�">
	</form>
	<%
		request.setCharacterEncoding("euc-kr");
		if(request.getParameter("dloc") != null){
			String dloc = request.getParameter("dloc");
			SearchInfoDAO dao = new SearchInfoDAO();
			ArrayList<SearchInfoVO> list = dao.listLocation(dloc);
	%>
		<table border="1">
			<tr>
				<td>�����ȣ</td>
				<td>�̸�</td>
				<td>�޿�</td>
				<td>����</td>
				<td>�Ǽ��ɾ�</td>
				<td>�μ���ȣ</td>
				<td>�μ���</td>
			</tr>
			<% for(SearchInfoVO vo : list){
			%>
				<tr>
				<td><%= vo.getEno()%></td>
				<td><%= vo.getEname()%></td>
				<td><%= vo.getSalary()%></td>
				<td><%= vo.getComm() %></td>
				<td><%= vo.getPay()%></td>
				<td><%= vo.getDno()%></td>
				<td><%= vo.getDname()%></td>
				</tr>
			<%
			} 
			%>
	<%
		}
	%>
	</table>
</body>
</html>