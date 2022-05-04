<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*" import="dbms.DBConnect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생정보 수정해서 넘어가유~</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		int korean = Integer.parseInt(request.getParameter("korean"));
		int math = Integer.parseInt(request.getParameter("math"));
		int english = Integer.parseInt(request.getParameter("english"));
		int history = Integer.parseInt(request.getParameter("history"));
	%>
	<%
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = DBConnect.getConnection();
			sql = "UPDATE SCORE_TBL SET KOREAN=?, MATH=?, ENGLISH=?, HISTORY=?";
			sql += " WHERE ID=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, korean);
			pstmt.setInt(2, math);
			pstmt.setInt(3, english);
			pstmt.setInt(4, history);
			pstmt.setString(5, id);
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