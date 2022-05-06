<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%-- Connection 객체 사용없이 연동하는 연습을 하겠습니다. --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검사결과조회</title>
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
	
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
	<h2><b>검사결과조회</b></h2><br/>
		<form>
			<table border="1">
				<tr>
					<th>환자 코드</th>
					<th>환자 이름</th>
					<th>검사 명</th>
					<th>검사 시작일</th>
					<th>검사 상태</th>
					<th>검사 완료일</th>
					<th>검사 결과</th>
				</tr>
		<% 
			request.setCharacterEncoding("UTF-8");
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			String url = "jdbc:oracle:thin:@//180.68.32.70:1521/xe";
			String uid = "system";
			String pwd = "1234";
			try{
				Class.forName("oracle.jdbc.OracleDriver");
				con = DriverManager.getConnection(url,uid,pwd);
				// 저는 sql문 작성 시 길어져도 테이블에 Alias를 주지 않습니다.
				// 참고하시길 바라며, 본인에게 더 편한방법으로 코딩하세요!
				// APPEND() 객체가 아닌 += 사용 시, 띄어쓰기랑 콤마(,) 꼭 확인하세요!!!!!
				// TABLE_NAME.COLUMN_NAME
				sql = "SELECT TBL_RESULT_202004.P_NO, TBL_PATIENT_202004.P_NAME, TBL_RESULT_202004.T_CODE,";
				sql += "TBL_RESULT_202004.T_SDATE, TBL_RESULT_202004.T_STATUS, TBL_RESULT_202004.T_LDATE, TBL_RESULT_202004.T_RESULT";
				sql += " FROM TBL_RESULT_202004";
				sql += " INNER JOIN TBL_PATIENT_202004";
				sql += " ON TBL_RESULT_202004.P_NO = TBL_PATIENT_202004.P_NO";
				sql += " ORDER BY TBL_RESULT_202004.P_NO";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
		%>
				<tr>
					<td><%= rs.getString("P_NO") %></td>
					<td><%= rs.getString("P_NAME") %></td>
					<td>
					<%
						String disease = rs.getString("T_CODE");
						String T1 = "T001";
						String T2 = "T002";
						String T3 = "T003";
						String T4 = "T004";
						String T5 = "T005";
						String T001 = "결핵";
						String T002 = "장티푸스";
						String T003 = "수두";
						String T004 = "홍역";
						String T005 = "콜레라";
						if(disease.equals(T1)){
							out.println(T001);
						}else if(disease.equals(T2)){
							out.println(T002);
						}else if(disease.equals(T3)){
							out.println(T003);
						}else if(disease.equals(T4)){
							out.println(T004);
						}else if(disease.equals(T5)){
							out.println(T005);
						}
					%>
					</td>
					<td><%= rs.getDate("T_SDATE") %></td>
					<td>
					<%
						String stmt = rs.getString("T_STATUS");
						String ING = "1";
						String FIN = "2";
						String KING = "검사 중";
						String KFIN = "검사 완료";
						
						if(stmt.equals(ING)){
							out.println(KING);
						}else if(stmt.equals(ING)){
							out.println(KFIN);
						}
					%>
					</td>
					<td><%= rs.getDate("T_LDATE") %></td>
					<td>
					<% 
						String rsx = rs.getString("T_RESULT");
						String NO = "X";
						String Positive = "P";
						String Negative = "N";
						String KNO = "미입력";
						String KPositive = "양성";
						String KNegative = "음성";
						if(rsx.equals(NO)){
							out.println(KNO);
						}else if(rsx.equals(Positive)){
							out.println(KPositive);
						}else if(rsx.equals(Negative)){
							out.println(KNegative);
						}
					%>
					</td>
				</tr>
		<%
				}
			}catch(Exception e){
				System.out.println("You're ResultList commands was denied for "+e);
			}finally{
				try{	// 자원반납
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