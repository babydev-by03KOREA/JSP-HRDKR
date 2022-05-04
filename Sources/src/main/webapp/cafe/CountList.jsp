<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품별 판매액</title>
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
		<h2><b>상품별 판매액</b></h2><br/>
		<form>
			<table border="1">
				<tr>
					<th>상품코드</th>
					<th>상품명</th>
					<th>상품별 판매액</th>
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
					// sql Table 에 AS 붙이지 말고 '(공백)'주고 Alias 작성해주세요. 칼럼명에는 가능합니다.
					sql = "SELECT tp.pcode, tp.name, to_char(sum(tsa.amount*tp.cost),'fm999,999,999,999') AS ALLCOUNT";
				    sql += " FROM TBL_SHOP_01 tsh INNER JOIN TBL_SALELIST_01 tsa ";
				    sql += " ON tsh.scode = tsa.scode INNER JOIN TBL_PRODUCT_01 tp ";
					sql += " ON tp.pcode = tsa.pcode GROUP BY tp.pcode, tp.name";
					sql += " ORDER BY tp.pcode";
					pstmt = con.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
			%>
				<tr>
					<td><%= rs.getString("PCODE") %></td>
					<td><%=rs.getString("NAME") %></td>
    				<td><%=rs.getString("ALLCOUNT") %></td>
				</tr>
			<%
					}
				}catch(Exception e){
					System.out.println("You're CountList commands was denied for "+e);
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