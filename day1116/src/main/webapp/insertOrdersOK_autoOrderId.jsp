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
<%
	//int orderid = Integer.parseInt(request.getParameter("orderid"));
	int custid = Integer.parseInt(request.getParameter("custid"));
	int bookid = Integer.parseInt(request.getParameter("bookid"));
	int saleprice = Integer.parseInt(request.getParameter("saleprice"));
	
	//OrdersVO vo = new OrdersVO(orderid, custid, bookid, saleprice, null);
	OrdersVO vo = new OrdersVO();
	//vo.setOrderid(orderid);
	vo.setCustid(custid);
	vo.setBookid(bookid);
	vo.setSaleprice(saleprice);
	
	OrdersDAO dao = new OrdersDAO();
	int re = dao.insertOrders(vo);
	
	if(re == 1){
%>
		�ֹ���Ͽ� �����Ͽ����ϴ�.
<%		
	}else{
%>
		�ֹ���Ͽ� �����Ͽ����ϴ�.
<%		
	}

%>
</body>
</html>