<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="dbms.DBConnect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원매출조회</title>
<style>
	section{
		position: fixed;
		top: 75px;
		width: 100%;
		height: 100%;
		background-color: lightgray;
	}
	h2{
		text-align:center;
	}
	form{
		display:flex;
		align-items: center;
		justify-content: center;
		text-align: center;
	}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
	<h2><b>회원매출조회</b></h2><br/>
	<form>
		<table border="1">
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>고객등급</th>
				<th>매출</th>
			</tr>
		<%
			request.setCharacterEncoding("UTF-8");
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			ResultSet rs = null;
			try{
				con = DBConnect.getConnection();
				sql = "SELECT MEMBER_TBL_02.CUSTNO, MEMBER_TBL_02.CUSTNAME, MEMBER_TBL_02.GRADE,";
				sql += " SUM(MONEY_TBL_02.PCOST*MONEY_TBL_02.AMOUNT) AS HAP";
				sql += " FROM MEMBER_TBL_02";
				sql += " INNER JOIN MONEY_TBL_02";
				sql += " ON MEMBER_TBL_02.CUSTNO = MONEY_TBL_02.CUSTNO";
			 	sql += " GROUP BY MEMBER_TBL_02.CUSTNO,MEMBER_TBL_02.GRADE, MEMBER_TBL_02.CUSTNAME";
				sql += " ORDER BY SUM(MONEY_TBL_02.PCOST*MONEY_TBL_02.AMOUNT) DESC";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
		%>
			<tr>
				<td><%=rs.getInt("CUSTNO") %></td>
				<td><%=rs.getString("CUSTNAME") %></td>
				<td>
					<%
						String ABC = rs.getString("GRADE");
						String A = "A";
						String B = "B";
						String C = "C";
						String VIP = "VIP";
						String General = "일반";
						String CREW = "직원";
						if(A.equals(ABC)){
							out.println(VIP);
						}else if(B.equals(ABC)){
							out.println(General);
						}else if(C.equals(ABC)){
							out.println(CREW);
						}
					%>
				</td>
				<td><%=rs.getString("HAP") %></td>
			</tr>
		<%
				}
			}catch(Exception e){
				System.out.println("You're AmountList Commands was denied for "+e);
			}finally{
				try{
					if(con != null){con.close();}
					if(pstmt != null){pstmt.close();}
				}catch(SQLException e){
					e.printStackTrace();
				}
			}
		%>
		</table>
	</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>