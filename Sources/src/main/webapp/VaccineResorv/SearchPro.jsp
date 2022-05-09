<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="dbms.DBConnect" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색결과</title>
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
	#back {
		text-align:center;
		margin-top: 30px;
	}
</style>
<script src="validation.js"></script>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String RESVNO = request.getParameter("RESVNO");
		List<String> list = new ArrayList<>(Arrays.asList("20210001","20210002","20210003","20210004", "20210005","20210006","20210007","20210008","20210009","20210010"));
		boolean isin = list.contains(RESVNO);
		if(isin == false){
			response.sendRedirect("Errpg.jsp");
		}
	%>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
	<h2><b>예약번호 : <%= RESVNO%>의 접종예약조회</b></h2><br/>
	<form>
		<table border="1">
		<tr>
			<th>이름</th>
			<th>주민번호</th>
			<th>성별</th>
			<th>전화번호</th>
			<th>예약일자</th>
			<th>예약시간</th>
			<th>병원명</th>
			<th>대표번호</th>
			<th>병원주소</th>
			<th>백신종류</th>
		</tr>
	<%
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		try{
			con = DBConnect.getConnection();
			sql = "SELECT TBL_JUMIN_202108.JUMIN, SUBSTR(TBL_JUMIN_202108.JUMIN,8,1) AS GENDERNUM, TBL_JUMIN_202108.PNAME, TBL_JUMIN_202108.TEL, TBL_JUMIN_202108.ADDRESS,";
			sql += "TBL_VACCRESV_202108.VCODE, SUBSTR(TBL_VACCRESV_202108.RESVDATE,1,4) AS YEAR, SUBSTR(TBL_VACCRESV_202108.RESVDATE,5,2) AS MONTH, SUBSTR(TBL_VACCRESV_202108.RESVDATE,7,2) AS DAY,";
			sql += "SUBSTR(TBL_VACCRESV_202108.RESVTIME,1,2) AS CLO, SUBSTR(TBL_VACCRESV_202108.RESVTIME,3,2) AS MIN,";
			sql += "TBL_HOSP_202108.HOSPNAME, TBL_HOSP_202108.HOSPTEL, TBL_HOSP_202108.HOSPADDR";
			sql += " FROM TBL_JUMIN_202108 INNER JOIN TBL_VACCRESV_202108 ON TBL_JUMIN_202108.JUMIN = TBL_VACCRESV_202108.JUMIN";
			sql += " INNER JOIN TBL_HOSP_202108 ON TBL_HOSP_202108.HOSPCODE = TBL_VACCRESV_202108.HOSPCODE";
			sql += " AND TBL_VACCRESV_202108.RESVNO = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, RESVNO);
			rs = pstmt.executeQuery();
			while(rs.next()){
				
	%>
			<tr>
				<td><%=rs.getString("PNAME") %></td>
				<td><%=rs.getString("JUMIN") %></td>
				<td>
					<%
						String GENNUM = rs.getString("GENDERNUM");
						String MANNUM = "1";
						String FMNUM = "2";
						String KMAN = "남";
						String KFMAL = "여";
						if(MANNUM.equals(GENNUM)){
							out.println(KMAN);
						}else if(FMNUM.equals(GENNUM)){
							out.println(KFMAL);
						}
					%>
				</td>
				<td><%=rs.getString("TEL") %></td>
				<td>
					<%
						String Y = rs.getString("YEAR");
						String M = rs.getString("MONTH");
						String D = rs.getString("DAY");
						String RESDAY = Y + "년" + M + "월" + D + "일";
						out.println(RESDAY);
					%>
				</td>
				<td>
					<%
						String Clock = rs.getString("CLO");
						String Min = rs.getString("MIN");
						String OClock = Clock + ":" + Min;
						out.println(OClock);
					%>
				</td>
				<td>
					<%=rs.getString("HOSPNAME") %>
				</td>
				<td>
					<%=rs.getString("HOSPTEL") %>
				</td>
				<td>
					<%=rs.getString("HOSPADDR") %>
				</td>
				<td>
					<%
						String CODE = rs.getString("VCODE");
						String TYPEA = "V001";
						String TYPEB = "V002";
						String TYPEC = "V003";
						String KTYPEA = "A백신";
						String KTYPEB = "B백신";
						String KTYPEC = "C백신";
						if(CODE.equals(TYPEA)){
							out.println(KTYPEA);
						}else if(CODE.equals(TYPEB)){
							out.println(KTYPEB);
						}else if(CODE.equals(TYPEC)){
							out.println(KTYPEC);
						}
					%>
				</td>
			</tr>
	<%
			}
		}catch(Exception e){
			System.out.println("You're Search Commands was denied for "+e);
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
	<div id="back">
		<input type="button" onclick="location.href='index.jsp'" value="돌아가기"/>
	</div>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>