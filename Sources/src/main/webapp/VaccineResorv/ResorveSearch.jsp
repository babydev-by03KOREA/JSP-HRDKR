<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="dbms.DBConnect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>접종예약조회</title>
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
</style>
<script src="validation.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
	<h2><b>접종예약조회</b></h2><br/>
	<form action="SearchPro.jsp" method="post" onsubmit="return validateS()">
		<table border="1">
			<tr>
				<td width="200px">예약번호를 입력하시오</td>
				<td align="left"><input width="200px" type="text" id="Query" name="RESVNO"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="예약조회" />
					<input type="button" value="홈으로" onclick="location.href='index.jsp';"/>
				</td>
			</tr>
		</table>
	</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>