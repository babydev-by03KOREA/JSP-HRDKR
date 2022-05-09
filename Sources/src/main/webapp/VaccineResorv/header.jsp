<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<style>
	header{
		position: fixed;
		top: 0px;
		width: 100%;
		height: 45px;
		font-size: 35px;
		text-align: center;
		color: white;
		background-color: black;
	}
	nav{
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
		(과정평가형 정보처리산업기사) 백신접종 예약프로그램 ver 2021-08
	</header>
	<nav>
		<a href="VaccineResorve.jsp">백신접종예약</a> &nbsp; &nbsp;
		<a href="ResorveSearch.jsp">백신예약조회</a> &nbsp; &nbsp;
		<a href="HospitalAmount.jsp">접종인원통계</a> &nbsp; &nbsp;
		<a href="index.jsp">홈으로</a>
	</nav>
</body>
</html>