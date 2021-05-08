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
<script type="text/javascript">
	function check(){
		let join = document.join;
		if(join.custname.value === ""){
			alert("이름이 입력되지않았습니다.");
			return false;
		}
		if(join.phone.value === ""){
			alert("전화번호가 입력되지않았습니다.");
			return false;
		}
		if(join.address.value === ""){
			alert("통신사 입력되지않았습니다.");
			return false;
		}
		if(join.grade.value === ""){
			alert("등급 입력되지않았습니다.");
			return false;
		}
		if(join.city.value === ""){
			alert("거주지역이 입력되지않았습니다.");
			return false;
		}
	}
</script>
<div class="container">
	<div class="main">
		<h3>홈쇼핑 회원등록</h3>
		<form action="joinPro.jsp" name="join" onsubmit="return check()">
			<table border="1px solid black">
				<tr>
					<th>회원번호(자동발생)</th>
					<td><input type="text" name="custno" value="<%= instance.maxCustno() %>" readonly="readonly"></td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td><input type="text" name="custname"></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input type="text" name="phone"></td>
				</tr>
				<tr>
					<th>통신사[SK,KT,LG]</th>
					<td><input type="text" name="address"></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input type="text" name="joindate" value="<%= sf.format(now) %>" readonly="readonly"></td>
				</tr>
				<tr>
					<th>고객등급[A:VIP,B:일반,C:직원]</th>
					<td><input type="text" name="grade"></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><input type="text" name="city"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="등록">
						<input type="button" value="조회" onclick="location.href='memberList.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>