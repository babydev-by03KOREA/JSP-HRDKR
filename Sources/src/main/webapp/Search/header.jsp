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
		height: 45px;
		text-align: center;
		font-size: 35px;
		background-color: black;
		color: white;
	}
	nav {
		position: fixed;
		top: 45px;
		width: 100%;
		height: 25px;
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
		(과정평가형 정보처리산업기사) 회원관리 프로그램 ver 2021-09
	</header>
	<nav>
		<a href="MemberJoin.jsp">회원가입</a> &nbsp; &nbsp;
		<a href="#">회원목록</a> &nbsp; &nbsp;
		<a href="#">회원검색</a> &nbsp; &nbsp;
		<a href="index.jsp">홈으로</a>
	</nav>
</body>
</html>