<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="dbms.DBConnect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생성적 조회</title>
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
	
	p {
		font-size: 15px;
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
		<h2><b>학생 성적 등록</b></h2><br/>	
		<p>학번을 클릭하시면 학생 성적수정 페이지로 이동합니다!</p>
		<form>
		<table border="1">
		<%!
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			ResultSet rs2 = null;
			String sql1 = null;
			String sql2 = null;
		%>
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>학년</th>
				<th>반</th>
				<th>번호</th>
				<th>성별</th>
				<th>국어</th>
				<th>수학</th>
				<th>영어</th>
				<th>역사</th>
				<th>합계</th>
				<th>평균</th>
				<th>순위</th>
			</tr>
		<%
			try{
				con = DBConnect.getConnection();
				// sql문 작성 시 ',(쉼표)' + '띄어쓰기' 꼭 확인해주세요!!
				sql1 = "SELECT MEMBER_TBL.ID, MEMBER_TBL.NAME, MEMBER_TBL.GENDER,";
				sql1 += " SUBSTR(MEMBER_TBL.ID,0,1) AS GRADE, SUBSTR(MEMBER_TBL.ID,2,2) AS CLASS, SUBSTR(MEMBER_TBL.ID,4) AS NO,";
				sql1 += " SCORE_TBL.KOREAN, SCORE_TBL.MATH, SCORE_TBL.ENGLISH, SCORE_TBL.HISTORY,";
				sql1 += " (SCORE_TBL.KOREAN + SCORE_TBL.MATH + SCORE_TBL.ENGLISH + SCORE_TBL.HISTORY) AS HAP,";
				sql1 += " (SCORE_TBL.KOREAN + SCORE_TBL.MATH + SCORE_TBL.ENGLISH + SCORE_TBL.HISTORY)/4 AS PYG,";
				sql1 += " RANK() OVER(ORDER BY SCORE_TBL.KOREAN + SCORE_TBL.MATH + SCORE_TBL.ENGLISH + SCORE_TBL.HISTORY DESC) AS RANK";
				sql1 += " FROM MEMBER_TBL";
				sql1 += " INNER JOIN SCORE_TBL on MEMBER_TBL.id = SCORE_TBL.id";
				pstmt = con.prepareStatement(sql1);
				rs = pstmt.executeQuery();
				while(rs.next()){
		%>
			<tr>
				<td><a href="${pageContext.request.contextPath}/StudentGrade/modify.jsp?ID=<%=rs.getString("ID") %>"><%= rs.getString("ID") %></a></td>
				<td><%= rs.getString("NAME") %></td>
				<td><%= rs.getString("GRADE")%></td>
				<td><%= rs.getString("CLASS")%></td>
				<td><%= rs.getString("NO")%></td>
				<td><%= rs.getString("GENDER")%></td>
				<td><%= rs.getString("KOREAN")%></td>
				<td><%= rs.getString("MATH")%></td>
				<td><%= rs.getString("ENGLISH")%></td>
				<td><%= rs.getString("HISTORY")%></td>
				<td><%= rs.getString("HAP")%></td>
				<td><%= rs.getString("PYG")%></td>
				<td><%= rs.getString("RANK")%></td>
			</tr>
		<%
				} con.close();
			}catch (Exception e){
				e.printStackTrace();
			}finally {
				if(con != null){con.close();}
				if(pstmt != null){pstmt.close();}
				if(rs != null){rs.close();}
			}
		%>
			<tr>
				<th colspan="6"></th>
				<th>국어 총합</th>
				<th>수학 총합</th>
				<th>영어 총합</th>
				<th>역사 총합</th>
				<th>총합</th>
				<th>총 평균</th>
				<th>***********</th>
			</tr>
		<%
			try {
				con = DBConnect.getConnection();
				sql2 = "SELECT SUM(SCORE_TBL.KOREAN) AS KR, SUM(SCORE_TBL.MATH) AS MA,";
				sql2 += " SUM(SCORE_TBL.ENGLISH) AS EN, SUM(SCORE_TBL.HISTORY) AS HIS";
				sql2 += " FROM MEMBER_TBL";
				sql2 += " INNER JOIN SCORE_TBL on MEMBER_TBL.ID = SCORE_TBL.ID";
				pstmt = con.prepareStatement(sql2);
				rs2 = pstmt.executeQuery();
				while(rs2.next()){
		%>
			<tr>
				<td colspan="6"></td>
				<td><%=rs2.getString("KR") %></td>
				<td><%=rs2.getString("MA") %></td>
				<td><%=rs2.getString("EN") %></td>
				<td><%=rs2.getString("HIS") %></td>
			</tr>

		<%
				}
			}catch (Exception e){
				e.printStackTrace();
			}finally {
				if(con != null){con.close();}
				if(pstmt != null){pstmt.close();}
				if(rs2 != null){rs2.close();}
			}
		%>

		</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>