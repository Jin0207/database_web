<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>주문 등록</h2>
	<form action="insertOrdersOK.jsp" Method="post">
		주문번호: <input type="text" name="orderid"><br>
		고객번호: <input type="text" name="custid"><br>
		도서번호: <input type="text" name="bookid"><br>
		구매금액: <input type="text" name="saleprice"><br>
		<input type="submit" value="등록">
		<input type="reset" value="취소">
	</form>
	
</body>
</html>