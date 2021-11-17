<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<select>
		<option>사과</option>
		<option>포도</option>
		<option>수박</option>
	</select>
	<hr>
	<%
		String[] list = {"윤태인","김시아","노유나","박성미","임상진","윤서우"};
	
	%>
	<select>
	<%
		for(String name : list){
		%>
			<option><%= name %></option>
		<%	
		}
	%>
	</select>
</body>
</html>