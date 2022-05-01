<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dbms.DBConnect" import="coffee.coffeeDAO" import="coffee.coffeeDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>값 넘어가유~</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		int saleno = Integer.parseInt(request.getParameter("saleno"));
		String pcode = request.getParameter("pcode");
		String saledate = request.getParameter("saledate");
		String scode = request.getParameter("scode");
		int amount = Integer.parseInt(request.getParameter("amount"));
	%>
	<%
		coffeeDTO data = new coffeeDTO();
		data.setSaleno(saleno);
		data.setPcode(pcode);
		data.setSaledate(saledate);
		data.setScode(scode);
		data.setAmount(amount);
		
		coffeeDAO cdao = new coffeeDAO();
		cdao.CoffeeData(data);
		
		response.sendRedirect("index.jsp");
	%>
</body>
</html>