<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원매출조회</title>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="container">
	<div class="main">
		<h3>회원매출조회</h3>
		<table border="1px solid black">
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>고객등급</th>
				<th>매출</th>
			</tr>
			<%
				for(MoneyVO list : moneyList){
			%>
					<tr>
						<td><%= list.getCustno() %></td>
						<td><%= list.getCustname() %></td>
						<td><%= instance.grade(list.getGrade()) %></td>
						<td><%=	df.format(list.getPrice()) %></td>
					</tr>
			<%		
				}
			%>
		</table>
	</div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>