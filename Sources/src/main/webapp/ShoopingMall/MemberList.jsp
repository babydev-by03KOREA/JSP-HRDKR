<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="dbms.DBConnect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 조회/수정</title>
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
	<h2><b>회원목록 조회/수정</b></h2><br/>
	<form>
		<table border="1">
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>가입일자</th>
				<th>고객등급</th>
				<th>거주지역</th>
			</tr>
		<%
			request.setCharacterEncoding("UTF-8");
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			ResultSet rs = null;
			try{
				con = DBConnect.getConnection();
				sql = "SELECT CUSTNO, CUSTNAME, PHONE, JOINDATE, ADDRESS,";
				sql += "GRADE, CITY FROM MEMBER_TBL_02";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
		%>
			<tr>
				<td><a href="ModifyList.jsp?CUSTNO=<%=rs.getString("CUSTNO")%>"><%=rs.getString("CUSTNO") %></a></td>
				<td><%=rs.getString("CUSTNAME") %></td>
				<td><%=rs.getString("PHONE") %></td>
				<td><%=rs.getDate("JOINDATE") %></td>
				<td><%=rs.getString("ADDRESS") %></td>
				<td>
				<%
					String VVIP = rs.getString("GRADE");
					String AVIP = "A";
					String BVIP = "B";
					String CVIP = "C";
					String KVIP = "VIP";
					String KBVIP = "일반";
					String KCVIP = "직원";
					if(AVIP.equals(VVIP)){
						out.println(KVIP);
					}else if(BVIP.equals(VVIP)){
						out.println(KBVIP);
					}else if(CVIP.equals(VVIP)){
						out.println(KCVIP);
					}
				%>
				</td>
				<td><%=rs.getString("CITY") %></td>
			</tr>
		<%
				}
			}catch(Exception e){
				System.out.println("You're MemberList Commands was denied for "+e);
			}finally{
				try{
					if(con != null){con.close();}
					if(pstmt != null){pstmt.close();}
					if(rs != null){rs.close();}
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