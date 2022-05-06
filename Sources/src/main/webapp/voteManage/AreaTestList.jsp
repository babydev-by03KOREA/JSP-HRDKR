<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역별검사건수</title>
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
		display:flex;
		align-items: center;
		justify-content: center;
		text-align: center;
	}
	th,td {
		text-align: center;
	}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
	<h2><b>지역별 검사건수</b></h2><br/>
		<form>
			<table border="1">
				<tr>
					<th>지역 코드</th>
					<th>지역명</th>
					<th>검사건수</th>
				</tr>
		<%
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			ResultSet rs = null;
			// Class.forName이나 url은 외우는게 아닙니다.. 시험지에 다 나와요.. 가끔가다 이상한거 외우는애들 꼭 있음..
			// 다만 java.sql에 해당하는 객체들의 사용법은 숙지해두세요.
			String url = "jdbc:oracle:thin://@localhost:1521/xe";
			String pid = "system";
			String pwd = "1234";
			try{
				Class.forName("oracle.jdbc.OracleDriver");
				con = DriverManager.getConnection(url,pid,pwd);
				// append 객체를 사용하지 않음으로, 따움표(,) 및 공백(SELECT 띄우고 FROM) 꼭 확인바랍니다!
				// 해당 문제에서 원하는것 - 같은 컬럼명(지역명+if문, 지역코드+ORDER BY), COUNT(검사건수)+GROUP BY
				// 어떻게 알았냐고 묻지마요.. 빡코딩 하면 자동으로 머리에 생겨요.. 화이팅..
				sql = "SELECT TBL_PATIENT_202004.P_CITY, COUNT(TBL_RESULT_202004.P_NO) AS AMOUNT";
				sql += " FROM TBL_PATIENT_202004";
				sql += " INNER JOIN TBL_RESULT_202004";
				sql += " ON TBL_PATIENT_202004.P_NO = TBL_RESULT_202004.P_NO";
				sql += " GROUP BY TBL_PATIENT_202004.P_CITY";
				sql += " ORDER BY TBL_PATIENT_202004.P_CITY";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
		%>
				<tr>
					<td><%=rs.getString("P_CITY") %></td>
					<td>
					<%
						String CITYNAME = rs.getString("P_CITY");
						String SEOUL = "10";
						String KYG = "20";
						String KWN = "30";
						String TEG = "40";
						String KSEL = "서울";
						String KKYG = "경기";
						String KKWN = "강원";
						String KTEG = "대구";
						if(CITYNAME.equals(SEOUL)){
							out.println(KSEL);
						}else if(CITYNAME.equals(KYG)){
							out.println(KKYG);
						}else if(CITYNAME.equals(KWN)){
							out.println(KKWN);
						}else if(CITYNAME.equals(TEG)){
							out.println(KTEG);
						}
					%>
					</td>
					<td><%= rs.getString("AMOUNT") %></td>
				</tr>
		<%
				}
			}catch(Exception e){
				System.out.println("You're AreaTestList commands was denied for "+e);
			}finally{ // 자원반납
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