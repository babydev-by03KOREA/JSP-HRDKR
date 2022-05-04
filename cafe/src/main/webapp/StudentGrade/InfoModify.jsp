<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="dbms.DBConnect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생정보 수정</title>
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
	<%
		request.setCharacterEncoding("UTF-8");
		String ID = request.getParameter("ID");
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		try {
			con = DBConnect.getConnection();
			sql = "SELECT * FROM MEMBER_TBL WHERE ID=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ID);
			rs = pstmt.executeQuery();
			while(rs.next()){
	%>
		<form action="InfoModifyPro.jsp" method="post">
			<table border="1">
				<tr>
					<td>학번</td>
					<td align="left"><input type="text" id="id" name="id" value="<%= rs.getString("ID")%>">예) 30107</td>
				</tr>
				<tr>
					<td>이름</td>
					<td align="left"><input type="text" id="name" name="name" value="<%= rs.getString("NAME")%>">예) 박형주</td>
				</tr>
				<tr>
					<td>성별</td>
					<td align="left">
						<select name="gender">
							<option value="<%=rs.getString("gender")%>">현재값:<%=rs.getString("gender")%></option>
							<option id="gender1" value="남">남자</option>
							<option id="gender1" value="여">여자</option>
						</select>
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
		<form action="InfoDeletePro.jsp" method="post"><input type="hidden" name="id" value="<%=rs.getString("ID")%>"><input type="submit" value="학생삭제"></form>
		<%
			}
				} catch(Exception e) {
					e.printStackTrace();
				} finally {
					if (con != null) {con.close();}
					if (pstmt != null) {pstmt.close();}
					if (rs != null) {rs.close();}
				}
		%>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>