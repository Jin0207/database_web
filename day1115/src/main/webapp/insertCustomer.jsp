<%@page import="com.sist.vo.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="insertCustomerOK.jsp" method="post">
		고객번호: <input type="text" name="custid"><br>
		고객명: <input type="text" name="name"><br>
		주소: <input type="text" name="address"><br>
		전화번호: <input type="text" name="phone"><br>
		<input type="submit" value="추가">
		<input type="reset" value="취소">
	</form>
</body>
</html>