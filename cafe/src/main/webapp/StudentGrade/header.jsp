<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>안녕하세요? 대가리에요</title>
<style>
	header {
		position: fixed;
		top: 0px;
		width: 100%;
		height: 50px;
		text-align: center;
		font-size: 35px;
		line-height: 35px;
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
		학생 성적 조회 프로그램 ver 1.0
	</header>
	<nav>
		<a href="StudentList.jsp">학생조회</a> &nbsp; &nbsp;
		<a href="insertInfo.jsp">학생등록</a> &nbsp; &nbsp;
		<a href="insert.jsp">학생성적입력</a> &nbsp; &nbsp;
		<a href="GradeList.jsp">학생성적조회</a> &nbsp; &nbsp;
		<a href="index.jsp">홈으로</a>
	</nav>
</body>
</html>