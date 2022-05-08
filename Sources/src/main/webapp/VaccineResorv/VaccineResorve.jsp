<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>백신접종예약</title>
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
		<h2><b>백신접종예약</b></h2><br/>
		<form action="ResorvePro.jsp" method="post" onsubmit="return validate1();">
			<table border="1">
				<tr>
					<td>접종 예약번호</td>
					<td align="left"><input type="text" id="RESVNO" name="RESVNO"/>예) 2021001</td>
				</tr>
				<tr>
					<td>주민번호</td>
					<td align="left"><input type="text" id="JUMIN" name="JUMIN"/>예) 710101-1000001</td>
				</tr>
				<tr>
					<td>백신코드</td>
					<td align="left"><input type="text" id="VCODE" name="VCODE"/>예) V001~V003</td>
				</tr>
				<tr>
					<td>병원코드</td>
					<td align="left"><input type="text" id="HOSPCODE" name="HOSPCODE"/>예) H001</td>
				</tr>
				<tr>
					<td>예약일자</td>
					<td align="left"><input type="text" id="RESVDATE" name="RESVDATE"/>예) 20211231</td>
				</tr>
				<tr>
					<td>예약시간</td>
					<td align="left"><input type="text" id="RESVTIME" name="RESVTIME"/>예) 12:30</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="등록"/>
						<input type="reset" value="다시쓰기" onclick="restart()"/>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>