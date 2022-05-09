<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
	section{
		position: fixed;
		top: 70px;
		width: 100%;
		height: 100%;
		background-color: lightgray;
	}
	h2 {
		text-align:center;
	}
	form{
		display:flex;
		align-items: center;
		justify-content: center;
		text-align: center;
	}
	span {
		margin-left: 45%;
		text-decoration: underline;
		color: orange;
	}
</style>
<script src="validation.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
	<h2><b>회원가입</b></h2><br/>
	<form action="JoinPro.jsp" method="post" onsubmit="return validateJoin()">
		<table border="1">
			<tr>
				<td align="left">아이디</td>
				<td align="left"><input type="text" width="200px" name="USERID" id="USERID"/></td>
			</tr>
			<tr>
				<td align="left">이름</td>
				<td align="left"><input type="text" width="200px" name="USERNM" id="USERNM"/></td>
			</tr>
			<tr>
				<td align="left">비밀번호</td>
				<td align="left"><input type="password" width="200px" name="PASSWD" id="PASSWD"/></td>
			</tr>
			<tr>
				<td align="left">비밀번호확인</td>
				<%-- 이 값은 넘길 필요가 없습니다. Validation value에서만 사용됩니다. --%>
				<td align="left"><input type="password" width="200px" id="REPASSWD"/></td>
			</tr>
			<tr>
				<td align="left">주민번호</td>
				<td align="left"><input type="text" width="200px" name="JUMIN1" id="JUMIN1"/>-<input type="password" width="200px" name="JUMIN2" id="JUMIN2"/></td>
			</tr>
			<tr>
				<td align="left">성별</td>
				<td align="left">
				남<input type="radio" name="GENDER" id="GENDER1" value="1"/>
				여<input type="radio" name="GENDER" id="GENDER2" value="2"/>
				</td>
			</tr>
			<tr>
				<td align="left">주소</td>
				<td align="left" width="500px"><input type="text" name="ADDRESS" id="ADDRESS"/></td>
			</tr>
			<tr>
				<td align="left">직업</td>
				<td align="left">
					<select name="JOBCD" id="JOBCD">
						<option value="null">==직업을 선택하세요==</option>
						<option value="1">학생</option>
						<option value="2">회사원</option>
						<option value="3">공무원</option>
						<option value="4">군인</option>
						<option value="5">기타</option>
					</select>
				</td>
			</tr>
			<tr>
				<td align="left">매일수신여부</td>
				<td align="left">
					동의함 <input type="checkbox" name="MAILRCV" id="MAILRCV" value="Y"/>
					<input type="hidden" id="MAILRCV" name="MAILRCV" value="N" />
				</td>
			</tr>
			<tr>
				<td align="left">자기소개</td>
				<td align="left">
				<textarea id="INTRO" name="INTRO">
				</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="가입"/></td>
			</tr>
		</table>
	</form>
	<span><a href="index.jsp">홈으로</a></span>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>