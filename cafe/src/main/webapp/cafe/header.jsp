<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<style>
	header {
		position: fixed;
		top: 0px;
		width: 100%;
		height: 40px;
		font-size: 30px;
		background-color: black;
		text-align: center;
		color: white;
	}
	nav {
		position: fixed;
		top: 40px;
		width: 100%;
		height: 25px; /* top: 65px for section*/
		background-color: gray;
	}
	a{
		text-decoration: none;
		color: black;
	}
</style>
</head>
<body>
	<header>
		매장별 커피 판매관리 ver 1.0
	</header>
	<nav>
		<a href="sale.jsp">판매등록</a> &nbsp; &nbsp;
		<a href="SaleList.jsp">판매현황</a> &nbsp; &nbsp;
		<a href="#">매장판매액</a> &nbsp; &nbsp;
		<a href="CountList.jsp">상품별판매액</a> &nbsp; &nbsp;
		<a href="index.jsp">홈으로</a> &nbsp; &nbsp;
	</nav>
</body>
</html>