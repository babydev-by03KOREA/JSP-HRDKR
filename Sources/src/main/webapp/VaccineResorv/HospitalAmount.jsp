<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="dbms.DBConnect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원별 접종건수 통계</title>
<style>
	section {
		position: fixed;
		top: 70px;
		width: 100%;
		height: 100%;
		background-color: lightgray;
	}
	h2 {
		text-align: center;
	}
	form {
		display: flex;
		align-items: center;
		justify-content: center;
		text-align: center;
	}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h2><b>병원별 접종건수 통계</b></h2><br/>
		<form>
			<table border="1">
				<tr>
					<th>병원주소</th>
					<th>병원코드</th>
					<th>접종건수</th>
				</tr>
		<%
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			String sql2 = null;
			ResultSet rs2 = null;
			try{
				con = DBConnect.getConnection();
				// 딱 보니깐 광주(H004)만 값이 없네요. 그럼 접종건수를 COUNT하고, 그룹으로 묶으면 되겠습니다~
				// 단순하게 생각했지만 역시 우리에 평가원은 그러지못하죠.. SUM(COUNT(COLUMN))은 불가합니다ㅠㅠ
				sql = "SELECT TBL_HOSP_202108.HOSPCODE, TBL_HOSP_202108.HOSPNAME, COUNT(TBL_VACCRESV_202108.RESVNO) AS CNT,";
				sql += "SUM(COUNT(TBL_VACCRESV_202108.RESVNO)) OVER() AS HAP";
				sql += " FROM TBL_HOSP_202108";
				sql += " INNER JOIN TBL_VACCRESV_202108";
				sql += " ON TBL_HOSP_202108.HOSPCODE = TBL_VACCRESV_202108.HOSPCODE";
				sql += " GROUP BY TBL_HOSP_202108.HOSPCODE, TBL_HOSP_202108.HOSPNAME";
				sql += " ORDER BY TBL_HOSP_202108.HOSPCODE";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
					// 개발자 콘솔 확인용
					/* System.out.println(rs.getInt("HAP")); */
		%>
		
				<tr>
					<td><%=rs.getString("HOSPCODE") %></td>
					<td><%=rs.getString("HOSPNAME") %></td>
					<td><%=rs.getString("CNT") %></td>
				</tr>
		<%
				}
		%>
		<%	
			rs2 = pstmt.executeQuery();
			rs2.next();
		%>
				<tr>
					<td></td>
					<td>총 누계</td>
					<td><%=rs2.getInt("HAP") %></td>
				</tr>
		<%
			}catch(Exception e1){
				System.out.println("You're HospitalAmount Commands was denied for "+e1);
			}finally{
				try{
					if(con != null){con.close();}
					if(pstmt != null){pstmt.close();}
					if(rs != null){rs.close();}
					if(rs2 != null){rs2.close();}
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