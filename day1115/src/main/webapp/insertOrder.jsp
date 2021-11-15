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
	<form action="insertOrder.jsp" method="post">
		주문번호: <input type="text" name="orderid"><br>
		고객번호: <input type="text" name="custid"><br>
		도서번호: <input type="text" name="bookid"><br>
		판매가격: <input type="text" name="saleprice"><br>
		<input type="submit" value="추가">
		
		<input type="reset" value="취소">
	</form>
	<%
		request.setCharacterEncoding("euc-kr");
		String orderid = request.getParameter("orderid");
		String custid = request.getParameter("custid");
		String bookid = request.getParameter("bookid");
		String saleprice = request.getParameter("saleprice");
		if(orderid != null && custid != null && bookid != null && saleprice != null){
			OrdersVO vo = new OrdersVO(Integer.parseInt(orderid), Integer.parseInt(custid), Integer.parseInt(bookid), Integer.parseInt(saleprice));
			OrdersDAO dao = new OrdersDAO();
			int re = dao.insertOrders(vo);
			if(re == 1){
	%>
			성공하였습니다.
	<%
			}else{
	%>
			실패하였습니다.
	<%			
			}	
		}
	
	%>
</body>
</html>