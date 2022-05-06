<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환영합니다!</title>
<style>
	section {
		position: fixed;
		top:65px;
		width: 100%;
		height: 100%;
		background-color: lightgray;
	}
	h2 {
		text-align:center;
	}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
	<h2><b>Patient Management System</b></h2><br/>
	It is a program that registers, inquires, and deletes patient information, test status, and test results for Every Nurses. <br/>
	시험지에는 환자등록 항목이 존재하지 않습니다만, 등록하기가 더 편해서 제작해두었습니다. <br/>
	DB CRUD를 확인하시려면, DB IP값을 로컬로 변경해주세요!
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>