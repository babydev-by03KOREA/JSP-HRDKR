<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="dbms.DBConnect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환자검사결과 넘어가유~</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String P_NO = request.getParameter("P_NO");
		String T_CODE = request.getParameter("T_CODE");
		String T_SDATE = request.getParameter("T_SDATE");
		String T_STATUS = request.getParameter("T_STATUS");
		String T_LDATE = request.getParameter("T_LDATE");
		String T_RESULT = request.getParameter("T_RESULT");
	%>
	<%
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		String url = "jdbc:oracle:thin:@//180.68.32.70:1521/xe";
		String pid = "system";
		String pwd = "1234";
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(url,pid,pwd);
			sql = "INSERT INTO TBL_RESULT_202004 VALUES(?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			// sql문 실행을 위해 꼭 sql문 아래에 넣어주세요.
			pstmt.setString(1, P_NO);
			pstmt.setString(2, T_CODE);
			pstmt.setString(3, T_SDATE);
			pstmt.setString(4, T_STATUS);
			pstmt.setString(5, T_LDATE);
			pstmt.setString(6, T_RESULT);
			pstmt.executeUpdate();
			
		}catch(Exception e){
			System.out.println("You're ResultInsert Commands was denied for "+e);
		}finally{ // 자원반납
			try{
				if(con != null){con.close();}
				if(pstmt != null){pstmt.close();}
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		
		
		response.sendRedirect("index.jsp");
		// 문제별 요구 URL로 전송하세요 - (문제)메인화면으로 이동하시오
	%>
</body>
</html>