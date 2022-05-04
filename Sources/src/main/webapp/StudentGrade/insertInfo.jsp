<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생등록</title>
<style>
	section {
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
	<h2><b>학생등록</b></h2><br/>
		<form action="insertInfoPro.jsp" method="post" name="info" onsubmit="return validate();">
			<table border="1">
				<tr>
					<td>학번</td>
					<td align="left"><input type="text" id="id" name="id"/>예) 30107</td>
				</tr>
				<tr>
					<td>이름</td>
					<td align="left"><input type="text" id="name" name="name">예) 박형주</td>
				</tr>
				<tr>
					<td>성별</td>
					<td align="left">
						<input type="checkbox" id="gender1" name="gender" value="남"><label for="male">남자</label>
						<input type="checkbox" id="gender2" name="gender" value="여"><label for="female">여자</label>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="전송">
						<input type="reset" value="다시작성">
					</td>
				</tr>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>