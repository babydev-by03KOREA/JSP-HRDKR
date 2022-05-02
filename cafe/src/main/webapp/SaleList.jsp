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
				sql += " TBL_PRODUCT_01.NAME AS PRODUCT, TBL_PRODUCT_01.COST * TBL_SALELIST_01.AMOUNT AS COLSPAN";
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
					<td><%= rs.getInt("AMOUNT") %></td>
					<td><%= rs.getString("PRODUCT") %></td>
					<td><%= rs.getInt("COLSPAN") %></td> 
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