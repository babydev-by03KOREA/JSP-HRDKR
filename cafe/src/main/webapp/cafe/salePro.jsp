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
		// .trim()을 이용하여 사용자가 입력한 임의에 space값을 누락시킵니다.
		// 띄어쓰기가 들어가면, sql table에 지정한 값보다 overflow되어 에러가 발생할 수 있습니다.
		int saleno = Integer.parseInt(request.getParameter("saleno").trim());
		String pcode = request.getParameter("pcode").trim();
		String saledate = request.getParameter("saledate").trim();
		String scode = request.getParameter("scode").trim();
		int amount = Integer.parseInt(request.getParameter("amount").trim());
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