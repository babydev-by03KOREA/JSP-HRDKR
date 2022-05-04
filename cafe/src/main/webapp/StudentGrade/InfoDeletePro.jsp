<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="dbms.DBConnect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생삭제(값 넘어가유~)</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
	%>
	<%
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = DBConnect.getConnection();
			sql = "DELETE MEMBER_TBL";
			sql += " WHERE ID=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate(); // sql들어가면 안됨!!!
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(con != null){con.close();}
			if(pstmt != null){con.close();}
		}
		
		response.sendRedirect("GradeList.jsp");
	%>
</body>
</html>