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
		request.setCharacterEncoding("UTF-8"); // 가장 흔하게 일어날 수 있는 실수로, request/response와 set/get 객체에 유의
		String id = request.getParameter("id");
		/* String korean = request.getParameter("korean");
		String english = request.getParameter("english");
		String math = request.getParameter("math");
		String history = request.getParameter("history"); */
		int korean = Integer.parseInt(request.getParameter("korean"));
		int english = Integer.parseInt(request.getParameter("english"));
		int math = Integer.parseInt(request.getParameter("math"));
		int history = Integer.parseInt(request.getParameter("history"));
	%>
	<%
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = DBConnect.getConnection();
			sql = "INSERT INTO score_tbl VALUES(?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			/* pstmt.setString(2, korean);
			pstmt.setString(3, english);
			pstmt.setString(4, math);
			pstmt.setString(5, history); */
			pstmt.setInt(2, korean);
			pstmt.setInt(3, english);
			pstmt.setInt(4, math);
			pstmt.setInt(5, history);
			pstmt.executeUpdate();
			con.close();
		} catch(Exception e) {
			out.println("You're insert commands was denied for "+e);
		}
		
		response.sendRedirect("GradeList.jsp");
	%>
</body>
</html>