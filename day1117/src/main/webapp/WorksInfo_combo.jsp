<%@page import="com.sist.vo.WorkersInfoVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.dao.WorkersInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="WorksInfo_combo.jsp" method="post">
		������ �̸�: <select>
						<option></option>
					</select> <br>
		�ٹ������� : <input type ="text" name="months"> <br>
		<input type = "submit" value="�˻�">
		<input type = "reset" value="���">
	</form>
	<%
	request.setCharacterEncoding("euc-kr");
	if(request.getParameter("mName") != null && request.getParameter("months") != null){
		String mName = request.getParameter("mName");
		int months = Integer.parseInt(request.getParameter("months"));
		WorkersInfoDAO dao = new WorkersInfoDAO();
		ArrayList<WorkersInfoVO> list = dao.getList(mName, months);
	%>	
		<table border="1">
			<tr>
				<td>�����ȣ</td>
				<td>�����</td>
				<td>�Ի���</td>
				<td>����</td>
				<td>�ֹι�ȣ</td>
				<td>���̵�</td>
			</tr>
		<%for( WorkersInfoVO v: list){
		%>
			<tr>
				<td><%=v.getEno() %></td>
				<td><%=v.getEname() %></td>
				<td><%=v.getHirdate() %></td>
				<td><%=v.getSalary() %></td>
				<td><%=v.getJumin() %></td>
				<td><%=v.getId() %></td>
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