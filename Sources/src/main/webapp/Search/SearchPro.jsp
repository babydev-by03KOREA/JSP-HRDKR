<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>값이넘어간다~</title>
<style>

</style>
</head>
<body>
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
			if(opt != null & query != null){
				Class.forName("oracle.jdbc.OracleDriver");
				con = DriverManager.getConnection(url,pid,pwd);
				pstmt = con.prepareStatement("SELECT * FROM TBL_GUEST WHERE "+opt+" = ?");
				pstmt.setString(1, query);
			}
			rs = pstmt.executeQuery();
			while(rs.next()){
		%>
				<%= rs.getString("userid")%>	
				<%= rs.getString("usernm")%>	
				<%= rs.getString("jobcd")%>	
	
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
</body>
</html>