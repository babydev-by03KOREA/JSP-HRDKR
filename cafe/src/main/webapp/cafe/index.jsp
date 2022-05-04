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
		top: 65px;
		width: 100%;
		height: 100%;
		background-color: lightgray;
	}
	h2 {
		text-align: center;
	}
	p {
		margin-left: 10px;
	}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
	<h2><b>매장별 커피 판매관리 프로그램 ver JAVA 객체</b></h2><br/>
	<p>
		매장별 커피 판매를 관리하기 위한 프로그램이다.<br/>
	</p>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>