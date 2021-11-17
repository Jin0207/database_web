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
		관리자 이름: <select>
						<option></option>
					</select> <br>
		근무개월수 : <input type ="text" name="months"> <br>
		<input type = "submit" value="검색">
		<input type = "reset" value="취소">
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
				<td>사원번호</td>
				<td>사원명</td>
				<td>입사일</td>
				<td>연봉</td>
				<td>주민번호</td>
				<td>아이디</td>
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