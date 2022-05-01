<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매등록</title>
<style>
	section {
		position: fixed;
		top: 65px;
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
	
	.tdd {
		width: 300px;
	}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h2><b>판매등록</b></h2><br/>
		<form action="salePro.jsp" method="post">
		<table border="1">
			<tr>
				<td>판매번호</td>
				<td align="left"><input type="text" class="tdd" name="saleno" placeholder="판매번호를 입력하세요(숫자)">ex) 100001</td>
			</tr>
			<tr>
				<td>상품코드</td>
				<td align="left" >
					<select name="pcode" class="tdd">
						<option value="null">--상품코드를 선택하세요--</option>
						<option value="AA01">A001</option>
						<option value="AA02">A002</option>
						<option value="AA03">A003</option>
						<option value="AA04">A004</option>
						<option value="AA05">A005</option>
					</select>
					
				</td>
			</tr>
			<tr>
				<td>판매날짜</td>
				<td align="left"><input type="text" class="tdd" name="saledate" placeholder="'/'없이 작성하세요.">ex) 20220501</td>
			</tr>
			<tr>
				<td>매장코드</td>
				<td align="left">
				<select name="scode" class="tdd">
					<option value="null">--매장코드를 선택하세요--</option>
					<option value="S001">S001</option>
					<option value="S002">S002</option>
					<option value="S003">S003</option>
					<option value="S004">S004</option>
				</select>
				
				</td>
			</tr>
			<tr>
				<td>판매수량</td>
				<td align="left"><input type="text" class="tdd" name="amount">10개 단위로 입력하세요.</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="등록"/>
					<input type="reset" value="다시쓰기"/>
				</td>
			</tr>
		</table>
		</form>
		<jsp:include page="footer.jsp"></jsp:include>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>