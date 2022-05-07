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
		top:0px;
		width: 100%;
		height: 50px;
		font-size: 30px;
		text-align: center;
		background-color: black;
		color: white;
	}
	nav {
		position: fixed;
		top: 50px;
		width: 100%;
		height: 25px;
		background-color: gray;
	}
	a {
		text-decoration: none;
		color: black;
	}
</style>
</head>
<body>
	<header>
		쇼핑몰 회원관리 ver 1.0(HRDKR 공개문제)
	</header>
	<nav>
		<a href="#">회원등록</a> &nbsp; &nbsp;
		<a href="#">회원목록조회/수정</a> &nbsp; &nbsp;
		<a href="#">회원매출조회</a> &nbsp; &nbsp;
		<a href="index.jsp">홈으로</a> &nbsp; &nbsp;
	</nav>
</body>
</html>