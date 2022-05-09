<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>값이넘어간다~</title>
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
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
	<h2><b>회원검색</b></h2><br/>
	<%
		request.setCharacterEncoding("UTF-8");
		String opt = request.getParameter("opt");
		String query = request.getParameter("query");
	  
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		String url = "jdbc:oracle:thin:@//180.68.32.70:1521/xe";
		String pid = "system";
		String pwd = "1234";
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(url,pid,pwd);
			if(opt != null & query != null){
				sql = "SELECT userid, usernm, jobcd, SUBSTR(JUMIN,1,6) AS BIRTH,";
				sql += "FROM TBL_GUEST WHERE "+opt+" = ?";
			}
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, query);
			rs = pstmt.executeQuery();
			while(rs.next()){
		%>
		<form>
		<table border="1">
			<tr>
				<td><%= rs.getString("userid")%></td>	
				<td><%= rs.getString("usernm")%></td>	
				<td><%= rs.getString("BIRTH") %></td>
				<td><%= rs.getString("jobcd")%></td>	
			</tr>
		</table>
	<%
			}
		}catch(Exception e){
			System.out.println("You're MemberList Commands was denied for "+e);
		}finally{
			try{	// 자원반납
				if(con != null){con.close();}
				if(pstmt != null){pstmt.close();}
				if(rs != null){rs.close();}
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
	%>
		</form>
	</section>
</body>
</html>