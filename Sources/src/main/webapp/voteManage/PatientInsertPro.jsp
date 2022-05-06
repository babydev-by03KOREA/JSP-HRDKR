<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="dbms.DBConnect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환자데이터 넘어가용~</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String P_NO = request.getParameter("P_NO");
		String P_NAME = request.getParameter("P_NAME");
		String P_BIRTH = request.getParameter("P_BIRTH");
		String P_GENDER = request.getParameter("P_GENDER");
		String P_TEL1 = request.getParameter("P_TEL1");
		String P_TEL2 = request.getParameter("P_TEL2");
		String P_TEL3 = request.getParameter("P_TEL3");
		String P_CITY = request.getParameter("P_CITY");
	%>
	<%
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try{
			con = DBConnect.getConnection();
			sql = "INSERT INTO TBL_PATIENT_202004 VALUES(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, P_NO);
			pstmt.setString(2, P_NAME);
			pstmt.setString(3, P_BIRTH);
			pstmt.setString(4, P_GENDER);
			pstmt.setString(5, P_TEL1);
			pstmt.setString(6, P_TEL2);
			pstmt.setString(7, P_TEL3);
			pstmt.setString(8, P_CITY);
			
			pstmt.executeUpdate();

			}catch(Exception e){
			System.out.println("You're PatientInsert commands was denied for "+e);
		}finally{
			try{
				if(con != null){con.close();}
				if(pstmt != null){pstmt.close();}
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		
		response.sendRedirect("PatientList.jsp");
	%>
</body>
</html>