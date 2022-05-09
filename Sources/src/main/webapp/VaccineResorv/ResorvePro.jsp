<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>값 넘어가유~</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String RESVNO = request.getParameter("RESVNO");
		String JUMIN = request.getParameter("JUMIN");
		String VCODE = request.getParameter("VCODE");
		String HOSPCODE = request.getParameter("HOSPCODE");
		String RESVDATE = request.getParameter("RESVDATE");
		String RESVTIME = request.getParameter("RESVTIME");
	%>
	<%
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		String url = "jdbc:oracle:thin:@//180.68.32.70:1521/xe";
		String uid = "system";
		String pwd = "1234";
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(url,uid,pwd);
			sql = "INSERT INTO TBL_VACCRESV_202108 VALUES(?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, RESVNO);
			pstmt.setString(2, JUMIN);
			pstmt.setString(3, VCODE);
			pstmt.setString(4, HOSPCODE);
			pstmt.setString(5, RESVDATE);
			pstmt.setString(6, RESVTIME);
			pstmt.executeUpdate();
		}catch(Exception e){
			System.out.println("You're ResorveInsert commands was denied for "+e);
		}finally{
			try{
				if(con != null){con.close();}
				if(pstmt != null){pstmt.close();}
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		
		response.sendRedirect("index.jsp");
	%>
</body>
</html>