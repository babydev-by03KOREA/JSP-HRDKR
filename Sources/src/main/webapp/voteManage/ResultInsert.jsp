<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검사결과입력</title>
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
	#P_NO, #T_LDATE, #T_SDATE {
		width: 200px;
	}
	#T_CODE {
		width: 150px;
	}
</style>
<script src="validation_vote.js">
</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h2><b>검사결과입력</b></h2><br/>
		<form action="ResultInsertPro.jsp" method="post" onsubmit="return validate()">
			<table border="1">
				<tr>
					<td>환자코드</td>
					<td align="left"><input type="text" name="P_NO" id="P_NO" />예)1001</td>
				</tr>
				<tr>
					<td>검사명</td>
					<td align="left">
					<select name="T_CODE" id="T_CODE">
						<option value="null">검사명</option>
						<option value="T001">[T001]결핵</option>
						<option value="T002">[T002]장티푸스</option>
						<option value="T003">[T003]수두</option>
						<option value="T004">[T004]홍역</option>
						<option value="T005">[T005]콜레라</option>
					</select>
					</td>
				</tr>
				<tr>
					<td>검사시작일</td>
					<td align="left"><input type="text" name="T_SDATE" id="T_SDATE" />예)20200101</td>
				</tr>
				<tr>
					<td>검사상태</td>
					<td align="left">
						<input type="radio" name="T_STATUS" id="T_STATUS1" value="1"/> 검사 중
						<input type="radio" name="T_STATUS" id="T_STATUS2" value="2"/> 검사 완료
					</td>
				</tr>
				<tr>
					<td>검사완료일</td>
					<td align="left"><input type="text" name="T_LDATE" id="T_LDATE" />예)20200101</td>
				</tr>
				<tr>
					<td>검사결과</td>
					<td align="left">
						<input type="radio" name="T_RESULT" id="T_RESULT1" value="X" /> 미입력
						<input type="radio" name="T_RESULT" id="T_RESULT2" value="P" /> 양성
						<input type="radio" name="T_RESULT" id="T_RESULT3" value="N" /> 음성
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center">
						<input type="submit" value="등록"/>
						<input type="reset" value="재입력" onclick="rewrite()"/>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>