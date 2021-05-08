<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록조회/수정</title>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="container">
	<div class="main">
		<h3>회원목록조회/수정</h3>
		<table border="1px solid black">
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>전화번호</th>
				<th>통신사</th>
				<th>가입일자</th>
				<th>고객등급</th>
				<th>거주지역</th>
			</tr>
			<%
				for(MemberVO list : memberList){
			%>
					<tr>
						<td><a href="update.jsp?custno=<%=list.getCustno()%>"><%= list.getCustno() %></a></td>
						<td><%= list.getCustname() %></td>
						<td><%= list.getPhone() %></td>
						<td><%= list.getAddress() %></td>
						<td><%= sf2.format(list.getJoindate()) %></td>
						<td><%= instance.grade(list.getGrade()) %></td>
						<td><%= instance.city(list.getCity()) %></td>
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