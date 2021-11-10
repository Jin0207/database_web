<%@page import="com.sist.vo.OrderBookCustomerVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.dao.OrdersBookCustomerDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="searchOrders.jsp" method="post">
		고객이름을 입력하세요 ==> <input type="text" name="name">
		<input type="submit" value="검색">
	</form>
	<%
		request.setCharacterEncoding("euc-kr");
		if(request.getParameter("name") != null){
			String name = request.getParameter("name");
			
			OrdersBookCustomerDAO dao = new OrdersBookCustomerDAO();
			ArrayList<OrderBookCustomerVO> list = dao.listorders(name);
			int tot = dao.getTotalSalePrice(name);
	%>
			<table border="1" width="80%">
				<tr>
					<td>고객번호</td>
					<td>고객명</td>
					<td>도서명</td>
					<td>출판사명</td>
					<td>도서가격</td>
					<td>판매가격</td>
					<td>판매일</td>
				</tr>
				<%
					for(OrderBookCustomerVO vo : list){
				%>
				
					<tr>
						<td><%= vo.getCustid() %></td>
						<td><%= vo.getName() %></td>
						<td><%= vo.getBookname()%></td>
						<td><%= vo.getPublisher() %></td>
						<td><%= vo.getPrice() %></td>
						<td><%= vo.getSaleprice() %></td>
						<td><%= vo.getOrderdate() %></td>
					</tr>
				
				<%
					}
				%>
			</table>
			<br>
			<hr>
			총 주문금액 : <%= tot %>
	<%
		}
		
	%>
</body>
</html>