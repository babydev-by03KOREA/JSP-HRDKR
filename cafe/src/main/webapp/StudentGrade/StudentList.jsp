<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="dbms.DBConnect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생조회</title>
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
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h2><b>학생 성적 등록</b></h2><br/>	
		<form>
		<%!
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
		%>
		<table border="1">
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>학년</th>
				<th>반</th>
				<th>번호</th>
				<th>성별</th>
			</tr>
		<%
			try {
				con = DBConnect.getConnection();
				sql = "SELECT ID, NAME, GENDER, SUBSTR(ID,0,1) AS GRADE, SUBSTR(ID,2,2) AS CLASS, SUBSTR(ID,4) AS NO";
				sql += " FROM MEMBER_TBL ORDER BY(ID) ASC";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
		%>
			<tr>
				<td><a href="${pageContext.request.contextPath}/StudentGrade/InfoModify.jsp?ID=<%=rs.getString("ID")%>"><%= rs.getString("ID")%></a></td>
				<td><%= rs.getString("NAME")%></td>
				<td><%= rs.getString("GRADE")%></td>
				<td><%= rs.getString("CLASS")%></td>
				<td><%= rs.getString("NO")%></td>
				<td><%= rs.getString("GENDER")%></td>
			</tr>
		<%
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		%>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>