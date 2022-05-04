<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dbms.DBConnect" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장별 판매현황</title>
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
		<h2><b>매장별 판매액</b></h2><br/>
		<form>
			<table border="1">
				<tr>
					<th>매장코드</th>
					<th>매장명</th>
					<th>매장별 판매액</th>
				</tr>
		<%
			request.setCharacterEncoding("UTF-8");
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			ResultSet rs = null;
			String url = "jdbc:oracle:thin:@//180.68.32.70:1521/xe";
			String pid = "system";
			String pwd = "1234";
			try{
				Class.forName("oracle.jdbc.OracleDriver");
				con = DriverManager.getConnection(url,pid,pwd);
				sql = "SELECT TBL_SHOP_01.SCODE, TBL_SHOP_01.SNAME, TO_CHAR(SUM(TBL_PRODUCT_01.COST * TBL_SALELIST_01.AMOUNT),'FM999,999,999,999') AS SUMMERY";
				sql += " FROM TBL_SHOP_01";
				sql += " INNER JOIN TBL_SALELIST_01";
				sql += " ON TBL_SHOP_01.SCODE = TBL_SALELIST_01.SCODE";
				sql += " INNER JOIN TBL_PRODUCT_01";
				sql += " ON TBL_PRODUCT_01.PCODE = TBL_SALELIST_01.PCODE";
				sql += " GROUP BY TBL_SHOP_01.SCODE, TBL_SHOP_01.SNAME";
				sql += " ORDER BY TBL_SHOP_01.SCODE";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
		%>
				<tr>
					<td><%= rs.getString("SCODE") %></td>
					<td><%= rs.getString("SNAME") %></td>
					<td><%= rs.getString("SUMMERY") %></td>
				</tr>
		<%
				}
			}catch(Exception e){
				System.out.println("You're StoreList commands denied for " + e);
			}finally{
				try{
					if(con != null){con.close();}
					if(pstmt != null){pstmt.close();}
					if(rs != null){rs.close();}
				}catch(Exception e){
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