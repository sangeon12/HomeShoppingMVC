<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등록</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%
	String custname = "";
	String phone = "";
	String address = "";
	String grade = "";
	String city = "";
	
	
	custname = request.getParameter("custname");
	phone = request.getParameter("phone");
	address = request.getParameter("address");
	grade = request.getParameter("grade");
	city = request.getParameter("city");
	MemberVO vo = new MemberVO(instance.maxCustno(), custname, phone, address, grade, city);
	instance.insertMemberList(vo);
%>
<div class="container">
	<div class="main">
		<h3>홈쇼핑 회원등록</h3>
		<form action="join.jsp">
			<table border="1px solid black">
				<tr>
					<th>회원번호(자동발생)</th>
					<td><input type="text" name="custno" value="<%= instance.maxCustno() %>" readonly="readonly"></td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td><input type="text" name="custname" value="<%= custname %>"></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input type="text" name="phone" value="<%= phone %>"></td>
				</tr>
				<tr>
					<th>통신사[SK,KT,LG]</th>
					<td><input type="text" name="address" value="<%= address %>"></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input type="text" name="joindate" value="<%= sf.format(now) %>" readonly="readonly"></td>
				</tr>
				<tr>
					<th>고객등급[A:VIP,B:일반,C:직원]</th>
					<td><input type="text" name="grade" value="<%= grade %>"></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><input type="text" name="city" value="<%= city %>"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="등록">
						<input type="button" value="조회" onclick="memberList.jsp">
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
<%@ include file="footer.jsp" %>
<script type="text/javascript">
	alert("회원등록이 완료되었습니다.");
	location.href='index.jsp';
</script>
</body>
</html>