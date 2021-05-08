<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
    <%@ page import="java.text.SimpleDateFormat" %>
    <%@ page import="java.text.DecimalFormat" %>
    <%@ page import="main.DAO" %>
    <%@ page import="main.MemberVO" %>
    <%@ page import="main.MoneyVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#a{
		height: 50px;
		background-color: blue;
		color: white;
		text-align: center;
	}
	#b{
		height: 20px;
		background-color: purple;
	}
	a{
		text-decoration: none;
		color: white;
	}
	.container{
		height:	450px;
		background-color: gray;
	}
</style>
</head>
<body>
<%
	DAO instance = DAO.getInstance();
	ArrayList<MemberVO> memberList = instance.memberList;
	ArrayList<MoneyVO> moneyList = instance.moneyList;
	ArrayList<MemberVO> updateList = instance.updateList;
	Date now = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
	SimpleDateFormat sf2 = new SimpleDateFormat("yyyy-MM-dd");
	DecimalFormat df = new DecimalFormat("#,###");
%>
	<div id="a">
		<h2>쇼핑몰 회원관리 ver 1.0</h2>
	</div>
	<div id="b">
		<a href="join.jsp">회원등록</a>
		<a href="memberList.jsp">회원목록조회/수정</a>
		<a href="moneyList.jsp">회원매출조회</a>
		<a href="index.jsp">홈으로</a>
	</div>
</body>
</html>