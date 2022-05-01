<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dbms.DBConnect" import="coffee.coffeeDAO" import="coffee.coffeeDTO"
    import="java.util.ArrayList"%>
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
			coffeeDAO cdao = new coffeeDAO();
			ArrayList<coffeeDTO> list = cdao.coffeeList();
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
			for(int i=1; i<list.size(); i++){
				coffeeDTO cdto = list.get(i);
		%>
				<tr>
					<td><%= cdto.getSaleno() %></td>
					<td><%= cdto.getPcode() %></td>
					<td><%= cdto.getSaledate() %></td>
					<td><%= cdto.getScode() %></td>
					<td><%= cdto.getAmount() %></td>
					<%-- <td><%= cdto.getName() %></td>
					<td><%= cdto.getSaledate() %></td> --%>
				</tr>
		<%
			}
		%>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>