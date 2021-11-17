<%@page import="com.sist.vo.TheaterVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.dao.TheaterDAO"%>
<%@page import="java.net.Authenticator.RequestorType"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>상영관정보 확인</h2>
	<form action="theaterTest.jsp" method="post">
		극장이름: <input type="text" name = "cinemaName">
		<input type="submit" value="확인"> 
	</form>
	<%
	request.setCharacterEncoding("euc-kr");
	if(request.getParameter("cinemaName") != null){
		String cinemaName = request.getParameter("cinemaName");
		TheaterDAO dao = new TheaterDAO();
		ArrayList<TheaterVO> list = dao.listTheater(cinemaName);
		int total = dao.getTotalByCinemaName(cinemaName);
	%>
	<table border = "1">
		<tr>
			<td>극장번호</td>
			<td>상영관번호</td>
			<td>영화제목</td>
			<td>가격</td>
			<td>좌석수</td>
		</tr>
		<%
			for(TheaterVO t :list){
				%>
				<tr>
					<td><%= t.getCinema_number()%></td>
					<td><%= t.getTheater_number()%></td>
					<td><%= t.getTitle()%></td>
					<td><%= t.getPrice()%></td>
					<td><%= t.getSeats()%></td>
				</tr>
				<%
			}
		
		%>
	</table>
	<br>
	금일 총수입: <%= total %>
	<%
	}
	
	%>
</body>
</html>