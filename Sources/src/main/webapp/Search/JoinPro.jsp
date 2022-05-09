<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="dbms.DBConnect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 값 넘어가유~</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String USERID = request.getParameter("USERID").trim();
		String USERNM = request.getParameter("USERNM").trim();
		String PASSWD = request.getParameter("PASSWD").trim();
		String JUMIN1 = request.getParameter("JUMIN1").trim();
		String JUMIN2 = request.getParameter("JUMIN2").trim();
		String JUMIN = JUMIN1 + JUMIN2;
		// 프로그래머 확인용
		/* System.out.println(JUMIN); */
		String GENDER = request.getParameter("GENDER").trim();
		String ADDRESS = request.getParameter("ADDRESS").trim();
		int JOBCD = Integer.parseInt(request.getParameter("JOBCD").trim());
		String MAILRCV = request.getParameter("MAILRCV").trim();
		String INTRO = request.getParameter("INTRO").trim();
	%>
	<%
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try{
			con = DBConnect.getConnection();
			sql = "INSERT INTO TBL_GUEST VALUES (?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, USERID);
			pstmt.setString(2, USERNM);
			pstmt.setString(3, PASSWD);
			pstmt.setString(4, JUMIN);
			pstmt.setString(5, GENDER);
			pstmt.setString(6, ADDRESS);
			pstmt.setInt(7, JOBCD);
			pstmt.setString(8, MAILRCV);
			pstmt.setString(9,INTRO);
			pstmt.executeUpdate();
		}catch(Exception e){
			System.out.println("You're JoinPro Commands was denied for "+e);
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