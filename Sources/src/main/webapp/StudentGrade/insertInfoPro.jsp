<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="dbms.DBConnect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>값 넘어가유~</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
	%>
	<%
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = DBConnect.getConnection();
			sql = "INSERT INTO MEMBER_TBL VALUES(?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, gender);
			pstmt.executeUpdate();
		} catch(Exception e) {
			e. printStackTrace();
		}
		
		response.sendRedirect("StudentList.jsp");
	%>
</body>
</html>