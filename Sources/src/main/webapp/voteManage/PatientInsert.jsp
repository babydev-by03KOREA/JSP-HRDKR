<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환자정보입력</title>
<style>
	section {
		position: fixed;
		top:65px;
		width: 100%;
		height: 100%;
		background-color: lightgray;
	}
	h2 {
		text-align:center;
	}
	form {
		display:flex;
		align-items: center;
		justify-content: center;
	}
</style>
<script src="validation_vote.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
	<h2><b>환자정보 입력</b></h2><br/>
	<form action="PatientInsertPro.jsp" method="post">
		<table border="1">
			<tr>
				<td>환자 코드</td>
				<td align="left"><input type="text" name="P_NO" id="P_NO">Ex) 1001</td>
			</tr>
			<tr>
				<td>환자 이름</td>
				<td align="left"><input type="text" id="P_NAME" name="P_NAME">Ex) 박형주</td>
			</tr>
			<tr>
				<td>환자 生年月日</td>
				<td align="left"><input type="text" name="P_BIRTH" id="P_BIRTH" placeholder="주민등록상 생년월일 8자리">Ex) 20031122</td>
			</tr>
			<tr>
				<td>환자 성별</td>
				<td align="left">
					<select name="P_GENDER" id="P_GENDER">
						<option value="null">--환자 성별을 선택하세요--</option>
						<option value="M">남</option>
						<option value="F">여</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>환자 전화번호</td>
				<td align="left">
					<input style="width:35px" type="tel" name="P_TEL1" id="P_TEL1"> - 
					<input style="width:35px" type="tel" name="P_TEL2" id="P_TEL2"> - 
					<input style="width:35px" type="tel" name="P_TEL3" id="P_TEL3">
				Ex) 010-8692-****</td>
			</tr>
			<tr>
				<td>환자 거주지</td>
				<td><input type="radio" value="10" id="P_CITY1" name="P_CITY">서울(10)
				<input type="radio" value="20" id="P_CITY2" name="P_CITY">경기(20)
				<input type="radio" value="30" id="P_CITY3" name="P_CITY">강원(30)
				<input type="radio" value="40" id="P_CITY4" name="P_CITY">대구(40)</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="전송" onclick="return Vote_Validate1();"/>
					<input type="reset" value="다시작성"/>
				</td>
			</tr>
		</table>
	</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>