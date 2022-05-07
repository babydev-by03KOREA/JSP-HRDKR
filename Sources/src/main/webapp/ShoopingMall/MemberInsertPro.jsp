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
		int custno = Integer.parseInt(request.getParameter("custno").trim());
		String custname = request.getParameter("custname").trim();
		String phone = request.getParameter("phone").trim();
		String address = request.getParameter("address").trim();
		String joindate = request.getParameter("joindate").trim();
		String grade = request.getParameter("grade").trim();
		String city = request.getParameter("city").trim();
	%>
	<%
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try{
			con = DBConnect.getConnection();
			sql = "INSERT INTO MEMBER_TBL_02 VALUES(?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, custno);
			pstmt.setString(2, custname);
			pstmt.setString(3, phone);
			pstmt.setString(4, address);
			pstmt.setString(5, joindate);
			pstmt.setString(6, grade);
			pstmt.setString(7, city);
			pstmt.executeUpdate();
		}catch (Exception e){
			System.out.println("You're MemberInsert commands was denied for "+e);
		}finally{ // 자원반납
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