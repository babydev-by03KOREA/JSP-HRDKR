<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dbms.DBConnect" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매현황</title>
<style>
	section {
		position: fixed;
		top: 65px;
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
		<%
			request.setCharacterEncoding("UTF-8");
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			ResultSet rs = null;
			try {
				con = DBConnect.getConncetion();
				sql = "SELECT TBL_SALELIST_01.SALENO, TBL_SALELIST_01.PCODE, TBL_SALELIST_01.SALEDATE, TBL_SALELIST_01.SCODE, TBL_SALELIST_01.AMOUNT,";
				sql += " TBL_PRODUCT_01.NAME AS PRODUCT, TO_CHAR(TBL_PRODUCT_01.COST * TBL_SALELIST_01.AMOUNT, 'fm999,999,999,999') AS COLSPAN";
				/* sql += " ,SUBSTR(TBL_PRODUCT_01.COST * TBL_SALELIST_01.AMOUNT,1,3) AS NOGADA1, SUBSTR(TBL_PRODUCT_01.COST * TBL_SALELIST_01.AMOUNT,4,3) AS NOGADA2"; */
				sql += " FROM TBL_SALELIST_01, TBL_PRODUCT_01";
				sql += " WHERE TBL_PRODUCT_01.PCODE = TBL_SALELIST_01.PCODE";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
		%>
		<h2><b>판매현황</b></h2><br/>
		<form>
			<table border="1">
				<tr>
					<th>비번호</th>
					<th>상품코드</th>
					<th>판매날짜</th>
					<th>매장코드</th>
					<th>상품명</th>
					<th>판매수량</th>
					<th>총판매액</th>
				</tr>
		<%
			while(rs.next()) {
		%>
				<tr>
					<td><%= rs.getInt("SALENO") %></td>
					<td><%= rs.getString("PCODE") %></td>
					<td><%= rs.getDate("SALEDATE") %></td>
					<td><%= rs.getString("SCODE") %></td>
					<td>
						<%-- 미해결 <%
							String PD = rs.getString("PRODUCT");
							String S = "마끼아또";
							String SP = "캬라멜마끼아또";
							if (PD == S){
								out.print(SP);
							} else {
								out.print(PD);
							}
						%> --%>
						<%= rs.getString("PRODUCT") %>
					</td>
					<td><%= rs.getInt("AMOUNT") %></td>
					<td>
						<%-- 노가다식 방법 <%
							String NOGADA1 = rs.getString("NOGADA1");
							String NOGADA2 = rs.getString("NOGADA2");
							String NOGADA = NOGADA1 + "," + NOGADA2;
							out.print(NOGADA);
						%> --%>
						<%= rs.getString("COLSPAN") %> 
						<%-- 
							혹시 getString으로 변환하면 될까? OK-가능함
							TO_CHAR의 경우, CHARACTER형으로 받아야만한다. 
						--%>
					</td> 
				</tr>
		<%
				}
			}catch(Exception e){
				System.out.println("You're SaleList Commands was denied for "+e);
			}finally {
				try {
					if(con != null) {con.close();}
					if(pstmt != null) {pstmt.close();}
					if(rs != null) {rs.close();}
				} catch (SQLException e){
					System.out.println("SQLException "+e);
				}
			}
		%>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>