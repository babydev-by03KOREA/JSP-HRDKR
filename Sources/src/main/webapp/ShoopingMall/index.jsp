<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환영합니다!</title>
<style>
	section{
		position: fixed;
		top: 75px;
		width: 100%;
		height: 100%;
		background-color: lightgray;
	}
	h2{
		text-align:center;
	}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h2><b>쇼핑몰 회원관리 프로그램</b></h2><br/>
		<p>
			<strong>본 문제는 과정평가형 자격 원형문제입니다. 가장FM이 되는 문제라고 생각하시고, 해당 기술 사용법을 숙지해두세요.</strong><br/>
			쇼핑몰 회원정보와 회원매출정보 데이터베이스를 구축하고 회원관리 프로그램을 작성하는 프로그램이다.<br/>
			프로그램 작성 순서<br/>
			1. 회원정보 테이블을 생성한다.<br/>
			2. 매출정보 테이블을 생성한다.<br/>
			3. 회원정보, 매출정보 테이블에 제시된 문제지의 참조데이터를 추가 생성한다.<br/>
			4. 회원정보 입력 화면프로그램을 작성한다.<br/>
			5. 회원정보 조회 프로그램을 작성한다.<br/>
			6. 회원매출정보 조회 프로그램을 작성한다.<br/>
		</p>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>