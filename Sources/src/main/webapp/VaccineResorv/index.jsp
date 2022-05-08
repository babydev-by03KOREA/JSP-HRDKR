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
		top: 70px;
		width: 100%;
		height: 100%;
		background-color: lightgray;
	}
	h2 {
		text-align: center;
	}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
	<h2><b>과정평가형 자격 CBQ</b></h2><br/>
	국가직무능력표준(NCS: Nation Competency Standards)으로 설계된 교육 훈련과정을 체계적으로 이수하<br/>
	고 내외부 평가를 거쳐 취득하는 국가기술자격입니다.<br/>
	산업현장 중심의 교육평가로 더 커지는 능력!<br/>
	알고 있는 것에 할 수 있는 것을 더하는<br/>
	과정평가형 자격은<br/>
	현장 중심형 인재육성을 지원합니다.<br/>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>