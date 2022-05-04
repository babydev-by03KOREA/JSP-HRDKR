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
	
	h2 {
		text-align: center;
	}
	
	p {
		margin-left: 20px;
	}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h2><b>학생성적 관리 프로그램</b></h2><br/>	
		<p>
			학생과 학생 성적에 관한 데이터베이스를 구축하고 관리하기 위한 프로그램이다.<br/><br/>
			1. 학생정보 및 학생성적 테이블을 생성하고 셈플데이터를 추가한다. <br/>
			2. 학생조회, 학생성적 입력, 학생성적 조회 프로그램을 작성한다. <br/>
			3. 올바르게 구현되었는지 확인한다. <br/>
			* 반드시! <b>학생 등록 후 성정입력</b>바랍니다* <br/>
			기존에 구축되어 있던 비동기적 쿼리문 및 구조화를 시켜두었습니다. <br/>
			최대한 객체지향 언어의 특성을 살려 조금 더 쉽게 코딩 가능하게 구현하였습니다. <br/>
		</p>	
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>