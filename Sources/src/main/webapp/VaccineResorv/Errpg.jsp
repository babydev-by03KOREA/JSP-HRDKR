<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error-404</title>
<style>
	section {
		position: fixed;
		top: 70px;
		width: 100%;
		height: 100%;
		background-color: lightgray;
	}
	h2 {
		text-align: center;
	}
	form {
		display: flex;
		align-items: center;
		justify-content: center;
		text-align: center;
	}
	#back {
		text-align:center;
		margin-top: 30px;
	}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
	<h2><b>접종 예약 정보가 존재하지 않습니다.</b></h2><br/>
	<div id="back">
		<input type="button" onclick="location.href='index.jsp'" value="돌아가기"/>
	</div>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>