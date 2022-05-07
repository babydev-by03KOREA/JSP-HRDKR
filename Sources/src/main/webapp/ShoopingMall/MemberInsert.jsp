<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="dbms.DBConnect" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈쇼핑 회원 등록</title>
<style>
	section{
		position: fixed;
		top: 75px;
		width: 100%;
		height: 100%;
		background-color: lightgray;
	}
	h2{
		text-align:center;
	}
	form{
		display:flex;
		align-items: center;
		justify-content: center;
		text-align: center;
	}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h2><b>홈쇼핑 회원 등록</b></h2><br/>
		<form action="MemberInsertPro.jsp" method="post">
			<table border="1">
		<%
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			ResultSet rs = null;
			try{
				con = DBConnect.getConnection();
				sql = "SELECT TRIM(MAX(CUSTNO)+1) AS MX FROM MEMBER_TBL_02";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				rs.next();
		%>
				<tr>
					<th>회원번호(자동발생)</th>
					<td align="left"><input type="text" id="custno" name="custno" readonly="readonly" value="<%=rs.getInt("MX")%>"/></td>
				</tr>
		<%
			}catch(Exception e){
				System.out.println("You're MembrList AutoIncreeseMent was denide for "+e);
			}finally{ // 자원반납
				try{
					if(con != null){con.close();}
					if(pstmt != null){pstmt.close();}
					if(rs != null){rs.close();}
				}catch(SQLException e){
					e.printStackTrace();
				}
			}
		%>
				<tr>
					<th>회원성명</th>
					<td align="left"><input type="text" id="custname" name="custname"/></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td align="left"><input type="text" id="phone" name="phone" /></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td align="left"><input type="text" id="address" name="adddress" /></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td align="left"><input type="text" id="joindate" name="joindate"/></td>
				</tr>
				<tr>
					<th>고객등급[A:VIP, B:일반, C:직원]</th>
					<td align="left"><input type="text" id="grade" name="grade"/></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td align="left"><input type="text" id="city" name="city"/></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="등록"/>
						<input type="reset" id="reset" value="초기화" onclick="" />
					</td>
				</tr>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>