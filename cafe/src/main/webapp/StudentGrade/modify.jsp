<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="dbms.DBConnect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 성적등록</title>
<style>
	section{
		position: fixed;
		top: 75px;
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
<script src="validation.js"></script>
</head>
<body>	
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h2><b>학생 종합정보 수정</b></h2><br/>
		<form action="modifyPro.jsp" method="post" onsubmit="return validate2();"> 
		<%-- onsubmit, onclick 사용 시, return 'functioin Name'+'()'+';' 기억할것!! --%>
		<table border="1">
		<%
			request.setCharacterEncoding("UTF-8");
			String id = request.getParameter("ID");
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			ResultSet rs = null;
		%>
		<%
			try {
				con = DBConnect.getConnection();
				sql = "SELECT *";
				sql += " FROM SCORE_TBL WHERE id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				while(rs.next()){
		%>
			<tr>
				<td width="80px">학번</td>
				<td align="left"><input type="text" name="id" id="id" value="<%=rs.getString(1)%>"> 예) 30107&nbsp;</td>
			</tr>
			<tr>
				<td width="80px">국어</td>
				<td align="left"><input type="text" name="korean" id="korean" value="<%=rs.getInt(2)%>"> 숫자만 입력&nbsp;</td>
			</tr>
			<tr>
				<td width="80px">수학</td>
				<td align="left"><input type="text" name="math" id="math" value="<%=rs.getInt(3)%>"> 숫자만 입력&nbsp;</td>
			</tr>
			<tr>
				<td width="80px">영어</td>
				<td align="left"><input type="text" name="english" id="english" value="<%=rs.getInt(4)%>"> 숫자만 입력&nbsp;</td>
			</tr>
			<tr>
				<td width="80px">역사</td>
				<td align="left"><input type="text" name="history" id="history" value="<%=rs.getInt(5)%>"> 숫자만 입력&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="등록">
					<input type="reset" value="다시쓰기"/>
				</td>
			</tr>
		</table>
		</form>
		<form action="modifyDelete.jsp" method="post"><input type="hidden" name="id" value="<%=rs.getString("ID")%>"><input type="submit" value="학생 성적삭제"></form>
		<%
				}
				} catch(Exception e) {
					e.printStackTrace();
				} finally{
					if(con != null){con.close();}
					if(pstmt != null){pstmt.close();}
					if(rs != null){rs.close();}
				}
		%>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>