<%@page import="com.sist.vo.CinemaVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="com.sist.dao.CinemaDAO"%>
<%@page import="com.sist.dao.OrdersDAO"%>
<%@page import="com.sist.vo.OrdersVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="cinema.jsp" method="post">
		�����̸�: <input type="text" name="cinemaName"><br>
		<input type="submit" value="��ȸ">
	</form>
	<%
		request.setCharacterEncoding("euc-kr");
		if(request.getParameter("cinemaName") != null){
			String cinemaName = request.getParameter("cinemaName");
			CinemaDAO dao = new CinemaDAO();
			ArrayList<CinemaVO> list = dao.infoCinema(cinemaName);
			int tot = dao.totalCinema(cinemaName);
	%>
		<table>
			<tr>
				<td>�󿵰���ȣ</td>
				<td>��ȭ����</td>
				<td>����</td>
				<td>�¼���</td>
			</tr>
			<%
			for(CinemaVO vo : list){
				%>
				<tr>
					<td><%= vo.getCinemaNo()%></td>
					<td><%= vo.getMovieName()%></td>
					<td><%= vo.getPrice()%></td>
					<td><%= vo.getSeat()%></td>
				</tr>
				
				<%
			}
			
			%>
		</table>
		�Ѽ���: <%= tot %>
	<%
		}
	
	%>
</body>
</html>