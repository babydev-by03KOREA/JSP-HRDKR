<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="dbms.DBConnect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정값 넘어가유~</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		int CUSTNO = Integer.parseInt(request.getParameter("CUSTNO").trim());
		String CUSTNAME = request.getParameter("CUSTNAME").trim();
		String PHONE = request.getParameter("PHONE").trim();
		String ADDRESS = request.getParameter("ADDRESS").trim();
		String JOINDATE = request.getParameter("JOINDATE").trim();
		String GRADE = request.getParameter("GRADE").trim();
		String CITY = request.getParameter("CITY").trim();
	%>
	<%
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try{
			con = DBConnect.getConnection();
			sql = "UPDATE MEMBER_TBL_02";
			sql += " SET CUSTNAME=?, PHONE=?, ADDRESS=?, JOINDATE=?, GRADE=?, CITY=?";
			sql += " WHERE CUSTNO=?";
			pstmt = con.prepareStatement(sql);
			// 500번 에러가 뜨면 90% 1번에 CUSTNO을 넣으신걸꺼에요. 내가그랬거덩
			// pstmt는 동적쿼리형태로 만들어주기때문에 ?갯수 == 위치; 확인하시고 적어주세요.
			pstmt.setString(1, CUSTNAME);
			pstmt.setString(2, PHONE);
			pstmt.setString(3, ADDRESS);
			pstmt.setString(4, JOINDATE);
			pstmt.setString(5, GRADE);
			pstmt.setString(6, CITY);
			pstmt.setInt(7, CUSTNO);
			pstmt.executeUpdate();
		}catch(Exception e){
			System.out.println("You're MemberModify Commands was demied for "+e);
		}finally{	//자원반납
			try{
				if(con != null){con.close();}
				if(pstmt != null){pstmt.close();}
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		
		
		response.sendRedirect("MemberList.jsp");
	%>
</body>
</html>