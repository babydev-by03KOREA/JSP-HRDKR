<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="dbms.DBConnect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환자정보조회</title>
<style>
	section {
		position: fixed;
		top:65px;
		width: 100%;
		height: 100%;
		background-color: lightgray;
	}
	h2 {
		text-align:center;
	}
	form {
		display: flex;
		align-items: center;
		justify-content: center;
		text-align: center;
	}
	th, td {
		text-align: center;
	}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
	<h2><b>환자조회</b></h2><br/>
	<form>
		<table border="1">
			<tr>
				<th>환자 코드</th>
				<th>환자 이름</th>
				<th>환자 생년월일</th>
				<th>환자 성별</th>
				<th>환자 전화번호</th>
				<th>환자 거주지</th>
			</tr>
		<%
			request.setCharacterEncoding("UTF-8");
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			ResultSet rs = null;
			try{
				con = DBConnect.getConnection();
				sql = "SELECT * FROM TBL_PATIENT_202004";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
		%>
			<tr>
				<td><%= rs.getString("P_NO") %></td>
				<td><%= rs.getString("P_NAME") %></td>
				<td><%= rs.getString("P_BIRTH") %></td>
				<td>
					<%
						String Male = rs.getString("P_GENDER");
						String FMale = rs.getString("P_GENDER");
						String EMale = "M";
						String EFMale = "F";
						String KMale = "남";
						String KFMale = "여";
						if(Male.equals(EMale)){
							out.println(KMale);
						}else if(FMale.equals(EFMale)){
							out.println(KFMale);
						}
					%>
				</td>
				<td>
					<%
						String TEL1 = rs.getString("P_TEL1");
						String TEL2 = rs.getString("P_TEL2");
						String TEL3 = rs.getString("P_TEL3");
						String TELALL = TEL1 + "-" + TEL2 + "-" + TEL3;
						out.println(TELALL);
					%>
				</td>
				<td>
					<%
						String AREACODE = rs.getString("P_CITY");
						String SELCode = "서울";
						String KYGCode = "경기";
						String KWGCode = "강원";
						String TEGCode = "대구";
						String SNCode = "10";
						String KYNCode = "20";
						String KWNCode = "30";
						String TENCode = "40";
						if(AREACODE.equals(SNCode)){
							out.println(SELCode);
						}else if(AREACODE.equals(KYNCode)){
							out.println(KYNCode);
						}else if(AREACODE.equals(KWGCode)){
							out.println(KWGCode);
						}else if(AREACODE.equals(TEGCode)){
							out.println(TEGCode);
						}
					%>
				</td>
			</tr>
		<%
				}
			} catch(Exception e){
				System.out.println("You're PatientList Commands was denied for "+e);
			} finally{
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