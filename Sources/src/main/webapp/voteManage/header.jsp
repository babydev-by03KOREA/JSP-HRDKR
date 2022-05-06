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
		font-size: 30px;
		background-color: black;
		color: white;
	}
	nav {
		position: fixed;
		top: 45px;
		width: 100%;
		height: 30px;
		/* section-top: 75px*/
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
		(과정평가형 산업기사) 환자 검사 프로그램
	</header>
	<nav>
		<a href="PatientList.jsp">환자조회</a> &nbsp; &nbsp;
		<a href="PatientInsert.jsp">환자등록</a> &nbsp; &nbsp;
		<a href="ResultInsert.jsp">검사결과입력</a> &nbsp; &nbsp;
		<a href="#">검사결과조회</a> &nbsp; &nbsp;
		<a href="#">지역별검사건수</a> &nbsp; &nbsp;
		<a href="index.jsp">홈으로</a> &nbsp; &nbsp;
	</nav>
</body>
</html>