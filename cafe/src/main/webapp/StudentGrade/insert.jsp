<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 성적등록</title>
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
		<h2><b>학생 성적 등록</b></h2><br/>	
		<form action="insertPro.jsp" method="post" onsubmit="return validate2();">
		<table border="1">
			<tr>
				<td width="80px">학번</td>
				<td align="left"><input type="text" name="id" id="id" placeholder="학번을 입력하세요."> 예) 30107&nbsp;</td>
			</tr>
			<tr>
				<td width="80px">국어</td>
				<td align="left"><input type="text" name="korean" id="korean" placeholder="국어성적을 입력하세요."> 숫자만 입력&nbsp;</td>
			</tr>
			<tr>
				<td width="80px">수학</td>
				<td align="left"><input type="text" name="math" id="math" placeholder="수학성적을 입력하세요."> 숫자만 입력&nbsp;</td>
			</tr>
			<tr>
				<td width="80px">영어</td>
				<td align="left"><input type="text" name="english" id="english" placeholder="영어성적을 입력하세요."> 숫자만 입력&nbsp;</td>
			</tr>
			<tr>
				<td width="80px">역사</td>
				<td align="left"><input type="text" name="history" id="history" placeholder="역사성적을 입력하세요."> 숫자만 입력&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="등록">
					<input type="reset" value="다시쓰기"/>
				</td>
			</tr>
		</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>