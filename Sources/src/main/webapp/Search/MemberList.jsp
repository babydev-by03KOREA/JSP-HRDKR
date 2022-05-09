<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
<style>
	section{
		position: fixed;
		top: 70px;
		width: 100%;
		height: 100%;
		background-color: lightgray;
	}
	h2 {
		text-align:center;
	}
	form{
		display:flex;
		align-items: center;
		justify-content: center;
		text-align: center;
	}
	#thg{
		text-align: center;
		background-color: gray;
	}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h2><b>회원목록</b></h2><br/>
		<form>
			<table border="1">
				<tr>
					<th id="thg">회원ID</th>
					<th id="thg">회원명</th>
					<th id="thg">생년월일</th>
					<th id="thg">성별</th>
					<th id="thg">직업</th>
					<th id="thg">자기소개</th>
				</tr>
		<%
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
				sql = "SELECT USERID, USERNM, SUBSTR(JUMIN,1,6) AS BORN, GENDER, JOBCD, INTRO";
				sql += " FROM TBL_GUEST";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
		%>
				<tr>
					<td><%= rs.getString("USERID") %></td>
					<td><%= rs.getString("USERNM") %></td>
					<td><%= rs.getString("BORN") %></td>
					<td>
						<%
							String GenNum = rs.getString("GENDER");
							String MAN = "1";
							String FMAL = "2";
							String KMAN = "남";
							String KFMAL = "여";
							if(GenNum.equals(MAN)){
								out.println(KMAN);
							}else if(GenNum.equals(FMAL)){
								out.println(KFMAL);
							}
						%>							
					</td>
					<td>
						<%
							int JOBC = rs.getInt("JOBCD");
							String JOBK1 = "학생";
							String JOBK2 = "회사원";
							String JOBK3 = "공무원";
							String JOBK4 = "군인";
							String JOBK5 = "기타";
							if(JOBC == 1){
								out.println(JOBK1);
							}else if(JOBC == 2){
								out.println(JOBK2);
							}else if(JOBC == 3){
								out.println(JOBK3);
							}else if(JOBC == 4){
								out.println(JOBK4);
							}else if(JOBC == 5){
								out.println(JOBK5);
							}
						%>
					</td>
					<td><%=rs.getString("INTRO") %></td>
				</tr>
		<%
				}
			}catch(Exception e){
				System.out.println("You're MemberList Commands was denied for "+e);
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
</body>
</html>