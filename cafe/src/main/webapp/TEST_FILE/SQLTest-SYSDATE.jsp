<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dbms.DBConnect" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매현황</title>
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
</style>
</head>
<body>
	<jsp:include page="/Cafe/header.jsp"></jsp:include>
	<section>
		<%
			request.setCharacterEncoding("UTF-8");
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			ResultSet rs = null;
			try {
				con = DBConnect.getConnection();
				sql = "SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MM:SS') AS NOWC, TO_CHAR(SYSDATE, 'YYYY-MM-DD') AS NOWD,";
				sql += " TO_CHAR(SYSDATE, 'AM HH12:MI:SS') AS NOWT, TO_DATE(SYSDATE) AS NOW,";
				sql += " TO_CHAR(SYSDATE, 'YYYY MONTH DAY','NLS_DATE_LANGUAGE = JAPANESE') AS JNOW FROM DUAL";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
		%>
		<h2><b>SQL Test</b></h2><br/>
		<form>
			<table border="1">
				<tr>
					<th>TestValue-Y-M-D HH24:MM:SS</th>
					<th>TestValue-Y-M-D</th>
					<th>TestValue-A/PM HH12:MM:SS</th>
					<th>TestValue-SYSDATE</th>
					<th>TestValue-Japan</th>
				</tr>
		<%
			while(rs.next()) {
		%>
				<tr>
					<td><%= rs.getString("NOWC") %></td>
					<td><%= rs.getString("NOWD") %></td>
					<td><%= rs.getString("NOWT") %></td>
					<td><%= rs.getDate("NOW") %></td>
					<td><%= rs.getString("JNOW") %></td>
				</tr>
		<%
				}
			}catch(Exception e){
				System.out.println("You're SQLTest Commands was denied for "+e);
			}finally {
				try {
					if(con != null) {con.close();}
					if(pstmt != null) {pstmt.close();}
					if(rs != null) {rs.close();}
				} catch (SQLException e){
					System.out.println("SQLException "+e);
				}
			}
		%>
			</table>
		</form>
	</section>
	<jsp:include page="/Cafe/footer.jsp"></jsp:include>
</body>
</html>