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
<script src="Validation.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h2><b>회원정보 수정</b></h2><br/>
		<form action="MemberModifyPro.jsp" method="post" onsubmit="return validate();">
			<table border="1">
		<%
			request.setCharacterEncoding("UTF-8");
			int CUSTNO = Integer.parseInt(request.getParameter("CUSTNO"));
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			ResultSet rs = null;
			try{
				con = DBConnect.getConnection();
				sql = "SELECT *";
				sql += " FROM MEMBER_TBL_02 WHERE CUSTNO = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, CUSTNO);
				rs = pstmt.executeQuery();
				while(rs.next()){
		%>
		<%-- 우리는 DB명을 대문자로 써서 넘겼어요 그럼 값을 받는 친구도 대문자로 작성해야합니다.
			이 에러때문에 알바하는데 머리털 다 빠질뻔.. 그냥 id, name 모두 대문자로 작성합니다. 
			그리고 이 칸에서는 모든 회원에 값을 받는것이 아닌 회원하나 값만 필요하기에, while문을 사용하지 안습니다.--%>
				<tr>
					<th>회원번호</th>
					<td align="left"><input type="text" id="CUSTNO" name="CUSTNO" readonly="readonly" value="<%=rs.getInt("CUSTNO")%>"/></td>
				</tr>
		
				<tr>
					<th>회원성명</th>
					<td align="left"><input type="text" id="CUSTNAME" name="CUSTNAME" value="<%=rs.getString("CUSTNAME")%>"/></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td align="left"><input type="text" id="PHONE" name="PHONE" value="<%=rs.getString("PHONE")%>"/></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td align="left"><input type="text" id="ADDRESS" name="ADDRESS" value="<%=rs.getString("ADDRESS")%>"/></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td align="left"><input type="text" id="JOINDATE" name="JOINDATE" value="<%=rs.getDate("JOINDATE")%>"/></td>
				</tr>
				<tr>
					<th>고객등급[A:VIP, B:일반, C:직원]</th>
					<td align="left"><input type="text" id="GRADE" name="GRADE" value="<%=rs.getString("GRADE")%>"/></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td align="left"><input type="text" id="CITY" name="CITY" value="<%=rs.getString("CITY")%>"/></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="수정"/>
						<input type="button" value="조회" onclick="location.href='MemberList.jsp';" />
					</td>
				</tr>
				<%	
					}
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
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>